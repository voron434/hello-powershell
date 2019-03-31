function Service-Diff {
    $running = ((get-service | where status -eq "Running").Count)
    $stopped = ((get-service | where status -eq "Stopped").Count)
    $diff = $running - $stopped
    echo "Differece between running and stopped is $diff"
}

Service-Diff