function Create-file($filename, $filepath, $contents) {
    new-item -path $filepath -name $filename -itemtype file |
    set-content -value $contents
}

Create-file myfile.txt . "Hello, World!"