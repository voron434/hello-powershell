# in one function, using -Recurse
function Directory-Recursive-Info($directory=".") {
    $dirs = get-childItem $directory -Recurse -Directory
    $files = $dirs | get-childItem -File
    echo "dirs: $($dirs.count)"
    echo "files: $($files.count)"
}


# now by 3 functions

