/**
 * Parse Petabahsa HTML and extract all 718 languages
 * Generate SQL INSERT statements
 */

const fs = require('fs');
const path = require('path');

// Read HTML from stdin or file
let html = '';

if (process.stdin.isTTY) {
  // Read from file
  const htmlFile = path.join(__dirname, '..', 'data', 'petabahsa.html');
  html = fs.readFileSync(htmlFile, 'utf-8');
} else {
  // Read from stdin
  html = fs.readFileSync(0, 'utf-8');
}

console.error(`Processing ${html.length} bytes of HTML...`);

// Parse language entries
const languages = [];

// Match each table row
const rowPattern = /<tr[^>]*bgcolor=#[a-f0-9]+[^>]*>\s*<td[^>]*>\s*<a[^>]*>\s*<\/a>(\d+)\.\s*<\/td>\s*<td[^>]*>\s*<strong>(.*?)<\/strong>\s*<\/td>\s*<td[^>]*>\s*<b>(.*?)<\/b>\s*<\/td>\s*<td[^>]*>(.*?)<\/td>/gis;

let match;
while ((match = rowPattern.exec(html)) !== null) {
  const no = parseInt(match[1]);
  const nama = match[2].trim().replace(/<[^>]*>/g, '').replace(/\s+/g, ' ');
  const wilayah = match[3].trim().replace(/<[^>]*>/g, '');
  
  // Extract all provinces from the 4th column
  const provHtml = match[4];
  const provMatches = provHtml.match(/<u>([^<]*)<\/u>/g);
  const provinsis = provMatches 
    ? provMatches.map(p => p.replace(/<\/?u>/g, '').trim())
    : [];
  
  languages.push({
    no,
    nama,
    wilayah,
    provinsis,
    provinsi_str: provinsis.join(', ')
  });
}

console.error(`Extracted ${languages.length} languages`);

// Generate SQL
const sql = [];
sql.push('-- Insert languages from Petabahsa Kemdikbud');
sql.push('-- Source: https://petabahsa.kemendikdasmen.go.id/databahasa.php');
sql.push(`-- Date: ${new Date().toISOString()}`);
sql.push(`-- Total: ${languages.length} languages`);
sql.push('');

// Create rumpun_bahasa entries first
sql.push('-- Insert rumpun bahasa if not exists');
sql.push(`INSERT INTO rumpun_bahasa (id, nama) VALUES`);
sql.push(`  ('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Austronesia')`);
sql.push(`ON CONFLICT (id) DO NOTHING;`);
sql.push('');

// Insert languages
sql.push('-- Insert languages');
languages.forEach(lang => {
  const nama_escaped = lang.nama.replace(/'/g, "''");
  const wilayah_escaped = lang.wilayah.replace(/'/g, "''");
  const provinsi_escaped = lang.provinsi_str.replace(/'/g, "''");
  
  sql.push(`INSERT INTO bahasa (nama, wilayah, provinsi, rumpun_id, catatan) VALUES (`);
  sql.push(`  '${nama_escaped}',`);
  sql.push(`  '${wilayah_escaped}',`);
  sql.push(`  '${provinsi_escaped}',`);
  sql.push(`  'f47ac10b-58cc-4372-a567-0e02b2c3d479',`);
  sql.push(`  'Imported from Petabahsa Kemdikbud - No. ${lang.no}'`);
  sql.push(`) ON CONFLICT (nama) DO NOTHING;`);
  sql.push('');
});

// Output SQL
console.log(sql.join('\n'));

console.error('SQL generation complete');
