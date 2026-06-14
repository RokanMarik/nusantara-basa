# Download DapoBas data
$url = 'https://dapobas.kemendikdasmen.go.id/api/data/bahasa?cat=Bahasa%20Daerah%20di%20indonesia'

try {
    $response = Invoke-WebRequest -Uri $url -Method GET -UseBasicParsing
    Write-Host "Status: $($response.StatusCode)"
    Write-Host "Length: $($response.Content.Length)"
    
    if ($response.Content.Length -gt 0) {
        $content = [System.Text.Encoding]::UTF8.GetString($response.Content)
        $content | Out-File 'data/dapobas-api.json' -Encoding UTF8
        Write-Host "Saved to dapobas-api.json"
    } else {
        Write-Host "Empty response"
    }
} catch {
    Write-Host "Error: $($_.Exception.Message)"
    Write-Host "Trying alternative URL..."
    
    # Try alternative URL
    try {
        $response2 = Invoke-WebRequest -Uri 'https://dapobas.kemendikdasmen.go.id/homecat.php?show=url/petabahasa&cat=1' -UseBasicParsing
        Write-Host "Alternative status: $($response2.StatusCode)"
        Write-Host "Alternative length: $($response2.Content.Length)"
        
        if ($response2.Content.Length -gt 0) {
            $content2 = [System.Text.Encoding]::UTF8.GetString($response2.Content)
            $content2 | Out-File 'data/dapobas-alternative.html' -Encoding UTF8
            Write-Host "Saved to dapobas-alternative.html"
        }
    } catch {
        Write-Host "Alternative also failed: $($_.Exception.Message)"
    }
}
