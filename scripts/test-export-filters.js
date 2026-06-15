#!/usr/bin/env node
/**
 * Test Script for Enhanced Export API
 * Tests various filter combinations and field selections
 */

const BASE_URL = 'http://localhost:3000';

async function testExportAPI() {
  console.log('🧪 Testing Enhanced Export API\n');

  const tests = [
    {
      name: '1. Basic export (no filters)',
      params: {},
      expectedMinCount: 900,
    },
    {
      name: '2. Filter by vitalitas = Aman',
      params: { vitalitas: 'Aman' },
      expectedMinCount: 100,
    },
    {
      name: '3. Filter by provinsi = Papua',
      params: { provinsi: 'Papua' },
      expectedMinCount: 50,
    },
    {
      name: '4. Filter by min_penutur = 10000',
      params: { min_penutur: '10000' },
      expectedMinCount: 100,
    },
    {
      name: '5. Filter by max_penutur = 1000',
      params: { max_penutur: '1000' },
      expectedMinCount: 50,
    },
    {
      name: '6. Filter by egids = 6a',
      params: { egids: '6a' },
      expectedMinCount: 50,
    },
    {
      name: '7. Filter by rumpun = Austronesia',
      params: { rumpun: 'Austronesia' },
      expectedMinCount: 100,
    },
    {
      name: '8. Search for "jawa"',
      params: { search: 'jawa' },
      expectedMinCount: 1,
    },
    {
      name: '9. Custom fields: nama,iso,penutur',
      params: { fields: 'nama_bahasa,kode_iso_639,jumlah_penutur' },
      expectedMinCount: 900,
    },
    {
      name: '10. Combined filters: vitalitas=Aman + min_penutur=10000',
      params: { vitalitas: 'Aman', min_penutur: '10000' },
      expectedMinCount: 50,
    },
    {
      name: '11. CSV format export',
      params: { format: 'csv', vitalitas: 'Aman' },
      expectedMinCount: 100,
    },
    {
      name: '12. Edge case: No results (impossible filter)',
      params: { min_penutur: '999999999' },
      expectedMinCount: 0,
    },
  ];

  let passed = 0;
  let failed = 0;

  for (const test of tests) {
    const params = new URLSearchParams(test.params);
    const url = `${BASE_URL}/api/export?${params}`;

    try {
      console.log(`\n📋 ${test.name}`);
      console.log(`   URL: ${url}`);

      const response = await fetch(url);
      
      if (!response.ok) {
        console.log(`   ❌ HTTP Error: ${response.status}`);
        failed++;
        continue;
      }

      const contentType = response.headers.get('content-type');
      
      if (contentType?.includes('text/csv')) {
        const csv = await response.text();
        const lines = csv.trim().split('\n');
        const dataLines = lines.length - 1; // Subtract header
        
        console.log(`   ✓ CSV format, ${dataLines} rows`);
        
        if (dataLines >= test.expectedMinCount) {
          console.log(`   ✅ PASS (${dataLines} >= ${test.expectedMinCount})`);
          passed++;
        } else {
          console.log(`   ❌ FAIL (${dataLines} < ${test.expectedMinCount})`);
          failed++;
        }
      } else {
        const data = await response.json();
        const count = data.total || 0;
        
        console.log(`   ✓ JSON format, ${count} records`);
        console.log(`   ✓ Fields: ${data.fields?.join(', ')}`);
        
        if (count >= test.expectedMinCount) {
          console.log(`   ✅ PASS (${count} >= ${test.expectedMinCount})`);
          passed++;
        } else {
          console.log(`   ❌ FAIL (${count} < ${test.expectedMinCount})`);
          failed++;
        }
      }
    } catch (error) {
      console.log(`   ❌ ERROR: ${error.message}`);
      failed++;
    }
    // Wait 7 seconds between tests to avoid rate limiting
    if (test !== tests[tests.length - 1]) {
      console.log('   ⏳ Waiting 7 seconds to avoid rate limit...');
      await new Promise(resolve => setTimeout(resolve, 7000));
    }
  }

  console.log('\n' + '='.repeat(60));
  console.log(`\n📊 Test Results:`);
  console.log(`   ✅ Passed: ${passed}/${tests.length}`);
  console.log(`   ❌ Failed: ${failed}/${tests.length}`);
  console.log(`   📈 Success Rate: ${((passed/tests.length) * 100).toFixed(1)}%`);

  if (failed === 0) {
    console.log('\n🎉 All tests passed!');
    process.exit(0);
  } else {
    console.log('\n⚠️  Some tests failed. Please review.');
    process.exit(1);
  }
}

// Wait a bit for dev server to be ready
setTimeout(testExportAPI, 1000);
