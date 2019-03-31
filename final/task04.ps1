function Filtered-Process-List($letter, $from_pid, $to_pid) {
     get-process | where-object {
        ($_.id -gt $from_pid) -and
        ($_.id -lt $to_pid) -and
        ($_.ProcessName -Match "^$letter.*")
     }
}

Filtered-Process-List s 4000 5000