const https = require('https');

const options = {
  hostname: 'petabahasa.kemendikdasmen.go.id',
  path: '/databahasa.php',
  method: 'GET',
  headers: {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
  }
};

const req = https.request(options, (res) => {
  let data = '';
  
  res.on('data', (chunk) => {
    data += chunk;
  });
  
  res.on('end', () => {
    console.error(`Received ${data.length} bytes`);
    
    // Parse language entries
    const languages = [];
    const rowPattern = /<tr[^>]*bgcolor=#[a-f0-9]+[^>]*>\s*<td[^>]*>\s*<a[^>]*>\s*<\/a>(\d+)\.\s*<\/td>\s*<td[^>]*>\s*<strong>(.*?)<\/strong>\s*<\/td>\s*<td[^>]*>\s*<b>(.*?)<\/b>\s*<\/td>\s*<td[^>]*>(.*?)<\/td>/gis;
    
    let match;
    while ((match = rowPattern.exec(data)) !== null) {
      const no = parseInt(match[1]);
      const nama = match[2].trim().replace(/<[^>]*>/g, '').replace(/\s+/g, ' ');
      const wilayah = match[3].trim().replace(/<[^>]*>/g, '');
      
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
    console.log(JSON.stringify(languages, null, 2));
  });
});

req.on('error', (error) => {
  console.error(`Error: ${error.message}`);
  process.exit(1);
});

req.end();
