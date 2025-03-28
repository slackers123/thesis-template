src_dir="src"
output_dir="out/"

./build.sh

if [[ "$1" == "--open" ]]; then
    open "$output_dir/main.pdf"
fi

fswatch -o "$src_dir" | while read -r event; do
    ./build.sh
done