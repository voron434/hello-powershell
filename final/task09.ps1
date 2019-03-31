function Remove-Duplicates($array) {
    $array | select -uniq
}

Remove-Duplicates 1,2,3,4,5,4,3,2,1