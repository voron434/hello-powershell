function CPU-Sum {
    $statistics = get-process | measure cpu -sum
    write-host -foregroundcolor Yellow "CPU sum = $($statistics.sum)"
    write-host -foregroundcolor Yellow "Processes count= $($statistics.count)"
}

CPU-Sum