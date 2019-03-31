function Create-file {
    $filepath = Read-Host -Prompt 'Input path to file'
    new-item -path $filepath
}

Create-file