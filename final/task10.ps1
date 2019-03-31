function Date-Delta($first, $second) {
    (new-timespan -start $([datetime]$first) -end $([datetime]$second)).days
}

Date-Delta "01.01.2018" "01.01.2019"