function Race{
    $first = 0
    $second = 0
    while ($first -lt 100 -and $second -lt 100) {
        $first = $first + (get-random -Minimum 0 -Maximum 2)
        $second = $second + (get-random -Minimum 0 -Maximum 2)
        Write-Progress -Activity "First"  -Status "First Rider" -Id 1 -PercentComplete $first
        Write-Progress -Activity "Second" -Status "Second Rider" -Id 2 -PercentComplete $second
        start-sleep -s 0.2
    }
}

Race

$collection = 0..12
$count = 0
foreach ($item in $collection) {
    $count++
    $percentComplete = ($count / $collection.Count) * 100
    Write-InlineProgress -Activity "Processing item #$($item)" -PercentComplete $percentComplete

    Start-Sleep -Milliseconds (Get-Random -Minimum 160 -Maximum 400)
}