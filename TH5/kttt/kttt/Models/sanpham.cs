using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kttt.Models
{
    public class sanpham
    {
        public string masp { get; set; }
        public string tensanpham { get; set; }
        public int soluong { get; set; }
        public decimal giatien { get; set; }
        public decimal giamgia { get; set; }

        // Thuộc tính thanhtien sẽ được tính toán
        public decimal thanhtien
        {
            get
            {
                if (giamgia > 0)
                {
                    // Nếu có giảm giá, tính thanh tiền với giảm giá (10% giảm)
                    return soluong * giatien * 0.9m;
                }
                else
                {
                    // Nếu không có giảm giá, tính thanh tiền bình thường
                    return soluong * giatien;
                }
            }
        }

        // Constructor để khởi tạo đối tượng Sanpham
        public sanpham(string masp, string tensanpham, int soluong, decimal giatien, decimal giamgia)
        {
            this.masp = masp;
            this.tensanpham = tensanpham;
            this.soluong = soluong;
            this.giatien = giatien;
            this.giamgia = giamgia;
        }
    }
}