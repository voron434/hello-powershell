function Filtered-Process-List($letter, $from_pid, $to_pid) {
	 Get-Process | Where-Object {
	 	($_.id -gt $from_pid) -and
        ($_.id -lt $to_pid) -and
        ($_.ProcessName -Match "^$letter.*")
	 }
}

Filtered-Process-List s 4000 5000