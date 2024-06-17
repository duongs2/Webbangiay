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
$dayOfWeek = 6; // Giá trị đại diện cho ngày trong tuần (1 đến 7)

switch ($dayOfWeek) {
    case 1:
        echo "Chủ nhật";
        break;
    case 2:
        echo "Thứ hai";
        break;
    case 3:
        echo "Thứ ba";
        break;
    case 4:
        echo "Thứ tư";
        break;
    case 5:
        echo "Thứ năm";
        break;
    case 6:
        echo "Thứ sáu";
        break;
    case 7:
        echo "Thứ bảy";
        break;
    default:
        echo "Giá trị không hợp lệ";
}
?>


</body>

</html>