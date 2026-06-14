$file = 'C:\Users\Rokan Akbar Marik\Downloads\statistik-kebahasaan-2023.md'
$outputFile = 'C:\Users\Rokan Akbar Marik\Documents\projects\nusantara-basa\data\statistik-2023-utf8.txt'

$bytes = [System.IO.File]::ReadAllBytes($file)
$content = [System.Text.Encoding]::UTF8.GetString($bytes)

# Save as UTF-8
[System.IO.File]::WriteAllText($outputFile, $content, [System.Text.Encoding]::UTF8)

Write-Host "Extracted to: $outputFile"
Write-Host "Total length: $($content.Length) characters"
Write-Host "Total lines: $(($content -split "`n").Count)"

# Analyze structure
$lines = $content -split "`n"

# Find markdown tables
$tableLines = @()
$inTable = $false
$tableCount = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    
    # Check if line starts a table
    if ($line -match '^\|.*\|$') {
        if (-not $inTable) {
            $inTable = $true
            $tableCount++
            $tableLines += "=== TABLE $tableCount (Line $i) ==="
        }
        $tableLines += $line
    } else {
        if ($inTable) {
            $inTable = $false
            $tableLines += ""
        }
    }
}

Write-Host "`nFound $tableCount tables"

# Save table analysis
if ($tableLines.Count -gt 0) {
    $tableFile = 'C:\Users\Rokan Akbar Marik\Documents\projects\nusantara-basa\data\statistik-2023-tables.txt'
    $tableLines -join "`n" | Out-File -FilePath $tableFile -Encoding UTF8
    Write-Host "Tables saved to: $tableFile"
}

# Find sections with "Bahasa" or language-related keywords
Write-Host "`n--- Key sections found ---"
$keywords = @('Bahasa', 'Daerah', 'Provinsi', 'Penutur', 'Vitalitas', 'Status', 'Dokumentasi')

foreach ($keyword in $keywords) {
    $matches = Select-String -Path $outputFile -Pattern $keyword -AllMatches | Select-Object -First 5
    if ($matches) {
        Write-Host "`n'$keyword' found $($matches.Count) times (showing first 5):"
        foreach ($match in $matches) {
            $context = $match.Line.Substring(0, [Math]::Min(100, $match.Line.Length))
            Write-Host "  Line $($match.LineNumber): $context"
        }
    }
}
