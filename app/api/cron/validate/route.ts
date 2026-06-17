import { NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";
export const dynamic = "force-dynamic";



// Cron job endpoint - can be called by external scheduler (e.g., cron-job.org, GitHub Actions, Vercel Cron)
export async function POST(request: Request) {
  try {
    // Verify authorization (use a secret token from environment)
    const authHeader = request.headers.get('authorization');
    const expectedToken = `Bearer ${process.env.CRON_SECRET}`;
    
    if (authHeader !== expectedToken) {
      return NextResponse.json(
        { error: "Unauthorized" },
        { status: 401 }
      );
    }

    // Call the validation API
    const validateResponse = await fetch(`${process.env.NEXT_PUBLIC_SUPABASE_URL?.replace('.supabase.co', '')}.vercel.app/api/validate`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      }
    });

    if (!validateResponse.ok) {
      throw new Error('Validation API failed');
    }

    const validationResult = await validateResponse.json();

    // Store validation result in database
    const { error: insertError } = await supabase
      .from('validation_logs')
      .insert({
        timestamp: validationResult.timestamp,
        score: validationResult.score,
        total_checks: validationResult.total_checks,
        pass_count: validationResult.pass_count,
        warning_count: validationResult.warning_count,
        fail_count: validationResult.fail_count,
        details: validationResult.checks,
      });

    if (insertError) {
      console.error('Failed to store validation result:', insertError);
      throw insertError;
    }

    // Check if there are critical issues that need alerting
    const hasCritical = validationResult.checks.some(
      (check: any) => check.severity === 'critical' && check.status === 'fail'
    );

    if (hasCritical) {
      // TODO: Implement email/Slack notification
      console.warn('Critical validation issues detected!');
      console.warn('Score:', validationResult.score);
      console.warn('Failed checks:', validationResult.fail_count);
      
      // For now, just log. In production, you'd send to:
      // - Email via SendGrid/Resend
      // - Slack webhook
      // - Discord webhook
      // - Telegram bot
    }

    return NextResponse.json({
      success: true,
      message: "Validation completed and logged",
      score: validationResult.score,
      timestamp: validationResult.timestamp,
    });
  } catch (error: any) {
    console.error("Cron validation error:", error);
    return NextResponse.json(
      { error: error.message || "Cron job failed" },
      { status: 500 }
    );
  }
}

// GET endpoint to retrieve validation history
export async function GET() {
  try {
    const { data: logs, error } = await supabase
      .from('validation_logs')
      .select('*')
      .order('timestamp', { ascending: false })
      .limit(30);

    if (error) throw error;

    return NextResponse.json(logs || []);
  } catch (error: any) {
    console.error("Failed to fetch validation logs:", error);
    return NextResponse.json(
      { error: error.message || "Failed to fetch validation logs" },
      { status: 500 }
    );
  }
}
