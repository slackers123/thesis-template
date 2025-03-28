src_dir="src"
output_dir="out"

mkdir -p "$output_dir"
cp "$src_dir/refs.bib" "$output_dir/"
biber "$output_dir/main"
biber_exit_code=$?

pdflatex -output-directory="$output_dir" "$src_dir/main.tex"

if [ $biber_exit_code -ne 0 ]; then
	biber "$output_dir/main"
    pdflatex -output-directory="$output_dir" "$src_dir/main.tex"
fi

pdflatex_output=$?

if [ $biber_exit_code -ne 0 ]; then
    pdflatex -output-directory="$output_dir" "$src_dir/main.tex"
fi