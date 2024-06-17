using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApplication13.Models;

namespace WebApplication13.Controllers
{
    public class khoasvsController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/khoasvs
        public IQueryable<khoasv> Getkhoasvs()
        {
            return db.khoasvs;
        }

        // GET: api/khoasvs/5
        [ResponseType(typeof(khoasv))]
        public IHttpActionResult Getkhoasv(string id)
        {
            khoasv khoasv = db.khoasvs.Find(id);
            if (khoasv == null)
            {
                return NotFound();
            }

            return Ok(khoasv);
        }

        // PUT: api/khoasvs/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putkhoasv(string id, khoasv khoasv)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != khoasv.khoa)
            {
                return BadRequest();
            }

            db.Entry(khoasv).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!khoasvExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/khoasvs
        [ResponseType(typeof(khoasv))]
        public IHttpActionResult Postkhoasv(khoasv khoasv)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.khoasvs.Add(khoasv);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (khoasvExists(khoasv.khoa))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = khoasv.khoa }, khoasv);
        }

        // DELETE: api/khoasvs/5
        [ResponseType(typeof(khoasv))]
        public IHttpActionResult Deletekhoasv(string id)
        {
            khoasv khoasv = db.khoasvs.Find(id);
            if (khoasv == null)
            {
                return NotFound();
            }

            db.khoasvs.Remove(khoasv);
            db.SaveChanges();

            return Ok(khoasv);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool khoasvExists(string id)
        {
            return db.khoasvs.Count(e => e.khoa == id) > 0;
        }
    }
}