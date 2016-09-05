using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BookStore.MVC.Models;

namespace BookStore.MVC.Controllers
{
    public class BooksController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: Books
        public async Task<ActionResult> Index()
        {
            var books = db.Books.Include(b => b.Author).Include(b => b.Genre).Include(b => b.CountryPublished);
            return View(await books.ToListAsync());
        }

        //[HttpPost]
        //public async Task<ActionResult> Index(int? search)
        //{
        //    var books = db.Books.Include(b => b.Author).Include(b => b.Genre).Include(b => b.CountryPublished);
        //    if(search != 0)
        //    {
        //        books = books.Where(n => n.Id == search);
        //    }

        //    return View(await books.ToListAsync());
        //}


        [HttpGet]
        public  ActionResult Data(int? id)
        {
            var books = db.Books.Include(b => b.Author).Include(b => b.Genre).Include(b => b.CountryPublished);
            if (id != 0)
            {
                books = books.Where(n => n.Id == id);
            }

            return PartialView(books);
        }

        // GET: Books/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Book book = await db.Books.FindAsync(id);
            if (book == null)
            {
                return HttpNotFound();
            }
            return View(book);
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
