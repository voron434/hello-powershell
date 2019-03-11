function CPU-Sum {
    $statistics = get-process | measure-object -property cpu -sum
    write-host -foregroundcolor Red "CPU sum = $($statistics.sum)"
    write-host -foregroundcolor Red "Processes count= $($statistics.count)"
}

CPU-Sum