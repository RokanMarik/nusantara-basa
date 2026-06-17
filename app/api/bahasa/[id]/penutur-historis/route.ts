import { NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";
export const dynamic = "force-dynamic";



export async function GET(
  request: Request,
  { params }: { params: { id: string } }
) {
  try {
    const { id } = params;

    const { data, error } = await supabase
      .from("penutur_historis")
      .select("tahun, jumlah_penutur, sumber_data")
      .eq("bahasa_id", id)
      .order("tahun", { ascending: true });

    if (error) throw error;

    return NextResponse.json(data || []);
  } catch (error: any) {
    console.error("Penutur historis error:", error);
    return NextResponse.json(
      { error: error.message || "Failed to fetch penutur historis" },
      { status: 500 }
    );
  }
}
