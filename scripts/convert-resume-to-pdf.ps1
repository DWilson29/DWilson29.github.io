<#
.SYNOPSIS
    Converts content/Resume.md to a PDF using pandoc.

.DESCRIPTION
    Requires pandoc (https://pandoc.org/installing.html) to be installed and
    available on the PATH. A LaTeX engine (e.g. MiKTeX or TeX Live) is also
    required by pandoc to produce PDF output.

.EXAMPLE
    ./scripts/convert-resume-to-pdf.ps1
#>

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$inputFile = Join-Path $repoRoot "content\Resume.md"
$outputFile = Join-Path $repoRoot "\Resume.pdf"

if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    Write-Error "pandoc is not installed or not on the PATH. Install it from https://pandoc.org/installing.html"
    exit 1
}

if (-not (Test-Path $inputFile)) {
    Write-Error "Could not find resume file at $inputFile"
    exit 1
}

# Strip everything up to and including the first markdown line break (---),
# which drops the Hugo front matter / metadata block above it.
$lines = Get-Content -LiteralPath $inputFile
$breakIndex = -1
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i].Trim() -eq "---") {
        $breakIndex = $i
        break
    }
}

if ($breakIndex -eq -1) {
    Write-Error "Could not find a '---' line break in $inputFile"
    exit 1
}

$body = $lines[($breakIndex + 1)..($lines.Count - 1)] -join "`n"

$tempMarkdown = New-TemporaryFile
$tempMarkdown = Rename-Item -Path $tempMarkdown -NewName ([IO.Path]::GetFileName($tempMarkdown) + ".md") -PassThru
Set-Content -LiteralPath $tempMarkdown -Value $body -NoNewline

# Tighten spacing between bullet points via a small LaTeX header include.
$tempHeader = New-TemporaryFile
$tempHeader = Rename-Item -Path $tempHeader -NewName ([IO.Path]::GetFileName($tempHeader) + ".tex") -PassThru
@"
\usepackage{enumitem}
\usepackage{setspace}
\setlist{nosep,topsep=0pt,partopsep=0pt,parsep=0pt}
\setstretch {0.5}
\pagenumbering{gobble}
"@ | Set-Content -LiteralPath $tempHeader -NoNewline

try {
    Write-Host "Converting $inputFile to $outputFile ..."
    pandoc $tempMarkdown -V geometry:margin=1in -V colorlinks=true -V linkcolor=blue -V urlcolor=red --include-in-header=$tempHeader -o $outputFile

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Successfully created $outputFile"
    } else {
        Write-Error "pandoc failed with exit code $LASTEXITCODE"
        exit $LASTEXITCODE
    }
} finally {
    Remove-Item -LiteralPath $tempMarkdown -ErrorAction SilentlyContinue
    Remove-Item -LiteralPath $tempHeader -ErrorAction SilentlyContinue
}
