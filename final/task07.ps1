function Remove-file($filename, $filepath) {
    get-childitem -path $filepath -name $filename | remove-item
}

Remove-file myfile.txt .