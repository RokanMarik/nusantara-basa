const fs = require('fs');
const { execSync } = require('child_process');

console.log('=== SPLIT AND EXECUTE SQL IN BATCHES ===\n');

const content = fs.readFileSync('data/import-vitality-statistik-2023-FINAL.sql', 'utf-8');

// Extract UPDATE and INSERT statements
const statements = [];
const lines = content.split('\n');
let currentStatement = [];
let inStatement = false;

for (const line of lines) {
  const trimmed = line.trim();
  
  // Start of statement
  if (trimmed.startsWith('UPDATE ') || trimmed.startsWith('INSERT ')) {
    inStatement = true;
    currentStatement = [line];
    continue;
  }
  
  // Inside statement
  if (inStatement) {
    currentStatement.push(line);
    
    // End of statement (semicolon)
    if (trimmed.endsWith(';')) {
      statements.push(currentStatement.join('\n'));
      currentStatement = [];
      inStatement = false;
    }
  }
}

console.log(`Found ${statements.length} statements total\n`);

// Split into batches
const batchSize = 5;
const batches = [];
for (let i = 0; i < statements.length; i += batchSize) {
  batches.push(statements.slice(i, i + batchSize));
}

console.log(`Split into ${batches.length} batches (${batchSize} statements each)\n`);

// Execute each batch
let successCount = 0;
let failCount = 0;

for (let batchIdx = 0; batchIdx < batches.length; batchIdx++) {
  const batch = batches[batchIdx];
  const batchNum = batchIdx + 1;
  const batchFile = `data/batch-${batchNum}.sql`;
  
  console.log(`Batch ${batchNum}/${batches.length} (${batch.length} statements)...`);
  
  // Write batch file
  fs.writeFileSync(batchFile, batch.join('\n\n') + '\n');
  
  try {
    const result = execSync(
      `supabase db query --linked --file ${batchFile}`,
      { encoding: 'utf-8', timeout: 60000, stdio: ['pipe', 'pipe', 'pipe'] }
    );
    successCount += batch.length;
    console.log(`  ✓ OK`);
  } catch (err) {
    failCount += batch.length;
    console.log(`  ✗ FAILED: ${err.stderr?.trim() || err.message?.substring(0, 200)}`);
    
    // Try executing one by one for this batch
    console.log(`  Retrying individually...`);
    for (let i = 0; i < batch.length; i++) {
      const singleFile = `data/single-${batchNum}-${i + 1}.sql`;
      fs.writeFileSync(singleFile, batch[i]);
      
      try {
        execSync(
          `supabase db query --linked --file ${singleFile}`,
          { encoding: 'utf-8', timeout: 30000, stdio: ['pipe', 'pipe', 'pipe'] }
        );
        console.log(`    Statement ${i + 1}: ✓`);
        failCount--;
        successCount++;
      } catch (singleErr) {
        console.log(`    Statement ${i + 1}: ✗ ${singleErr.stderr?.trim()?.substring(0, 150) || 'error'}`);
      }
      
      // Clean up single file
      try { fs.unlinkSync(singleFile); } catch {}
    }
  }
  
  // Clean up batch file
  try { fs.unlinkSync(batchFile); } catch {}
}

console.log('\n' + '='.repeat(60));
console.log('EXECUTION SUMMARY');
console.log('='.repeat(60));
console.log(`✅ Successful: ${successCount}`);
console.log(`❌ Failed: ${failCount}`);
console.log(`📊 Total: ${statements.length}`);
