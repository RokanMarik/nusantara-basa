const fs = require('fs');

// Read raw Supabase output (contains boundary + rows + warning)
const raw = fs.readFileSync('data/db-lang-raw.json', 'utf-8');

// Extract just the "rows" array - it's between line 3 and line before warning
const lines = raw.split('\n');
let rowsStart = -1;
let rowsEnd = -1;

for (let i = 0; i < lines.length; i++) {
  if (lines[i].includes('"rows": [')) rowsStart = i;
  if (lines[i].includes('"warning":')) {
    rowsEnd = i - 1;
    break;
  }
}

if (rowsStart === -1 || rowsEnd === -1) {
  console.error('Could not find rows in output');
  process.exit(1);
}

// Extract row data
const rowsContent = lines.slice(rowsStart + 1, rowsEnd).join('\n');
// Clean up the rows content - remove the outer bracket and handle multi-line entries
const cleaned = rowsContent.replace(/^\[\s*|\s*\]$/g, '').trim();

// Parse each row manually since they're spread across multiple lines
const rows = [];
let currentRow = '';
let braceCount = 0;
let inObject = false;

cleaned.split('').forEach(char => {
  if (char === '{') {
    braceCount++;
    inObject = true;
  }
  
  if (inObject) {
    currentRow += char;
  }
  
  if (char === '}') {
    braceCount--;
    if (braceCount === 0) {
      try {
        const obj = JSON.parse(currentRow.trim());
        rows.push(obj);
      } catch (e) {
        console.error('Failed to parse row:', currentRow.substring(0, 100));
      }
      currentRow = '';
      inObject = false;
    }
  }
});

console.log(`Extracted ${rows.length} languages from database`);

// Save as clean JSON
fs.writeFileSync('data/bahasa-list.json', JSON.stringify(rows, null, 2));
console.log('Saved to data/bahasa-list.json');

// Show first 5 and last 5
console.log('\nFirst 5:');
rows.slice(0, 5).forEach(r => console.log(`  ${r.id}: ${r.nama_bahasa}`));

console.log('\nLast 5:');
rows.slice(-5).forEach(r => console.log(`  ${r.id}: ${r.nama_bahasa}`));
