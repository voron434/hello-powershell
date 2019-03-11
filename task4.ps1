function Active-Processes{
     Get-Process |
     Where-Object {($_.cpu -gt 0)} |
     foreach-object {
        write-host -foregroundcolor Yellow "name: $($_.processname), pid: $($_.id), started: $($_.starttime)"
    }
}

Active-Processes