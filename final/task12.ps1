function Random-Test($tests) {
    $gthalf = ($(1..$tests) | foreach  {get-random -Minimum 0 -Maximum 100} |
    where {$_ -gt 50}).count
    $lthalf = $tests - $gthalf
    echo "Values less than half: $lthalf ($($lthalf*100/$tests)%)"
    echo "Values more than half: $gthalf ($($gthalf*100/$tests)%)"
}

Random-Test 10000