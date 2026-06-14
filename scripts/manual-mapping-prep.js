const fs = require('fs');

console.log('=== MANUAL MAPPING PREPARATION ===\n');

// Load unmatched languages
const unmatched = JSON.parse(fs.readFileSync('data/unmatched-vitality-languages.json', 'utf-8'));

// Load database languages
const dbLangs = JSON.parse(fs.readFileSync('data/bahasa-list.json', 'utf-8'));

// Create comprehensive search index
const searchIndex = {
  exact: {},
  normalized: {},
  withoutBahasa: {},
  partial: {}
};

dbLangs.forEach(lang => {
  const original = lang.nama_bahasa.toLowerCase().trim();
  const normalized = original.replace(/\s+/g, ' ');
  const withoutBahasa = normalized.replace(/^bahasa\s+/i, '');
  
  searchIndex.exact[original] = lang;
  searchIndex.normalized[normalized] = lang;
  searchIndex.withoutBahasa[withoutBahasa] = lang;
});

console.log(`Database has ${dbLangs.length} languages\n`);
console.log('═'.repeat(80));
console.log('MANUAL MAPPING WORKSHEET');
console.log('═'.repeat(80));

// Group by status for easier review
const byStatus = {
  'Rentan': [],
  'Mengalami Kemunduran': [],
  'Terancam Punah': [],
  'Punah': []
};

unmatched.forEach(lang => {
  if (byStatus[lang.status]) {
    byStatus[lang.status].push(lang);
  }
});

// Analyze each unmatched language
const mappingSuggestions = [];

Object.keys(byStatus).sort().forEach(status => {
  console.log(`\n【${status}】 - ${byStatus[status].length} bahasa`);
  console.log('─'.repeat(80));
  
  byStatus[status].forEach((lang, idx) => {
    const num = String(idx + 1).padStart(2, '0');
    console.log(`\n${num}. ${lang.nama}`);
    
    // Show original if different
    if (lang.original && lang.original !== `Bahasa ${lang.nama}`) {
      console.log(`   Original: ${lang.original}`);
    }
    
    // Extract alias if exists
    const aliasMatch = lang.original.match(/\(([^)]+)\)/);
    const alias = aliasMatch ? aliasMatch[1] : null;
    if (alias) {
      console.log(`   Alias: ${alias}`);
    }
    
    // Search strategies
    const candidates = [];
    const searchName = lang.nama.toLowerCase();
    
    // Strategy 1: Exact match without "Bahasa"
    const withoutBahasa = searchName.replace(/^bahasa\s+/i, '');
    if (searchIndex.withoutBahasa[withoutBahasa]) {
      candidates.push({
        name: searchIndex.withoutBahasa[withoutBahasa].nama_bahasa,
        id: searchIndex.withoutBahasa[withoutBahasa].id,
        confidence: 95,
        reason: 'Exact match (without "Bahasa" prefix)'
      });
    }
    
    // Strategy 2: Search alias if exists
    if (alias) {
      const aliasLower = alias.toLowerCase();
      const aliasMatch = dbLangs.find(l => 
        l.nama_bahasa.toLowerCase().includes(aliasLower) ||
        aliasLower.includes(l.nama_bahasa.toLowerCase())
      );
      if (aliasMatch) {
        candidates.push({
          name: aliasMatch.nama_bahasa,
          id: aliasMatch.id,
          confidence: 85,
          reason: `Alias match: "${alias}"`
        });
      }
    }
    
    // Strategy 3: Partial match - first word
    const firstWord = withoutBahasa.split(' ')[0];
    if (firstWord.length > 3) {
      const partialMatches = dbLangs.filter(l => {
        const dbName = l.nama_bahasa.toLowerCase();
        return dbName.includes(firstWord) && !dbName.includes(searchName);
      }).slice(0, 3);
      
      partialMatches.forEach(m => {
        candidates.push({
          name: m.nama_bahasa,
          id: m.id,
          confidence: 70,
          reason: `Partial match: "${firstWord}"`
        });
      });
    }
    
    // Strategy 4: Last word match (for compound names)
    const words = withoutBahasa.split(' ');
    if (words.length > 1) {
      const lastWord = words[words.length - 1];
      if (lastWord.length > 3) {
        const lastMatches = dbLangs.filter(l => {
          const dbName = l.nama_bahasa.toLowerCase();
          return dbName.includes(lastWord) && !dbName.includes(searchName);
        }).slice(0, 2);
        
        lastMatches.forEach(m => {
          candidates.push({
            name: m.nama_bahasa,
            id: m.id,
            confidence: 65,
            reason: `Last word match: "${lastWord}"`
          });
        });
      }
    }
    
    // Strategy 5: Similar sounding (simple phonetic)
    const phoneticMatches = dbLangs.filter(l => {
      const dbName = l.nama_bahasa.toLowerCase();
      // Check if starts with same 4 letters
      return dbName.startsWith(withoutBahasa.substring(0, 4)) && 
             !dbName.includes(searchName);
    }).slice(0, 2);
    
    phoneticMatches.forEach(m => {
      candidates.push({
        name: m.nama_bahasa,
        id: m.id,
        confidence: 60,
        reason: 'Similar phonetic start'
      });
    });
    
    // Remove duplicates and sort by confidence
    const uniqueCandidates = [];
    const seen = new Set();
    
    candidates.forEach(c => {
      if (!seen.has(c.id)) {
        seen.add(c.id);
        uniqueCandidates.push(c);
      }
    });
    
    uniqueCandidates.sort((a, b) => b.confidence - a.confidence);
    
    // Display suggestions
    if (uniqueCandidates.length > 0) {
      console.log('   🔍 Suggestions:');
      uniqueCandidates.slice(0, 5).forEach(c => {
        const conf = c.confidence >= 80 ? '✓' : c.confidence >= 70 ? '~' : '?';
        console.log(`   [${conf}${c.confidence}%] → ${c.name}`);
        console.log(`            ${c.reason}`);
      });
      
      mappingSuggestions.push({
        unmatched: lang,
        candidates: uniqueCandidates.slice(0, 5)
      });
    } else {
      console.log('   ❌ No suggestions found - likely a new language');
      mappingSuggestions.push({
        unmatched: lang,
        candidates: []
      });
    }
    
    // Add decision marker for manual review
    console.log(`   📝 Decision: [ ] MAP to existing [ ] INSERT new [ ] SKIP`);
  });
});

console.log('\n' + '═'.repeat(80));
console.log('SUMMARY');
console.log('═'.repeat(80));
console.log(`\nTotal unmatched: ${unmatched.length}`);
console.log(`With suggestions: ${mappingSuggestions.filter(m => m.candidates.length > 0).length}`);
console.log(`No suggestions (likely new): ${mappingSuggestions.filter(m => m.candidates.length === 0).length}`);

// Save mapping worksheet
fs.writeFileSync(
  'data/manual-mapping-worksheet.json',
  JSON.stringify(mappingSuggestions, null, 2)
);

console.log('\n✓ Mapping worksheet saved to: data/manual-mapping-worksheet.json');
console.log('\n📋 NEXT STEPS:');
console.log('1. Review each language in the worksheet');
console.log('2. Mark decision: MAP / INSERT / SKIP');
console.log('3. For MAP: specify target language ID');
console.log('4. Generate final SQL based on decisions');
