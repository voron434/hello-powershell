

# Directory-Info ~




function Dir-Info($directory=".") {
    Get-ChildItem $directory -Directory
    Get-ChildItem $directory -File
}

$output = Dir-Info ~
echo "hello"
$output[0]
echo "hello"
$output[1]
function RecursiveDirInfo($directory=".") {
    $dirs = (Dir-Info $directory)[0]
    $files = (Dir-Info $directory)[1]
    $dirs_count = ($dirs | foreach-object { Dir-Info $_ })[0]
    $files_count = ($dirs | foreach-object { Dir-Info $_ })[1]
    $dirs
    $files
}

# RecursiveDirInfo ~

