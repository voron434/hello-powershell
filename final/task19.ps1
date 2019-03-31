# Input process name and finish time: pr1 19-12-98-11:00
# Input process name and finish time: pr2 10-12-98-11:00
# Input process name and finish time: pr3 19-12-19-19:00
# Input process name and finish time: pr4 19-12-20-11:00
# Input process name and finish time: end
# 
# pr3 pr4

function getProcessInfo {
    while ($true) {
        $processInfo = Read-Host -Prompt 'Input process name and finish time'
        $processName, $processFinishTime = $processInfo.split(' ')

        if ($processInfo -eq 'end') {
            break
        }

        $processes += @{$processName = [datetime]::parseexact($processFinishTime, 'dd-MM-yy-HH:mm', $null)}
    }

    return $processes
}

function removeOldProcess($processes) {
    $processesClone = $processes.Clone()

    foreach ($process in $processes.GetEnumerator()) {
        if ($process.Value -lt (Get-Date)) {
            $processesClone.Remove($process.Key)
        }
    }

    return $processesClone
}

function processManagement {
    $processes = getProcessInfo

    $updatedProcesses = removeOldProcess($processes)

    Write-Host $updatedProcesses.Keys

}

processManagement