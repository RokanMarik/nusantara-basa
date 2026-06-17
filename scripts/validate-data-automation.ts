import { createClient } from "@supabase/supabase-js";
import { writeFileSync } from "fs";

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20"
);

interface ValidationResult {
  check: string;
  status: "pass" | "warning" | "error";
  count?: number;
  details?: string;
  examples?: string[];
}

async function validateData() {
  const results: ValidationResult[] = [];

  // Check 1: Duplicate language names
  const { data: duplicates } = await supabase
    .from("bahasa")
    .select("nama_bahasa, count(*)")
    .group("nama_bahasa")
    .having("count(*) > 1");

  results.push({
    check: "Duplicate language names",
    status: duplicates && duplicates.length > 0 ? "error" : "pass",
    count: duplicates?.length || 0,
    details: duplicates && duplicates.length > 0
      ? `Found ${duplicates.length} duplicate language names`
      : "No duplicate language names found",
    examples: duplicates?.slice(0, 5).map(d => d.nama_bahasa),
  });

  // Check 2: Languages without ISO codes
  const { count: noIsoCount } = await supabase
    .from("bahasa")
    .select("*", { count: "exact", head: true })
    .is("kode_iso_639", null);

  results.push({
    check: "Languages without ISO 639-3 codes",
    status: (noIsoCount || 0) > 700 ? "warning" : "pass",
    count: noIsoCount || 0,
    details: `${noIsoCount} languages without ISO codes (unique constraint prevents bulk assignment)`,
  });

  // Check 3: Languages without speaker data
  const { count: noSpeakerCount } = await supabase
    .from("bahasa")
    .select("*", { count: "exact", head: true })
    .is("jumlah_penutur", null);

  results.push({
    check: "Languages without speaker count",
    status: (noSpeakerCount || 0) > 1000 ? "warning" : "pass",
    count: noSpeakerCount || 0,
    details: `${noSpeakerCount} languages missing speaker count data`,
  });

  // Check 4: Languages without vitality status
  const { count: noVitalityCount } = await supabase
    .from("bahasa")
    .select("*", { count: "exact", head: true })
    .is("status_vitalitas", null);

  results.push({
    check: "Languages without vitality status",
    status: (noVitalityCount || 0) > 900 ? "warning" : "pass",
    count: noVitalityCount || 0,
    details: `${noVitalityCount} languages missing vitality classification`,
  });

  // Check 5: Languages without province
  const { count: noProvCount } = await supabase
    .from("bahasa")
    .select("*", { count: "exact", head: true })
    .is("provinsi", null);

  results.push({
    check: "Languages without province",
    status: (noProvCount || 0) > 350 ? "warning" : "pass",
    count: noProvCount || 0,
    details: `${noProvCount} languages missing province data`,
  });

  // Check 6: Languages without coordinates
  const { count: noCoordCount } = await supabase
    .from("bahasa")
    .select("*", { count: "exact", head: true })
    .is("koordinat_pusat", null);

  results.push({
    check: "Languages without coordinates",
    status: (noCoordCount || 0) > 900 ? "warning" : "pass",
    count: noCoordCount || 0,
    details: `${noCoordCount} languages missing geographic coordinates`,
  });

  // Check 7: Invalid vitality status values
  const { data: invalidVitality } = await supabase
    .from("bahasa")
    .select("status_vitalitas")
    .not("status_vitalitas", "in", '("Aman","Rentan","Terancam","Punah","Tidak Diketahui")')
    .not("status_vitalitas", "is", null);

  results.push({
    check: "Invalid vitality status values",
    status: invalidVitality && invalidVitality.length > 0 ? "error" : "pass",
    count: invalidVitality?.length || 0,
    details: invalidVitality && invalidVitality.length > 0
      ? `Found ${invalidVitality.length} records with non-standard vitality values`
      : "All vitality status values are valid",
    examples: invalidVitality?.slice(0, 5).map(v => v.status_vitalitas),
  });

  // Check 8: Languages marked as extinct but with speakers
  const { data: extinctWithSpeakers } = await supabase
    .from("bahasa")
    .select("nama_bahasa, jumlah_penutur")
    .eq("status_vitalitas", "Punah")
    .gt("jumlah_penutur", 0);

  results.push({
    check: "Languages marked as extinct but with speakers",
    status: extinctWithSpeakers && extinctWithSpeakers.length > 0 ? "error" : "pass",
    count: extinctWithSpeakers?.length || 0,
    details: extinctWithSpeakers && extinctWithSpeakers.length > 0
      ? `Found ${extinctWithSpeakers.length} languages marked as extinct but reporting speakers`
      : "No inconsistencies found",
    examples: extinctWithSpeakers?.slice(0, 5).map(e => `${e.nama_bahasa} (${e.jumlah_penutur} speakers)`),
  });

  // Check 9: Languages with zero speakers but not marked as extinct
  const { data: zeroNotExtinct } = await supabase
    .from("bahasa")
    .select("nama_bahasa, status_vitalitas")
    .eq("jumlah_penutur", 0)
    .neq("status_vitalitas", "Punah");

  results.push({
    check: "Languages with zero speakers but not marked as extinct",
    status: zeroNotExtinct && zeroNotExtinct.length > 0 ? "warning" : "pass",
    count: zeroNotExtinct?.length || 0,
    details: zeroNotExtinct && zeroNotExtinct.length > 0
      ? `Found ${zeroNotExtinct.length} languages with 0 speakers but status is not 'Punah'`
      : "All zero-speaker languages are correctly marked as extinct",
    examples: zeroNotExtinct?.slice(0, 5).map(z => `${z.nama_bahasa} (status: ${z.status_vitalitas})`),
  });

  // Check 10: Negative speaker counts
  const { data: negativeSpeakers } = await supabase
    .from("bahasa")
    .select("nama_bahasa, jumlah_penutur")
    .lt("jumlah_penutur", 0);

  results.push({
    check: "Negative speaker counts",
    status: negativeSpeakers && negativeSpeakers.length > 0 ? "error" : "pass",
    count: negativeSpeakers?.length || 0,
    details: negativeSpeakers && negativeSpeakers.length > 0
      ? `Found ${negativeSpeakers.length} languages with negative speaker counts`
      : "No negative speaker counts found",
    examples: negativeSpeakers?.slice(0, 5).map(n => `${n.nama_bahasa} (${n.jumlah_penutur})`),
  });

  // Generate report
  const passCount = results.filter(r => r.status === "pass").length;
  const warningCount = results.filter(r => r.status === "warning").length;
  const errorCount = results.filter(r => r.status === "error").length;

  const report = {
    timestamp: new Date().toISOString(),
    summary: {
      total: results.length,
      pass: passCount,
      warning: warningCount,
      error: errorCount,
      score: Math.round((passCount / results.length) * 100),
    },
    results,
  };

  return report;
}

// Run validation
validateData()
  .then((report) => {
    console.log("=".repeat(60));
    console.log("NUSANTARA BASA - DATA VALIDATION REPORT");
    console.log("=".repeat(60));
    console.log(`Timestamp: ${report.timestamp}`);
    console.log(`\nSummary:`);
    console.log(`  Total checks: ${report.summary.total}`);
    console.log(`  ✓ Pass: ${report.summary.pass}`);
    console.log(`  ⚠ Warning: ${report.summary.warning}`);
    console.log(`  ✗ Error: ${report.summary.error}`);
    console.log(`  Score: ${report.summary.score}%`);
    console.log("\n" + "-".repeat(60));

    report.results.forEach((r, i) => {
      const icon = r.status === "pass" ? "✓" : r.status === "warning" ? "⚠" : "✗";
      console.log(`\n${i + 1}. ${icon} ${r.check}`);
      console.log(`   ${r.details}`);
      if (r.count !== undefined) {
        console.log(`   Count: ${r.count}`);
      }
      if (r.examples && r.examples.length > 0) {
        console.log(`   Examples:`);
        r.examples.forEach(ex => console.log(`     - ${ex}`));
      }
    });

    console.log("\n" + "=".repeat(60));

    // Save to file
    const filename = `data-validation-${new Date().toISOString().split('T')[0]}.json`;
    writeFileSync(filename, JSON.stringify(report, null, 2));
    console.log(`\nReport saved to: ${filename}`);

    // Exit with error code if there are critical errors
    if (report.summary.error > 0) {
      process.exit(1);
    }
  })
  .catch((err) => {
    console.error("Validation failed:", err);
    process.exit(1);
  });
