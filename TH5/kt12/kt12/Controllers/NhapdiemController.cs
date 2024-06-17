using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using kt12.Models;
namespace kt12.Controllers
{
    public class NhapdiemController : Controller
    {
        // GET: Nhapdiem
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult MyLINK()
        {
            ViewBag.Message = "LIEN KET CUA TOI";
            return View();
        }
        public ActionResult MyLINK1()
        {
            return View();
        }
        public ActionResult nhapdiem()
        {
            return View();
        }

        public ActionResult save(Class1 sv) 
        {
            string path = Server.MapPath("~StudentInfo.txt");

            string[] lines = {sv.Id, sv.Name, sv.Diemkt.ToString()};

            System.IO.File.WriteAllLines(path, lines);
            ViewBag.hanhdong = "da gi file";
            return View("nhapdiem");
        }

        public ActionResult open(Class1 sv) 
        {
            string path = Server.MapPath("~StudentInfo.txt");

            string[] lines = System.IO.File.ReadAllLines(path);

            sv.Id = lines[0];
            sv.Name = lines[1];
            sv.Diemkt = Convert.ToDouble(lines[2]);
            ViewBag.thongtin = "ma sinh vien " + sv.Id + "- ho ten " +sv.Name + "- diem" +sv.Diemkt;
            ViewBag.hanhdong = "da gi file";
            return View("nhapdiem", sv);
        }
        
    }
}