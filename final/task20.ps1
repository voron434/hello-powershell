function allocate($memoneeds, $symbol, $position) {
    0..[int]$memoneeds | foreach {
        $memo[$_ + $position] = $symbol
    }
}


function MainMenu($memorysize=100) {
    $memo = @()
    1..$memorysize | foreach { $memo += "0"}
    write-host "1. If you want to show memo"
    write-host "2. If you want to add process"
    write-host "3. If you want to end process"
    write-host "4. If you want to run defragmentation"
    write-host "5. If you want to exit"
    $value = Read-Host -Prompt 'Input your choice'
    $processes = @{}
    while ($value -ne 5){
        if ($value -eq 1){
            write-host $memo
        }
        if ($value -eq 2){
            $input_ = Read-Host -Prompt 'Enter process name, memory needed and symbols with space'
            $name, $memoneeds, $symbols = $input_.split(' ')
            $memoneeds -= 1
            $start_position_curr_max = 0
            $max_curr = 0
            $counter = 0
            foreach ($value in $memo){
                if ($value -eq 0) {
                    if ($max_curr -eq 0) {
                        $start_position_curr_max = $counter
                    }
                    $max_curr = $max_curr + 1
                }
                else {
                    $max_curr = 0    
                }
                $counter = $counter + 1
                if ($max_curr -eq $memoneeds) {
                    break
                }
            }
            if ($max_curr -lt $memoneeds) {
                write-host "Allocation Error: Not enougth memo"
            } else {
                write-host "Memo allocated"
                allocate $memoneeds $symbols $start_position_curr_max
                $processes += @{$name = @($memoneeds, $symbols, $start_position_curr_max)}
            }
        }
        if ($value -eq 3){
            $input_ = Read-Host -Prompt 'Enter process name'
            if (($processes.keys).contains($input_)) {
                    $process = $processes.$input_
                    $processes.Remove($input_)
                    allocate $process[0] "0" $process[2]
                    write-host "Memo disallocated"
                } else {
                    write-host "Process Not Found"
                }
        }
        if ($value -eq 4){
            $memo = @()
            1..$memorysize | foreach { $memo += "0"}
            $counter = 0
            $processes_copy = $processes.clone()
            foreach ($processname in $processes_copy.keys) {
                $process = $processes_copy.$processname
                allocate $process[0] $process[1] $counter
                $counter += $process[0]
                $processes.$processname[2] = $counter
            }
        }
        $value = Read-Host -Prompt 'Input your choice'
    }
}

MainMenu 20