function Race{
    $first = 0
    $second = 0
    $firstname = Read-Host -Prompt 'First racer name'
    $secondname = Read-Host -Prompt 'Second racer name'
    while ($first -lt 100 -and $second -lt 100) {
        $first = $first + (get-random -Minimum 0 -Maximum 2)
        $second = $second + (get-random -Minimum 0 -Maximum 2)
        Write-Progress -Activity "First"  -Status $firstname -Id 1 -PercentComplete $first
        Write-Progress -Activity "Second" -Status $secondname -Id 2 -PercentComplete $second
        start-sleep -s 0.2
    }
}

Race