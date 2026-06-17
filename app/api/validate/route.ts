import { NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";
export const dynamic = "force-dynamic";



interface ValidationCheck {
  id: string;
  name: string;
  description: string;
  status: "pass" | "warning" | "fail";
  severity: "low" | "medium" | "high" | "critical";
  count?: number;
  details?: string;
  examples?: Array<{ id: string; nama_bahasa: string; issue: string }>;
}

interface ValidationResult {
  timestamp: string;
  total_checks: number;
  pass_count: number;
  warning_count: number;
  fail_count: number;
  score: number;
  checks: ValidationCheck[];
}

export async function GET() {
  try {
    const checks: ValidationCheck[] = [];

    // Check 1: Duplicate language names
    const { data: duplicates, error: dupError } = await supabase.rpc('find_duplicate_languages');
    if (!dupError && duplicates && duplicates.length > 0) {
      checks.push({
        id: "duplicate_names",
        name: "Nama Bahasa Duplikat",
        description: "Mengecek bahasa dengan nama yang sama",
        status: duplicates.length > 0 ? "fail" : "pass",
        severity: "high",
        count: duplicates.length,
        details: `Ditemukan ${duplicates.length} duplikat`,
        examples: duplicates.slice(0, 5).map((d: any) => ({
          id: d.id,
          nama_bahasa: d.nama_bahasa,
          issue: `Duplikat dengan ${d.duplicate_count} entri`
        }))
      });
    } else {
      checks.push({
        id: "duplicate_names",
        name: "Nama Bahasa Duplikat",
        description: "Mengecek bahasa dengan nama yang sama",
        status: "pass",
        severity: "high",
        count: 0,
        details: "Tidak ada duplikat"
      });
    }

    // Check 2: Languages without ISO code
    const { count: noIsoCount } = await supabase
      .from("bahasa")
      .select("*", { count: "exact", head: true })
      .is("kode_iso_639", null);

    const totalLanguages = await supabase.from("bahasa").select("*", { count: "exact", head: true });
    const total = totalLanguages.count || 0;
    const isoPercentage = total > 0 ? ((total - (noIsoCount || 0)) / total) * 100 : 0;

    checks.push({
      id: "missing_iso_code",
      name: "Kode ISO 639-3",
      description: "Mengecek bahasa tanpa kode ISO 639-3",
      status: isoPercentage >= 80 ? "pass" : isoPercentage >= 60 ? "warning" : "fail",
      severity: "medium",
      count: noIsoCount || 0,
      details: `${noIsoCount} bahasa (${(100 - isoPercentage).toFixed(1)}%) tanpa kode ISO`
    });

    // Check 3: Languages without coordinates
    const { count: noCoordsCount } = await supabase
      .from("bahasa")
      .select("*", { count: "exact", head: true })
      .or("latitude.is.null,longitude.is.null");

    const coordsPercentage = total > 0 ? ((total - (noCoordsCount || 0)) / total) * 100 : 0;

    checks.push({
      id: "missing_coordinates",
      name: "Koordinat Geografis",
      description: "Mengecek bahasa tanpa koordinat",
      status: coordsPercentage >= 70 ? "pass" : coordsPercentage >= 50 ? "warning" : "fail",
      severity: "medium",
      count: noCoordsCount || 0,
      details: `${noCoordsCount} bahasa (${(100 - coordsPercentage).toFixed(1)}%) tanpa koordinat`
    });

    // Check 4: Languages without vitality status
    const { count: noVitalitasCount } = await supabase
      .from("bahasa")
      .select("*", { count: "exact", head: true })
      .is("status_vitalitas", null);

    const vitalitasPercentage = total > 0 ? ((total - (noVitalitasCount || 0)) / total) * 100 : 0;

    checks.push({
      id: "missing_vitalitas",
      name: "Status Vitalitas",
      description: "Mengecek bahasa tanpa status vitalitas",
      status: vitalitasPercentage >= 90 ? "pass" : vitalitasPercentage >= 70 ? "warning" : "fail",
      severity: "high",
      count: noVitalitasCount || 0,
      details: `${noVitalitasCount} bahasa (${(100 - vitalitasPercentage).toFixed(1)}%) tanpa status vitalitas`
    });

    // Check 5: Languages with 0 speakers but not marked as extinct
    const { data: zeroSpeakers, error: zeroError } = await supabase
      .from("bahasa")
      .select("id, nama_bahasa, jumlah_penutur, status_vitalitas")
      .eq("jumlah_penutur", 0)
      .neq("status_vitalitas", "Punah")
      .limit(5);

    const { count: zeroNotExtinctCount } = await supabase
      .from("bahasa")
      .select("*", { count: "exact", head: true })
      .eq("jumlah_penutur", 0)
      .neq("status_vitalitas", "Punah");

    checks.push({
      id: "zero_speakers_not_extinct",
      name: "Inkonsistensi Penutur Nol",
      description: "Bahasa dengan 0 penutur tapi tidak ditandai sebagai Punah",
      status: (zeroNotExtinctCount || 0) === 0 ? "pass" : "warning",
      severity: "medium",
      count: zeroNotExtinctCount || 0,
      details: (zeroNotExtinctCount || 0) === 0 ? "Tidak ada inkonsistensi" : `${zeroNotExtinctCount} bahasa dengan 0 penutur tidak ditandai Punah`,
      examples: zeroSpeakers?.map(b => ({
        id: b.id,
        nama_bahasa: b.nama_bahasa,
        issue: `0 penutur tapi status: ${b.status_vitalitas || 'tidak ada'}`
      }))
    });

    // Check 6: Languages with extinct status but have speakers
    const { data: extinctWithSpeakers, error: extinctError } = await supabase
      .from("bahasa")
      .select("id, nama_bahasa, jumlah_penutur, status_vitalitas")
      .eq("status_vitalitas", "Punah")
      .gt("jumlah_penutur", 0)
      .limit(5);

    const { count: extinctWithSpeakersCount } = await supabase
      .from("bahasa")
      .select("*", { count: "exact", head: true })
      .eq("status_vitalitas", "Punah")
      .gt("jumlah_penutur", 0);

    checks.push({
      id: "extinct_with_speakers",
      name: "Inkonsistensi Status Punah",
      description: "Bahasa ditandai Punah tapi masih ada penutur",
      status: (extinctWithSpeakersCount || 0) === 0 ? "pass" : "fail",
      severity: "critical",
      count: extinctWithSpeakersCount || 0,
      details: (extinctWithSpeakersCount || 0) === 0 ? "Tidak ada inkonsistensi" : `${extinctWithSpeakersCount} bahasa ditandai Punah tapi masih ada penutur`,
      examples: extinctWithSpeakers?.map(b => ({
        id: b.id,
        nama_bahasa: b.nama_bahasa,
        issue: `Status Punah tapi ${b.jumlah_penutur} penutur`
      }))
    });

    // Check 7: Languages without province
    const { count: noProvinceCount } = await supabase
      .from("bahasa")
      .select("*", { count: "exact", head: true })
      .is("provinsi", null);

    const provincePercentage = total > 0 ? ((total - (noProvinceCount || 0)) / total) * 100 : 0;

    checks.push({
      id: "missing_province",
      name: "Data Provinsi",
      description: "Mengecek bahasa tanpa data provinsi",
      status: provincePercentage >= 90 ? "pass" : provincePercentage >= 70 ? "warning" : "fail",
      severity: "low",
      count: noProvinceCount || 0,
      details: `${noProvinceCount} bahasa (${(100 - provincePercentage).toFixed(1)}%) tanpa provinsi`
    });

    // Check 8: Languages without speaker count
    const { count: noSpeakersCount } = await supabase
      .from("bahasa")
      .select("*", { count: "exact", head: true })
      .is("jumlah_penutur", null);

    const speakersPercentage = total > 0 ? ((total - (noSpeakersCount || 0)) / total) * 100 : 0;

    checks.push({
      id: "missing_speakers",
      name: "Jumlah Penutur",
      description: "Mengecek bahasa tanpa data jumlah penutur",
      status: speakersPercentage >= 80 ? "pass" : speakersPercentage >= 50 ? "warning" : "fail",
      severity: "medium",
      count: noSpeakersCount || 0,
      details: `${noSpeakersCount} bahasa (${(100 - speakersPercentage).toFixed(1)}%) tanpa data penutur`
    });

    // Check 9: Languages with negative speaker count
    const { data: negativeSpeakers } = await supabase
      .from("bahasa")
      .select("id, nama_bahasa, jumlah_penutur")
      .lt("jumlah_penutur", 0)
      .limit(5);

    const { count: negativeSpeakersCount } = await supabase
      .from("bahasa")
      .select("*", { count: "exact", head: true })
      .lt("jumlah_penutur", 0);

    checks.push({
      id: "negative_speakers",
      name: "Penutur Negatif",
      description: "Bahasa dengan jumlah penutur negatif",
      status: (negativeSpeakersCount || 0) === 0 ? "pass" : "fail",
      severity: "critical",
      count: negativeSpeakersCount || 0,
      details: (negativeSpeakersCount || 0) === 0 ? "Tidak ada data negatif" : `${negativeSpeakersCount} bahasa dengan penutur negatif`,
      examples: negativeSpeakers?.map(b => ({
        id: b.id,
        nama_bahasa: b.nama_bahasa,
        issue: `Jumlah penutur: ${b.jumlah_penutur}`
      }))
    });

    // Check 10: Languages with unrealistic speaker count (> 100M)
    const { data: unrealisticSpeakers } = await supabase
      .from("bahasa")
      .select("id, nama_bahasa, jumlah_penutur")
      .gt("jumlah_penutur", 100000000)
      .limit(5);

    const { count: unrealisticSpeakersCount } = await supabase
      .from("bahasa")
      .select("*", { count: "exact", head: true })
      .gt("jumlah_penutur", 100000000);

    checks.push({
      id: "unrealistic_speakers",
      name: "Penutur Tidak Realistis",
      description: "Bahasa dengan penutur > 100 juta",
      status: (unrealisticSpeakersCount || 0) === 0 ? "pass" : "warning",
      severity: "low",
      count: unrealisticSpeakersCount || 0,
      details: (unrealisticSpeakersCount || 0) === 0 ? "Tidak ada data tidak realistis" : `${unrealisticSpeakersCount} bahasa dengan penutur > 100 juta`,
      examples: unrealisticSpeakers?.map(b => ({
        id: b.id,
        nama_bahasa: b.nama_bahasa,
        issue: `Jumlah penutur: ${b.jumlah_penutur?.toLocaleString()}`
      }))
    });

    // Calculate overall score
    const passCount = checks.filter(c => c.status === "pass").length;
    const warningCount = checks.filter(c => c.status === "warning").length;
    const failCount = checks.filter(c => c.status === "fail").length;
    
    const score = Math.round((passCount / checks.length) * 100);

    const result: ValidationResult = {
      timestamp: new Date().toISOString(),
      total_checks: checks.length,
      pass_count: passCount,
      warning_count: warningCount,
      fail_count: failCount,
      score,
      checks
    };

    return NextResponse.json(result);
  } catch (error: any) {
    console.error("Validation error:", error);
    return NextResponse.json(
      { error: error.message || "Failed to run validation" },
      { status: 500 }
    );
  }
}
