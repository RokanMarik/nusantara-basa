const fs = require('fs');
const { execSync } = require('child_process');

console.log('=== RETRYING FAILED STATEMENTS ===\n');

const content = fs.readFileSync('data/import-vitality-statistik-2023-FINAL.sql', 'utf-8');

// Extract all statements
const statements = [];
const lines = content.split('\n');
let currentStatement = [];
let inStatement = false;

for (const line of lines) {
  const trimmed = line.trim();
  
  if (trimmed.startsWith('UPDATE ') || trimmed.startsWith('INSERT ')) {
    inStatement = true;
    currentStatement = [line];
    continue;
  }
  
  if (inStatement) {
    currentStatement.push(line);
    
    if (trimmed.endsWith(';')) {
      statements.push({
        sql: currentStatement.join('\n'),
        preview: currentStatement[0].substring(0, 80)
      });
      currentStatement = [];
      inStatement = false;
    }
  }
}

console.log(`Total statements: ${statements.length}\n`);

// Try each statement individually to find the problematic ones
const failed = [];
const successful = [];

for (let i = 0; i < statements.length; i++) {
  const stmt = statements[i];
  const singleFile = `data/retry-${i + 1}.sql`;
  
  fs.writeFileSync(singleFile, stmt.sql);
  
  try {
    execSync(
      `supabase db query --linked --file ${singleFile}`,
      { encoding: 'utf-8', timeout: 30000, stdio: ['pipe', 'pipe', 'pipe'] }
    );
    successful.push(i + 1);
    process.stdout.write(`✓ ${i + 1} `);
  } catch (err) {
    const errMsg = err.stderr?.trim() || err.message?.substring(0, 150);
    if (errMsg.includes('invalid message format')) {
      failed.push({
        index: i + 1,
        sql: stmt.sql,
        preview: stmt.preview
      });
      process.stdout.write(`✗ ${i + 1} `);
    } else if (errMsg.includes('duplicate key')) {
      // Already exists, that's OK
      successful.push(i + 1);
      process.stdout.write(`✓ ${i + 1} `);
    } else {
      failed.push({
        index: i + 1,
        sql: stmt.sql,
        preview: stmt.preview,
        error: errMsg
      });
      process.stdout.write(`✗ ${i + 1} `);
    }
  }
  
  try { fs.unlinkSync(singleFile); } catch {}
}

console.log(`\n\nSuccessful: ${successful.length}`);
console.log(`Failed: ${failed.length}`);

if (failed.length > 0) {
  console.log('\n=== FAILED STATEMENTS ===\n');
  
  failed.forEach((f, idx) => {
    console.log(`\n[${idx + 1}] Statement #${f.index}:`);
    console.log(f.sql);
    if (f.error) {
      console.log(`\nError: ${f.error}`);
    }
    console.log('\n' + '-'.repeat(60));
  });
  
  // Save failed statements to file for manual review
  fs.writeFileSync(
    'data/failed-statements.sql',
    failed.map(f => `-- Statement #${f.index}\n${f.sql}\n`).join('\n')
  );
  console.log('\n✓ Failed statements saved to: data/failed-statements.sql');
}
