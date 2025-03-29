$src_dir = "src"
$output_dir = "out"

# Run the build script
#./build.ps1

# Check if the --open flag is passed
if ($args -contains "--open") {
    Start-Process "$output_dir/main.pdf"
}

$File = "$src_dir\"
$Action = './build.ps1'
$global:FileChanged = $false

function Wait-FileChange {
    param(
        [string]$File,
        [string]$Action
    )
    $ScriptBlock = [scriptblock]::Create($Action)

    $AbsFile = Resolve-Path $File

    $Watcher = New-Object IO.FileSystemWatcher
    $Watcher.Path = $AbsFile
    $Watcher.IncludeSubdirectories = $true
    $Watcher.EnableRaisingEvents = $true  

    $onChange = Register-ObjectEvent $Watcher Changed -Action {$global:FileChanged = $true}

    while ($true) {
        while ($global:FileChanged -eq $false){
           Start-Sleep -Milliseconds 100
        }

    	& $ScriptBlock 
  	
	$global:FileChanged = $false
    }


    Unregister-Event -SubscriptionId $onChange.Id
}

Wait-FileChange -File $File -Action $Action
