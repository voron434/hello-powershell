function Create-file($filepath) {
    new-item -path $filepath
}


function Remove-file($filepath) {
    remove-item -path $filepath
}

Create-file ./myfile.txt
# Remove-file ./myfile.txt
