using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ontap2.Models;

namespace ontap2.Controllers
{
    public class NhanViensController : Controller
    {
        private Model1 db = new Model1();

        // GET: NhanViens
        public ActionResult Index()
        {
            var nhanViens = db.NhanViens.Include(n => n.Phong);
            return View(nhanViens.ToList());
        }

        public ActionResult Menu()
        {
            var li = db.Phongs.ToList();
            return PartialView(li);
        }
        [Route("NhanVienTheoPhong/{Maphong}")]
        public ActionResult HienThiTheoPhong(int Maphong)
        {
            var li = db.NhanViens.Where(e => e.Maphong == Maphong).ToList();
            return View(li);
        }


        // GET: NhanViens/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.NhanViens.Find(id);
            if (nhanVien == null)
            {
                return HttpNotFound();
            }
            return View(nhanVien);
        }

        // GET: NhanViens/Create
        public ActionResult Create()
        {
            ViewBag.Maphong = new SelectList(db.Phongs, "Maphong", "Tenphong");
            return View();
        }

        // POST: NhanViens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Manv,Hoten,Matkhau,Tuoi,Diachi,Luong,Maphong")] NhanVien nhanVien)
        {
            if (ModelState.IsValid)
            {
                db.NhanViens.Add(nhanVien);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Maphong = new SelectList(db.Phongs, "Maphong", "Tenphong", nhanVien.Maphong);
            return View(nhanVien);
        }

        // GET: NhanViens/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.NhanViens.Find(id);
            if (nhanVien == null)
            {
                return HttpNotFound();
            }
            ViewBag.Maphong = new SelectList(db.Phongs, "Maphong", "Tenphong", nhanVien.Maphong);
            return View(nhanVien);
        }

        // POST: NhanViens/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Manv,Hoten,Matkhau,Tuoi,Diachi,Luong,Maphong")] NhanVien nhanVien)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhanVien).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Maphong = new SelectList(db.Phongs, "Maphong", "Tenphong", nhanVien.Maphong);
            return View(nhanVien);
        }

        // GET: NhanViens/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.NhanViens.Find(id);
            if (nhanVien == null)
            {
                return HttpNotFound();
            }
            return View(nhanVien);
        }

        // POST: NhanViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NhanVien nhanVien = db.NhanViens.Find(id);
            db.NhanViens.Remove(nhanVien);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]

        public ActionResult Login(string username, string password)
        {
            var user = db.NhanViens.Where(x => x.Manv.ToString() == username && x.Matkhau == password).FirstOrDefault();
            if (user == null)
            {
                ViewBag.errLogin = "sai mat khau";
                return View();
            }
            else
            {
                Session["user"] = user.Hoten;
                return RedirectToAction("index");
            }
        }

        public ActionResult Logout()
        {
            Session["user"] = null;
            return RedirectToAction("Login");
        }
    }
}