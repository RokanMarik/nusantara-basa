#requires -Version 5.1
<#
.SYNOPSIS
    Initialize 9Router Auto-Routing for the current session.
.DESCRIPTION
    Checks 9Router health, sets environment variables, verifies combo models,
    and loads the keyword router. Run at the start of each session.
#>

$ErrorActionPreference = "Stop"

# ── Header ──────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "╔══════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║     9Router Auto-Routing Initialization          ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# ── Step 1/4: Health Check ──────────────────────────────────────────────────
Write-Host "[1/4] Checking 9Router health..." -ForegroundColor Cyan

try {
    $health = Invoke-RestMethod -Uri "http://localhost:20128/api/health" -TimeoutSec 5 -ErrorAction Stop
    Write-Host "      9Router is healthy" -ForegroundColor Green
}
catch {
    Write-Host "      ERROR: 9Router health check failed" -ForegroundColor Red
    Write-Host "      Ensure 9Router is running on port 20128." -ForegroundColor Yellow
    exit 1
}

# ── Step 2/4: Environment Variables ─────────────────────────────────────────
Write-Host "[2/4] Setting environment variables..." -ForegroundColor Cyan

$env:NINEROUTER_URL = "http://localhost:20128"
$env:NINEROUTER_KEY = "sk-2ce0b3116b58ede3-2yi9zn-e9931f89"

Write-Host "      NINEROUTER_URL = $env:NINEROUTER_URL" -ForegroundColor Green
Write-Host "      NINEROUTER_KEY = [set]" -ForegroundColor Green

# ── Step 3/4: Verify Combo Models ───────────────────────────────────────────
Write-Host "[3/4] Verifying combo models..." -ForegroundColor Cyan

$comboModels = @("auto-berat", "auto-sedang", "auto-ringan")
$allModelsPresent = $true

try {
    $modelsResponse = Invoke-RestMethod -Uri "http://localhost:20128/v1/models" -TimeoutSec 5 -ErrorAction Stop
    $availableIds = $modelsResponse.data.id

    foreach ($model in $comboModels) {
        if ($availableIds -contains $model) {
            Write-Host "      $model  ✅" -ForegroundColor Green
        }
        else {
            Write-Host "      $model  ❌" -ForegroundColor Red
            $allModelsPresent = $false
        }
    }
}
catch {
    Write-Host "      WARNING: Could not fetch model list ($_)" -ForegroundColor Yellow
    $allModelsPresent = $false
}

if (-not $allModelsPresent) {
    Write-Host ""
    Write-Host "      Run 'scripts/create-combos.ps1' to create missing combo models." -ForegroundColor Yellow
}

# ── Step 4/4: Load Keyword Router ───────────────────────────────────────────
Write-Host "[4/4] Loading keyword router..." -ForegroundColor Cyan

$keywordRouterPath = Join-Path $PSScriptRoot "keyword-router.ps1"

if (Test-Path $keywordRouterPath) {
    . $keywordRouterPath
    Write-Host "      Keyword router loaded from scripts/keyword-router.ps1" -ForegroundColor Green
}
else {
    Write-Host "      WARNING: keyword-router.ps1 not found at $keywordRouterPath" -ForegroundColor Yellow
    Write-Host "      Auto-routing will not be available." -ForegroundColor Yellow
}

# ── Summary ─────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "✅ 9Router Auto-Routing initialized!" -ForegroundColor Green
Write-Host ""
Write-Host "Usage:" -ForegroundColor Cyan
Write-Host "  `$model = Get-TaskComplexity -Prompt `"`"your task description`"`"" -ForegroundColor White
Write-Host "  Invoke-RestMethod `$env:NINEROUTER_URL/v1/chat/completions ... -Body @{ model = `$model }" -ForegroundColor White
Write-Host ""
