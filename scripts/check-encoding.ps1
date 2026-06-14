$file = 'C:\Users\Rokan Akbar Marik\Downloads\statistik-kebahasaan-2023.md'

if (Test-Path $file) {
    Write-Host "File exists: $file"
    
    $bytes = [System.IO.File]::ReadAllBytes($file)
    Write-Host "Size: $($bytes.Length) bytes"
    Write-Host "First 16 bytes: $($bytes[0..15] -join ',')"
    
    # Check for BOM
    if ($bytes[0] -eq 0xFF -and $bytes[1] -eq 0xFE) {
        Write-Host "Encoding: UTF-16 LE (Windows default)"
        $content = [System.Text.Encoding]::Unicode.GetString($bytes)
    } elseif ($bytes[0] -eq 0xFE -and $bytes[1] -eq 0xFF) {
        Write-Host "Encoding: UTF-16 BE"
        $content = [System.Text.Encoding]::BigEndianUnicode.GetString($bytes)
    } else {
        Write-Host "Encoding: UTF-8 or ASCII"
        try {
            $content = [System.Text.Encoding]::UTF8.GetString($bytes)
            Write-Host "UTF-8 decoding successful"
        } catch {
            Write-Host "UTF-8 failed, trying ANSI/ASCII"
            $content = [System.Text.Encoding]::Default.GetString($bytes)
        }
    }
    
    # Find first occurrence of "Table" or "# " to see structure
    $firstNewline = $content.IndexOf("`n")
    if ($firstNewline -gt 0) {
        Write-Host "`n--- First 1500 characters ---"
        Write-Host $content.Substring(0, [Math]::Min(1500, $content.Length))
    }
    
    # Look for markdown tables
    $tableMatches = [regex]::Match($content, "(?:^|\n)\|.*?\|(?:\s*\n|$)")
    if ($tableMatches.Success) {
        Write-Host "`n--- Found table-like structure ---"
        Write-Host "Sample: $($tableMatches.Value.Substring(0, [Math]::Min(500, $tableMatches.Value.Length)))"
    }
} else {
    Write-Host "ERROR: File not found at $file"
}
