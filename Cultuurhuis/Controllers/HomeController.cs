using Cultuurhuis.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Cultuurhuis.Controllers
{
    public class HomeController : Controller
    {
        private EntitiesDbContext db = new EntitiesDbContext();

        [AllowAnonymous]
        public ActionResult Index()
        {
            GenreViewModel vm = new GenreViewModel();
            List<Genre> genreList = db.Genres.ToList();
            genreList.Sort((x, y) => string.Compare(x.Naam, y.Naam));
            vm.Genres = genreList;
            return View(vm);
        }

        [AllowAnonymous]
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        [AllowAnonymous]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [AllowAnonymous]
        public ActionResult SelectGenre(int? selectedGenreId)
        {
            if (selectedGenreId == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GenreViewModel vm = new GenreViewModel();

            vm.SelectedGenreId = selectedGenreId ?? default(int);

            List<Genre> genreList = db.Genres.ToList();
            genreList.Sort((x, y) => string.Compare(x.Naam, y.Naam));

            vm.Genres = genreList;

            vm.Voorstellingen = (from vrst in db.Voorstellingen where vrst.GenreNr == vm.SelectedGenreId && DbFunctions.TruncateTime(vrst.Datum) > System.DateTime.Now select vrst).ToList();

            return View("Index", vm);

        }
    }
}