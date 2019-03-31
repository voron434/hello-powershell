function Current-Date-Delta($days, $startdate=(get-date)) {
    $startdate = [datetime]$startdate
    $newdate = ($startdate).adddays($days)
    if ([int]$newdate.DayOfWeek -eq 6) {
        write-host -foregroundcolor Red $newdate $newdate.DayOfWeek
    } else {
        write-host -foregroundcolor Yellow $newdate $newdate.DayOfWeek
    }
}

Current-Date-Delta 5

Current-Date-Delta 6

Current-Date-Delta 5 11.03.2019