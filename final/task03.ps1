function Active-Processes{
    get-process |
    where cpu -gt 0 |
    ft processname, id, starttime -auto | out-string |
    write-host -foregroundcolor Yellow
    
}

Active-Processes