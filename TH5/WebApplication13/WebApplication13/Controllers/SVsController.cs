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
    public class SVsController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/SVs
        public IQueryable<SV> GetSVs()
        {
            return db.SVs;
        }

        // GET: api/SVs/5
        [ResponseType(typeof(SV))]
        public IHttpActionResult GetSV(string id)
        {
            SV sV = db.SVs.Find(id);
            if (sV == null)
            {
                return NotFound();
            }

            return Ok(sV);
        }

        // PUT: api/SVs/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSV(string id, SV sV)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != sV.id)
            {
                return BadRequest();
            }

            db.Entry(sV).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SVExists(id))
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

        // POST: api/SVs
        [ResponseType(typeof(SV))]
        public IHttpActionResult PostSV(SV sV)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.SVs.Add(sV);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SVExists(sV.id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = sV.id }, sV);
        }

        // DELETE: api/SVs/5
        [ResponseType(typeof(SV))]
        public IHttpActionResult DeleteSV(string id)
        {
            SV sV = db.SVs.Find(id);
            if (sV == null)
            {
                return NotFound();
            }

            db.SVs.Remove(sV);
            db.SaveChanges();

            return Ok(sV);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SVExists(string id)
        {
            return db.SVs.Count(e => e.id == id) > 0;
        }
    }
}