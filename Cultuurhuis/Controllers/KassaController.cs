using Cultuurhuis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Transactions;

namespace Cultuurhuis.Controllers
{
    public class KassaController : Controller
    {
        // GET: Kassa
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Identificatie()
        {
            this.Session["Bestellen"] = true;
            //return Redirect("~/Account/Login");
            return RedirectToAction("Login", "Account", new { returnUrl = "~/Kassa/OVerzicht" });

        }

        public ActionResult Overzicht()
        {
            Klant klant = (Klant)this.Session["klant"];

            List<Reservatie> mislukteReservaties = new List<Reservatie>();
            List<Reservatie> gelukteReservaties = new List<Reservatie>();

            List<ReserveringForm> reservatieForms = (List<ReserveringForm>)this.Session["reservaties"];
            var transactionOptions = new TransactionOptions
            {
                IsolationLevel = System.Transactions.IsolationLevel.RepeatableRead
            };
            using (var transactionScope = new TransactionScope(TransactionScopeOption.Required, transactionOptions))
            {
                using (var context = new EntitiesDbContext())
                {
                    foreach (ReserveringForm form in reservatieForms) 
                    {
                        var voorstelling = context.Voorstellingen.Find(form.Voorstelling.VoorstellingId);

                        if (voorstelling != null)
                        {
                            Reservatie reservatie = new Reservatie { KlantNr = klant.Id, Plaatsen = form.Plaatsen, VoorstellingsNr = form.Voorstelling.VoorstellingId };
                            // reservatie gelukt
                            if (voorstelling.VrijePlaatsen >= form.Plaatsen)
                            {
                                voorstelling.VrijePlaatsen -= form.Plaatsen;
                                gelukteReservaties.Add(reservatie);
                                context.Reservaties.Add(reservatie);
                            }
                            // ondertussen te weinig vrije plaatsen, dus reservatie mislukt
                            else 
                            {
                                  mislukteReservaties.Add(reservatie);
                            }
                        }
                    }
                    context.SaveChanges();
                    transactionScope.Complete();
                }
            }
            ViewBag.MislukteReservaties = mislukteReservaties;
            ViewBag.gelukteReservaties = gelukteReservaties;

            this.Session["reservaties"] = null;

            return View();
        }

    }
}