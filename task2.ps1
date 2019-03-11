function Service-Diff {
    $running = ((get-service | where-object { $_.status -eq "Running"}).Count)
    $stopped = ((get-service | where-object { $_.status -eq "Stopped"}).Count)
    $diff = $running - $stopped
    echo "Differece between running and stopped is $diff"
}

Service-Diff