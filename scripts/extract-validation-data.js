#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

// Read artifact content
const artifactPath = path.join(__dirname, '../.omp/artifacts/824');
const artifactContent = fs.readFileSync(artifactPath, 'utf8');

// Parse JSON from artifact (it's the full Supabase response)
const responseData = JSON.parse(artifactContent);

// Extract rows array
const rows = responseData.rows || [];

// Save to validation-raw-data.json
const outputPath = path.join(__dirname, '../data/validation-raw-data.json');
fs.writeFileSync(outputPath, JSON.stringify(rows, null, 2));

console.log(`✓ Extracted ${rows.length} languages`);
console.log(`✓ Saved to ${outputPath}`);
