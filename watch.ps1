$src_dir = "src"
$output_dir = "out/"

# Run the build script
./build.ps1

# Check if the --open flag is passed
if ($args -contains "--open") {
    Start-Process "$output_dir/main.pdf"
}

# Watch for changes in the source directory
Get-ChildItem -Recurse $src_dir | ForEach-Object {
    Register-ObjectEvent -InputObject (Get-Item $_.FullName) -EventName Changed -Action {
        ./build.ps1
    }
}

# Keep the script running to monitor changes
while ($true) {
    Start-Sleep -Seconds 1
}