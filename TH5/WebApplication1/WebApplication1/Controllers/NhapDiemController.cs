using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using WebApplication1.Models;
namespace WebApplication1.Controllers
{
    public class NhapDiemController : Controller
    {
        // GET: NhapDiem
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Save(SinhVien sv)
        {
            string path = Server.MapPath("~/StudentInfo.txt");
            string[] lines = { sv.id, sv.name, sv.mark.ToString() };
            System.IO.File.WriteAllLines(path, lines);
            ViewBag.HanhDong = "da ghi tu file";
            return View("Index");
        }
        public ActionResult Open(SinhVien sv)
        {

            string path = Server.MapPath("~/StudentInfo.txt");
            string[] lines = System.IO.File.ReadAllLines(path);
            sv.id = lines[0];
            sv.name = lines[1];
            sv.mark = Convert.ToString(lines[2]);
            ViewBag.ThongTin = "Ma sinh vien " + sv.id + "- Ho ten " + sv.name + "- diem " + sv.mark;
            ViewBag.HanhDong = "doc thong tin tu file";
            return View("Index", sv);

        }
    }

}