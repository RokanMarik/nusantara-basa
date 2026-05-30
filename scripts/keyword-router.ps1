function Get-TaskComplexity {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Prompt
    )

    $beratKeywords = @(
        "architecture", "complex", "design system", "refactor entire",
        "debug difficult", "build feature", "implement from scratch",
        "multi-step", "deep analysis", "write extensive",
        "arsitektur", "kompleks", "buat dari nol", "refactor total",
        "build from scratch", "full system", "end-to-end",
        "complete rewrite", "major refactor"
    )

    $sedangKeywords = @(
        "review", "summarize", "explain", "analyze", "fix bug",
        "update", "modify", "compare", "optimize", "refactor",
        "rangkum", "perbaiki", "bandingkan", "analisa", "jelaskan",
        "code review", "troubleshoot", "investigate", "improve"
    )

    $lowerPrompt = $Prompt.ToLowerInvariant()

    # Check berat first (higher priority)
    foreach ($kw in $beratKeywords) {
        $escaped = [Regex]::Escape($kw)
        if ($lowerPrompt -match "\b$escaped\b") {
            return "auto-berat"
        }
    }

    # Check sedang
    foreach ($kw in $sedangKeywords) {
        $escaped = [Regex]::Escape($kw)
        if ($lowerPrompt -match "\b$escaped\b") {
            return "auto-sedang"
        }
    }

    # Default: ringan
    return "auto-ringan"
}
