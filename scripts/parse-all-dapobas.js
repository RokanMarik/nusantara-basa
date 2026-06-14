const fs = require('fs');
const path = require('path');

const totalPages = 8;
const allLanguages = [];

for (let p = 1; p <= totalPages; p++) {
    const filePath = `data/dapobas-page${p}.html`;
    
    if (!fs.existsSync(filePath)) {
        console.error(`File not found: ${filePath}`);
        continue;
    }
    
    const html = fs.readFileSync(filePath, 'utf-8');
    
    // Extract from table with datatable class
    const tables = [...html.matchAll(/<table[^>]*>([\s\S]*?)<\/table>/g)];
    
    if (tables.length < 5) {
        console.error(`Page ${p}: Not enough tables found`);
        continue;
    }
    
    const mainTable = tables[4][1];
    
    // Find all data rows (excluding header)
    const rows = [...mainTable.matchAll(/<tr[^>]*>([\s\S]*?)<\/tr>/g)].slice(2);
    
    console.log(`Page ${p}: Found ${rows.length} rows`);
    
    // Parse each row
    let pageAdded = 0;
    for (const row of rows) {
        const cells = [...row[1].matchAll(/<td[^>]*>([\s\S]*?)<\/td>/g)];
        
        if (cells.length >= 4) {
            const noText = cells[0][1].replace(/<[^>]+>/g, '').trim();
            const no = parseInt(noText.split('.')[0]);
            const nama = cells[1][1].replace(/<[^>]+>/g, '').trim();
            const wilayah = cells[2][1].replace(/<[^>]+>/g, '').trim();
            const provinsi = cells[3][1].replace(/<[^>]+>/g, '').trim();
            
            if (nama && no) {
                allLanguages.push({ no, nama, wilayah, provinsi, page: p });
                pageAdded++;
            }
        }
    }
    
    console.log(`  Parsed ${pageAdded} languages from page ${p}`);
}

// Sort by number
allLanguages.sort((a, b) => a.no - b.no);

console.log(`\nTotal languages parsed: ${allLanguages.length}`);

// Save to JSON
fs.writeFileSync('data/dapobas-all-parsed.json', JSON.stringify(allLanguages, null, 2));
console.log('Saved to data/dapobas-all-parsed.json');

// Show first 10 and last 10
console.log('\nFirst 10 entries:');
for (let i = 0; i < Math.min(10, allLanguages.length); i++) {
    console.log(`  ${allLanguages[i].no}. ${allLanguages[i].nama} (${allLanguages[i].wilayah}) - ${allLanguages[i].provinsi}`);
}

console.log('\nLast 10 entries:');
for (let i = Math.max(0, allLanguages.length - 10); i < allLanguages.length; i++) {
    console.log(`  ${allLanguages[i].no}. ${allLanguages[i].nama} (${allLanguages[i].wilayah}) - ${allLanguages[i].provinsi}`);
}

// Statistics
const wilayahSet = new Set(allLanguages.map(l => l.wilayah));
const provinsiList = allLanguages.map(l => l.provinsi).filter(p => p).flatMap(p => p.split(',').map(x => x.trim())).filter(p => p);
const provinsiSet = new Set(provinsiList);

console.log('\nStatistics:');
console.log(`  Total regions: ${wilayahSet.size}`);
console.log(`  Regions: ${Array.from(wilayahSet).join(', ')}`);
console.log(`  Total unique provinces: ${provinsiSet.size}`);
