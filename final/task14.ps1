function Race($traces){
    $processes = @{}
    1..$traces | foreach {
        $name = Read-Host -Prompt 'Input racer name'
        $processes += @{$name = 0}
    }
    $copy = $processes.clone()
    while (($copy.values | measure -maximum).maximum -lt 100) {
        $i = 0
        foreach ($process in $processes.keys) {
            $i += 1
            $randvalue = get-random -Minimum 0 -Maximum 2
            $copy.$process += $randvalue
            Write-Progress -Activity "Racing"  -Status $process -Id $i -PercentComplete $copy.$process
        }
        start-sleep -s 0.2
    }
    $winner = ($processes.GetEnumerator() | sort value -Descending | select -First 1).name
    write-host "The winner is $winner"
}

Race 3