function Directory-Info($directory=".") {
    Get-ChildItem $directory | sort-object -property lastwrittime
}


Directory-Info