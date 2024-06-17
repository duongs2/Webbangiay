using kttt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace kttt.Controllers
{
    public class quanlysanphamController : Controller
    {
        // Biến thành viên để lưu trữ danh sách sản phẩm
        private List<sanpham> danhsach;

        // Phương thức khởi tạo không tham số của QuanlySanphamController
        public quanlysanphamController()
        {
            danhsach = new List<sanpham>
            {
            new sanpham("S01", "Sản phẩm 1", 10, 100, 0),
            new sanpham("S02", "Sản phẩm 2", 20, 120, 1),
            new sanpham("S03", "Sản phẩm 3", 15, 200, 1),
            new sanpham("S04", "Sản phẩm 4", 30, 150, 0),
            new sanpham("S05", "Sản phẩm 5", 20, 50, 1)
            };
        }

        public ActionResult DanhSachGiaTienLonHon100()
        {
            // Lấy danh sách sản phẩm có giá tiền > 100
            var danhSachGiaTienLonHon100 = danhsach.Where(s => s.giatien > 100).ToList();

            return View(danhSachGiaTienLonHon100);
        }

        public ActionResult DanhSachSanPhamGiamGia()
        {
            // Lấy danh sách sản phẩm có giảm giá (giảm giá có giá trị là 1)
            var danhSachSanPhamGiamGia = danhsach.Where(s => s.giamgia == 1).ToList();

            return View(danhSachSanPhamGiamGia);
        }

    }
}