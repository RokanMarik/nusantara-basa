const fs = require('fs');

// Read the query output (Supabase CLI format)
const rawContent = fs.readFileSync('data/validation-raw-data.json', 'utf8');

// Extract JSON from Supabase output (skip "Initialising login role..." line)
const jsonMatch = rawContent.match(/\{[\s\S]*\}/);
if (!jsonMatch) {
  console.error('Could not find JSON in output');
  process.exit(1);
}

const responseData = JSON.parse(jsonMatch[0]);
const data = responseData.rows;

console.log(`\n=== NUSANTARA BASA DATA VALIDATION ===`);
console.log(`Total languages with ISO codes: ${data.length}\n`);

// Initialize counters
const issues = [];
const stats = {
  total: data.length,
  egidsVitalitasMismatch: 0,
  extinctWithSpeakers: 0,
  vigorousWithZeroSpeakers: 0,
  duplicateISOCodes: 0
};

// Track ISO codes for duplicates
const isoMap = new Map();

// EGIDS to Vitalitas mapping (expected ranges)
const egidsToVitalitas = {
  '6a': ['Aman', 'Rentan'],
  '6b': ['Rentan', 'Mengalami Kemunduran', 'Sangat Terancam'],
  '7': ['Mengalami Kemunduran', 'Sangat Terancam'],
  '8a': ['Sangat Terancam', 'Hampir Punah'],
  '8b': ['Hampir Punah', 'Punah'],
  '9': ['Hampir Punah', 'Punah'],
  '10': ['Punah']
};

console.log(`--- VALIDATION CHECKS ---\n`);

data.forEach(lang => {
  const { nama_bahasa, kode_iso_639, egids_level, status_vitalitas, jumlah_penutur } = lang;
  
  // Check 1: Duplicate ISO codes
  if (isoMap.has(kode_iso_639)) {
    issues.push({
      type: 'DUPLICATE_ISO',
      bahasa: nama_bahasa,
      iso: kode_iso_639,
      duplicateOf: isoMap.get(kode_iso_639),
      severity: 'HIGH'
    });
    stats.duplicateISOCodes++;
  } else {
    isoMap.set(kode_iso_639, nama_bahasa);
  }
  
  // Check 2: EGIDS 10 (Extinct) but has speakers
  if (egids_level === '10' && jumlah_penutur > 0) {
    issues.push({
      type: 'EXTINCT_WITH_SPEAKERS',
      bahasa: nama_bahasa,
      iso: kode_iso_639,
      egids: egids_level,
      speakers: jumlah_penutur,
      vitalitas: status_vitalitas,
      severity: 'CRITICAL'
    });
    stats.extinctWithSpeakers++;
  }
  
  // Check 3: EGIDS 6a/6b but zero speakers
  if ((egids_level === '6a' || egids_level === '6b') && jumlah_penutur === 0) {
    issues.push({
      type: 'VIGOROUS_WITH_ZERO_SPEAKERS',
      bahasa: nama_bahasa,
      iso: kode_iso_639,
      egids: egids_level,
      speakers: jumlah_penutur,
      vitalitas: status_vitalitas,
      severity: 'HIGH'
    });
    stats.vigorousWithZeroSpeakers++;
  }
  
  // Check 4: Status "Punah" but has speakers
  if (status_vitalitas === 'Punah' && jumlah_penutur > 0) {
    issues.push({
      type: 'PUNAH_WITH_SPEAKERS',
      bahasa: nama_bahasa,
      iso: kode_iso_639,
      speakers: jumlah_penutur,
      egids: egids_level,
      vitalitas: status_vitalitas,
      severity: 'CRITICAL'
    });
    stats.extinctWithSpeakers++;
  }
  
  // Check 5: EGIDS level and Vitalitas mismatch
  if (egids_level && status_vitalitas) {
    const egidsNum = egids_level.replace(/\D/g, '').substring(0, 2);
    const expectedVitalitas = egidsToVitalitas[egidsNum];
    
    if (expectedVitalitas && !expectedVitalitas.includes(status_vitalitas)) {
      issues.push({
        type: 'EGIDS_VITALITAS_MISMATCH',
        bahasa: nama_bahasa,
        iso: kode_iso_639,
        egids: egids_level,
        vitalitas: status_vitalitas,
        expected: expectedVitalitas,
        severity: 'MEDIUM'
      });
      stats.egidsVitalitasMismatch++;
    }
  }
});

// Print statistics
console.log(`STATISTICS:`);
console.log(`- Total languages: ${stats.total}`);
console.log(`- Duplicate ISO codes: ${stats.duplicateISOCodes}`);
console.log(`- Extinct with speakers: ${stats.extinctWithSpeakers}`);
console.log(`- Vigorous with zero speakers: ${stats.vigorousWithZeroSpeakers}`);
console.log(`- EGIDS/Vitalitas mismatches: ${stats.egidsVitalitasMismatch}`);
console.log(`- Total issues found: ${issues.length}\n`);

// Group issues by severity
const critical = issues.filter(i => i.severity === 'CRITICAL');
const high = issues.filter(i => i.severity === 'HIGH');
const medium = issues.filter(i => i.severity === 'MEDIUM');

console.log(`--- CRITICAL ISSUES (${critical.length}) ---\n`);
critical.forEach((issue, idx) => {
  console.log(`${idx + 1}. [${issue.type}] ${issue.bahasa} (${issue.iso})`);
  if (issue.speakers !== undefined) console.log(`   Speakers: ${issue.speakers}`);
  if (issue.egids) console.log(`   EGIDS: ${issue.egids}`);
  if (issue.vitalitas) console.log(`   Vitalitas: ${issue.vitalitas}`);
  if (issue.expected) console.log(`   Expected: ${issue.expected.join(', ')}`);
  console.log();
});

console.log(`--- HIGH PRIORITY ISSUES (${high.length}) ---\n`);
high.slice(0, 20).forEach((issue, idx) => {
  console.log(`${idx + 1}. [${issue.type}] ${issue.bahasa} (${issue.iso})`);
  if (issue.speakers !== undefined) console.log(`   Speakers: ${issue.speakers}`);
  if (issue.egids) console.log(`   EGIDS: ${issue.egids}`);
  if (issue.vitalitas) console.log(`   Vitalitas: ${issue.vitalitas}`);
  if (issue.expected) console.log(`   Expected: ${issue.expected.join(', ')}`);
  console.log();
});

console.log(`--- MEDIUM PRIORITY ISSUES (${medium.length}) ---\n`);
medium.slice(0, 10).forEach((issue, idx) => {
  console.log(`${idx + 1}. [${issue.type}] ${issue.bahasa} (${issue.iso})`);
  if (issue.egids) console.log(`   EGIDS: ${issue.egids}`);
  if (issue.vitalitas) console.log(`   Vitalitas: ${issue.vitalitas}`);
  if (issue.expected) console.log(`   Expected: ${issue.expected.join(', ')}`);
  console.log();
});

// Export ISO codes for Glottolog validation
const isoList = data.map(d => d.kode_iso_639).filter(Boolean);
fs.writeFileSync('data/iso-codes-for-validation.json', JSON.stringify(isoList, null, 2));
console.log(`\n--- EXPORTED DATA ---`);
console.log(`ISO codes exported to: data/iso-codes-for-validation.json (${isoList.length} codes)`);

// Save full validation report
const report = {
  timestamp: new Date().toISOString(),
  statistics: stats,
  issues: issues
};
fs.writeFileSync('data/validation-report.json', JSON.stringify(report, null, 2));
console.log(`Full validation report: data/validation-report.json`);
