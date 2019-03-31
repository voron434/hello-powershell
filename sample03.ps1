function Dir-Size($directory, $roundcount) {
    $dirs = Get-ChildItem $directory -Recurse -Directory
    $files = $dirs | Get-ChildItem -File
    [math]::round(($files | Measure-Object -sum -property length).sum/1024,$roundcount)
}


Dir-Size ~ 1


