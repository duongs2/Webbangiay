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
function tinhTienTaxi($soKm) {
    $gia1kmDau = 15000; // Giá 1km đầu
    $gia1kmTu1Den5 = 12000; // Giá 1km từ 1 đến 5
    $gia1kmTu6TroDi = 9000; // Giá 1km từ 6 trở đi
    $giamGiaTu140TroDi = 0.12; // Tỷ lệ giảm giá từ 140km trở đi (12%)
    
    $tongTien = 0; // Biến lưu tổng tiền
    
    // Tính số tiền dựa trên số kilômét đi được
    if ($soKm > 0) {
        // Tính tiền từ 1km đầu
        $tongTien += $gia1kmDau;
        
        // Tính tiền từ 1km đến 5km
        if ($soKm > 1 && $soKm <= 5) {
            $tongTien += ($soKm - 1) * $gia1kmTu1Den5;
        }
        
        // Tính tiền từ 6km trở đi
        if ($soKm > 5) {
            $tongTien += ($soKm - 5) * $gia1kmTu6TroDi;
        }
        
        // Áp dụng giảm giá từ 140km trở đi
        if ($soKm >= 140) {
            $giamGia = $tongTien * $giamGiaTu140TroDi;
            $tongTien -= $giamGia;
        }
    } else {
        echo "Số kilômét không hợp lệ";
    }
    
    return $tongTien;
}

// Số kilômét đi được
$soKm = 2;

// Tính số tiền khách phải trả
$tienPhaiTra = tinhTienTaxi($soKm);

// In ra kết quả
echo "Số tiền khách phải trả khi đi {$soKm} km là: " . number_format($tienPhaiTra) . "₫";
?>



</body>

</html>