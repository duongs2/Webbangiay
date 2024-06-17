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
function generateFibonacci($n) {
    $fibonacci = array(0, 1); // Mảng chứa dãy số Fibonacci, ban đầu có 2 phần tử là 0 và 1

    for ($i = 2; $i < $n; $i++) {
        $fibonacci[$i] = $fibonacci[$i - 1] + $fibonacci[$i - 2]; // Tính số Fibonacci thứ $i bằng tổng 2 số Fibonacci trước đó
    }

    return $fibonacci;
}

$n = 10; // Số lượng số Fibonacci cần tính
$fibonacci = generateFibonacci($n);

echo "10 số đầu tiên của dãy số Fibonacci là: ";
echo implode(", ", $fibonacci); // In ra các số Fibonacci, cách nhau bằng dấu phẩy
?>

<?php
function isPrime($number) {
    if ($number <= 1) {
        return false;
    }

    for ($i = 2; $i <= sqrt($number); $i++) {
        if ($number % $i == 0) {
            return false;
        }
    }

    return true;
}

$primeNumbers = array();

for ($i = 2; $i < 100; $i++) {
    if (isPrime($i)) {
        $primeNumbers[] = $i;
    }
}

echo "Các số nguyên tố nhỏ hơn 100 là: ";
echo implode(", ", $primeNumbers); // In ra các số nguyên tố, cách nhau bằng dấu phẩy
?>

</body>

</html>

