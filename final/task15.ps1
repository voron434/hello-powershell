function Intersection($a, $b) {
    $a | ?{$b -contains $_}
}

function Union($a, $b) {
    $a + $b | select -uniq
}

Intersection (1,2,3,4) (1,3,4,5)

Union (1,2,3,4) (1,3,4,5)