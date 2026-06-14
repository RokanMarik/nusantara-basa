const fs = require('fs');

const content = fs.readFileSync('C:\\Users\\Rokan Akbar Marik\\Downloads\\statistik-kebahasaan-2023.md', 'utf-8');
const lines = content.split('\n');

console.log('Total lines:', lines.length);

// Read specific sections
function readSection(startLine, endLine, label) {
  console.log(`\n${'='.repeat(60)}`);
  console.log(`${label} (Lines ${startLine}-${endLine})`);
  console.log('='.repeat(60));
  for (let i = startLine; i <= endLine && i < lines.length; i++) {
    console.log(`${i}: ${lines[i]}`);
  }
}

// 1. Table of Contents (around line 197-210)
readSection(195, 215, 'DAFTAR ISI - Bahasa Daerah');

// 2. Provinsi distribution (around line 268)
readSection(265, 290, 'PERSEBARAN BAHASA MENURUT PROVINSI');

// 3. Vitalitas section (around line 2076)
readSection(2070, 2150, 'VITALITAS BAHASA DAERAH');

// 4. Check for data tables (look for patterns)
console.log('\n' + '='.repeat(60));
console.log('SEARCHING FOR DATA TABLES');
console.log('='.repeat(60));

let tableCount = 0;
for (let i = 0; i < lines.length; i++) {
  const line = lines[i].trim();
  // Look for lines that might be table headers
  if (line.match(/^\|.*\|$/) || line.includes('Provinsi') && line.includes('Bahasa')) {
    tableCount++;
    if (tableCount <= 10) {
      console.log(`\nLine ${i}: ${line.substring(0, 150)}`);
      // Show next 5 lines
      for (let j = 1; j <= 5 && i+j < lines.length; j++) {
        console.log(`  +${j}: ${lines[i+j].substring(0, 150)}`);
      }
    }
  }
}

console.log(`\nTotal potential table headers found: ${tableCount}`);
