#!/usr/bin/env bash
#
# Converts content/Resume.md to a PDF using pandoc.
#
# Requires pandoc (https://pandoc.org/installing.html) to be installed and
# available on the PATH. A LaTeX engine (e.g. TeX Live or MacTeX) is also
# required by pandoc to produce PDF output.
#
# Usage: ./scripts/convert-resume-to-pdf.sh

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
input_file="${repo_root}/content/Resume.md"
output_file="${repo_root}/Resume.pdf"

if ! command -v pandoc >/dev/null 2>&1; then
    echo "Error: pandoc is not installed or not on the PATH. Install it from https://pandoc.org/installing.html" >&2
    exit 1
fi

if [ ! -f "$input_file" ]; then
    echo "Error: Could not find resume file at $input_file" >&2
    exit 1
fi

# Strip everything up to and including the first markdown line break (---),
# which drops the Hugo front matter / metadata block above it.
if ! grep -qx -- "---" "$input_file"; then
    echo "Error: Could not find a '---' line break in $input_file" >&2
    exit 1
fi

temp_markdown="$(mktemp /tmp/resume-body.XXXXXX.md)"
temp_header="$(mktemp /tmp/resume-header.XXXXXX.tex)"
trap 'rm -f "$temp_markdown" "$temp_header"' EXIT

awk '/^---[[:space:]]*$/{found=1; next} found' "$input_file" > "$temp_markdown"

# Tighten spacing between bullet points via a small LaTeX header include.
cat > "$temp_header" <<'EOF'
\usepackage{enumitem}
\usepackage{setspace}
\setlist{nosep,topsep=0pt,partopsep=0pt,parsep=0pt}
\setstretch{0.5}
\pagenumbering{gobble}
EOF

echo "Converting $input_file to $output_file ..."
pandoc "$temp_markdown" -V geometry:margin=1in -V colorlinks=true -V linkcolor=blue -V urlcolor=red --include-in-header="$temp_header" -o "$output_file"

echo "Successfully created $output_file"
