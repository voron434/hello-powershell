function Eventlog-Listener($start, $end, $count) {
    Get-Eventlog -logname system -after $([datetime]$start) -before $([datetime]$end) -newest $count
}


Eventlog-Listener 01.01.2018 01.01.2020 10
