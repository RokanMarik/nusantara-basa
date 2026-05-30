# ============================================
# Auto-Enable Prerequisites for Skills
# ============================================
# Run this before using skills to ensure everything is ready

Write-Host "`n🔍 Checking prerequisites..." -ForegroundColor Cyan

# 1. Docker
Write-Host "`n[1/7] Docker..." -NoNewline
try {
    $dockerVersion = docker --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅ $dockerVersion" -ForegroundColor Green
    } else {
        Write-Host " ❌ Not installed" -ForegroundColor Red
        Write-Host "   Install: https://docs.docker.com/desktop/install/windows-install/" -ForegroundColor Yellow
    }
} catch {
    Write-Host " ❌ Not found" -ForegroundColor Red
}

# 2. 9Router
Write-Host "[2/7] 9Router..." -NoNewline
try {
    $response = Invoke-WebRequest -Uri "http://localhost:20128" -TimeoutSec 3 -UseBasicParsing 2>$null
    if ($response.StatusCode -eq 200 -or $response.StatusCode -eq 404) {
        Write-Host " ✅ Running on port 20128" -ForegroundColor Green
    } else {
        Write-Host " ⚠️  Running but unexpected status: $($response.StatusCode)" -ForegroundColor Yellow
    }
} catch {
    Write-Host " ❌ Not running" -ForegroundColor Red
    Write-Host "   Start: 9Router Desktop or 'npx 9router'" -ForegroundColor Yellow
}

# 3. Node.js
Write-Host "[3/7] Node.js..." -NoNewline
try {
    $nodeVersion = node --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅ $nodeVersion" -ForegroundColor Green
    } else {
        Write-Host " ❌ Not installed" -ForegroundColor Red
    }
} catch {
    Write-Host " ❌ Not found" -ForegroundColor Red
}

# 4. Python
Write-Host "[4/7] Python..." -NoNewline
try {
    $pythonVersion = python --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅ $pythonVersion" -ForegroundColor Green
    } else {
        Write-Host " ❌ Not installed" -ForegroundColor Red
    }
} catch {
    Write-Host " ❌ Not found" -ForegroundColor Red
}

# 5. Git
Write-Host "[5/7] Git..." -NoNewline
try {
    $gitVersion = git --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅ $gitVersion" -ForegroundColor Green
    } else {
        Write-Host " ❌ Not installed" -ForegroundColor Red
    }
} catch {
    Write-Host " ❌ Not found" -ForegroundColor Red
}

# 6. GitHub CLI
Write-Host "[6/7] GitHub CLI..." -NoNewline
try {
    $ghVersion = gh --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅ $ghVersion" -ForegroundColor Green
    } else {
        Write-Host " ❌ Not installed" -ForegroundColor Red
        Write-Host "   Install: winget install GitHub.cli" -ForegroundColor Yellow
    }
} catch {
    Write-Host " ❌ Not found" -ForegroundColor Red
}

# 7. pytest
Write-Host "[7/7] pytest..." -NoNewline
try {
    $pytestVersion = pytest --version 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅ $pytestVersion" -ForegroundColor Green
    } else {
        Write-Host " ⚠️  Not installed (available via pip)" -ForegroundColor Yellow
        Write-Host "   Install: pip install pytest" -ForegroundColor Yellow
    }
} catch {
    Write-Host " ❌ Not found" -ForegroundColor Red
}

# Obsidian Vault
Write-Host "`n📁 Obsidian Vault..." -NoNewline
$obsidianPath = "$env:USERPROFILE\Documents\Obsidian Vault"
if (Test-Path $obsidianPath) {
    Write-Host " ✅ Found at $obsidianPath" -ForegroundColor Green
} else {
    Write-Host " ⚠️  Not found" -ForegroundColor Yellow
}

# 9Router Auto-Routing
Write-Host "`n🔄 9Router Auto-Routing..." -NoNewline
$routerScript = Join-Path $PSScriptRoot "init-9router-routing.ps1"
$keywordRouter = Join-Path $PSScriptRoot "keyword-router.ps1"
$combosScript = Join-Path $PSScriptRoot "create-combos.ps1"

$allReady = $true
if (Test-Path $routerScript) {
    Write-Host "`n   ✅ init-9router-routing.ps1" -ForegroundColor Green
} else {
    Write-Host "`n   ❌ init-9router-routing.ps1 (missing)" -ForegroundColor Red
    $allReady = $false
}

if (Test-Path $keywordRouter) {
    Write-Host "   ✅ keyword-router.ps1" -ForegroundColor Green
} else {
    Write-Host "   ❌ keyword-router.ps1 (missing)" -ForegroundColor Red
    $allReady = $false
}

if (Test-Path $combosScript) {
    Write-Host "   ✅ create-combos.ps1" -ForegroundColor Green
} else {
    Write-Host "   ❌ create-combos.ps1 (missing)" -ForegroundColor Red
    $allReady = $false
}

if ($allReady) {
    Write-Host "`n   Run: .\scripts\init-9router-routing.ps1 to enable" -ForegroundColor Yellow
}

Write-Host "`n✅ Prerequisites check complete!`n" -ForegroundColor Cyan
