# in one function, using -Recurse
function Directory-Recursive-Info($directory=".") {
    $dirs = get-childItem $directory -Recurse -Directory
    $files = $dirs | get-childItem -File
    echo "dirs: $($dirs.count)"
    echo "files: $($files.count)"
}


# now by 3 functions

function DirInf($path=".") {
    $DirectoriesCount = (Get-ChildItem $Path -Directory | Measure-Object).Count
    $FilesCount = (Get-ChildItem $Path -File | Measure-Object).Count
    return @{
        "DirectoriesCount" = $DirectoriesCount;
        "FilesCount" = $FilesCount;
    }
}

function CurDirInf($path='.', $DepthLevel=0) {
    $DirectoryName = $(Resolve-Path $path).Path
    $Offset = ""
    for ($Depth = 0; $Depth -lt $DepthLevel; $Depth++) {
        $Offset += "  "
    }
    return "$Offset $DepthLevel $DirectoryName"
}

function GoDirs($path='.', $DepthLevel=0) {
    $DirectoryInfo = DirInf -Path $path
    $DirectoryOutput = `
        "$(CurDirInf -Path $Path -DepthLevel $DepthLevel)" `
        + " | Dirs - $($DirectoryInfo.DirectoriesCount)" `
        + " | Files - $($DirectoryInfo.FilesCount)"
    Write-Host $DirectoryOutput
    $SubDirectories = Get-ChildItem $Path -Directory -Name
    foreach ($SubDirectory in $SubDirectories) {
        $SubDirectoryPath = Join-Path $Path $SubDirectory
        $SubDirectoryDepthLevel = $DepthLevel + 1
        GoDirs -Path $SubDirectoryPath -DepthLevel $SubDirectoryDepthLevel
    }
}

DirInf
CurDirInf
GoDirs