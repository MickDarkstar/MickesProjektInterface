using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MickesProjektSite.Models;

namespace MickesProjektSite.Controllers
{
    public class ProjectDetailsController : Controller
    {
        private MickesProjektDataEntities db = new MickesProjektDataEntities();

        // GET: ProjectDetails
        public ActionResult Index()
        {
            var projectDetails = db.ProjectDetails.Include(p => p.Person).Include(p => p.Project);
            return View(projectDetails.ToList());
        }

        // GET: ProjectDetails/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectDetail projectDetail = db.ProjectDetails.Find(id);
            if (projectDetail == null)
            {
                return HttpNotFound();
            }
            return View(projectDetail);
        }

        // GET: ProjectDetails/Create
        public ActionResult Create()
        {
            ViewBag.PersonID = new SelectList(db.People, "PersonID", "LastName");
            ViewBag.ProjectID = new SelectList(db.Projects, "ProjectID", "ProjectTitle");
            return View();
        }

        // POST: ProjectDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProjectDetailsID,ProjectID,PersonID,Todo")] ProjectDetail projectDetail)
        {
            if (ModelState.IsValid)
            {
                db.ProjectDetails.Add(projectDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PersonID = new SelectList(db.People, "PersonID", "LastName", projectDetail.PersonID);
            ViewBag.ProjectID = new SelectList(db.Projects, "ProjectID", "ProjectTitle", projectDetail.ProjectID);
            return View(projectDetail);
        }

        // GET: ProjectDetails/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectDetail projectDetail = db.ProjectDetails.Find(id);
            if (projectDetail == null)
            {
                return HttpNotFound();
            }
            ViewBag.PersonID = new SelectList(db.People, "PersonID", "LastName", projectDetail.PersonID);
            ViewBag.ProjectID = new SelectList(db.Projects, "ProjectID", "ProjectTitle", projectDetail.ProjectID);
            return View(projectDetail);
        }

        // POST: ProjectDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProjectDetailsID,ProjectID,PersonID,Todo")] ProjectDetail projectDetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(projectDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PersonID = new SelectList(db.People, "PersonID", "LastName", projectDetail.PersonID);
            ViewBag.ProjectID = new SelectList(db.Projects, "ProjectID", "ProjectTitle", projectDetail.ProjectID);
            return View(projectDetail);
        }

        // GET: ProjectDetails/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectDetail projectDetail = db.ProjectDetails.Find(id);
            if (projectDetail == null)
            {
                return HttpNotFound();
            }
            return View(projectDetail);
        }

        // POST: ProjectDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProjectDetail projectDetail = db.ProjectDetails.Find(id);
            db.ProjectDetails.Remove(projectDetail);
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
    }
}
