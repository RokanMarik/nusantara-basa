$ErrorActionPreference = 'Stop'

$totalPages = 8
$baseUrl = 'https://dapobas.kemendikdasmen.go.id/homecat.php?show=url/petabahasa&cat=1'

for ($p = 1; $p -le $totalPages; $p++) {
    $url = if ($p -eq 1) { $baseUrl } else { "$baseUrl&page=$p" }
    $outFile = "data/dapobas-page$p.html"
    
    if (Test-Path $outFile) {
        Write-Host "Page $p already exists, skipping"
        continue
    }
    
    Write-Host "Downloading page $p..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $outFile -UseBasicParsing -TimeoutSec 30
        $size = (Get-Item $outFile).Length
        Write-Host "  Page $p - $size bytes"
        Start-Sleep -Seconds 1
    } catch {
        Write-Host "  Error on page $p - $_"
    }
}

Write-Host "Done downloading all pages"
