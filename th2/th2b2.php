<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<?php
function factorial($n) {
    if ($n == 0) {
        return 1;
    } else {
        return $n * factorial($n - 1);
    }
}

$numbers = array(6, 16, 20);

foreach ($numbers as $number) {
    $result = factorial($number);
    echo "Giai thừa của " . $number . " là: " . $result . "<br>";
}
?>

</body>

</html>

