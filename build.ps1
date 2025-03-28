$src_dir = "src"
$output_dir = "out"

# Create the output directory if it doesn't exist
if (-not (Test-Path -Path $output_dir)) {
    New-Item -ItemType Directory -Path $output_dir | Out-Null
}

# Copy the references file to the output directory
Copy-Item -Path "$src_dir\refs.bib" -Destination "$output_dir\"

# Run biber
biber "$output_dir\main"
$biber_exit_code = $LASTEXITCODE

# Run pdflatex
pdflatex -output-directory="$output_dir" "$src_dir\main.tex"

if ($biber_exit_code -ne 0) {
    # Retry biber and pdflatex if biber failed
    biber "$output_dir\main"
    pdflatex -output-directory="$output_dir" "$src_dir\main.tex"
}

# Check the exit code of pdflatex
$pdflatex_exit_code = $LASTEXITCODE

if ($pdflatex_exit_code -ne 0) {
    # Retry pdflatex if biber failed
    pdflatex -output-directory="$output_dir" "$src_dir\main.tex"
}
