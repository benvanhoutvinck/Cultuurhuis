using Cultuurhuis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Cultuurhuis.Controllers
{
    public class ReserveringController : Controller
    {
        private EntitiesDbContext db = new EntitiesDbContext();
        public ActionResult Reserveren(int? id)
        {     
            ReserveringForm form = new ReserveringForm();
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            //Kijk of er voor deze voorstelling al tickets in het mandje liggen
            if (this.Session["Reservaties"] != null)
            {
                foreach (ReserveringForm f in (List<ReserveringForm>)this.Session["Reservaties"])
                {
                    //voorstelling gevonden
                    if (f.Voorstelling.VoorstellingId == id)
                    {
                        form = f;
                        return View(form);
                    }
                }
            }

            Voorstelling voorstelling = db.Voorstellingen.Find(id);
            this.Session["geselecteerdeVoorstelling"] = voorstelling;
            if (voorstelling == null)
            {
                return HttpNotFound();
            }


            form.Plaatsen = 1;
            form.VrijePlaatsen = voorstelling.VrijePlaatsen;
            form.Voorstelling = voorstelling;
            form.Verwijder = false;

            return View(form);
        }

        [HttpPost]
        public ActionResult Reserveren(ReserveringForm form)
        {
            form.Verwijder = false;
            form.Voorstelling = (Voorstelling)this.Session["geselecteerdeVoorstelling"];

            if (this.ModelState.IsValid)
            {
                if (this.Session["Reservaties"] == null)
                {
                    List<ReserveringForm> reservaties = new List<ReserveringForm>();
                    reservaties.Add(form);

                    this.Session["Reservaties"] = reservaties;
                    return RedirectToAction("Overzicht");
                }
                else
                {
                    //Kijk of er voor deze voorstelling reeds tickets gereserveerd zijn, zoja aantal plaatsen aanpassen
                    foreach (ReserveringForm f in (List<ReserveringForm>)this.Session["Reservaties"])
                    {
                        if (f.Voorstelling.VoorstellingId == form.Voorstelling.VoorstellingId)
                        {
                            f.Plaatsen = form.Plaatsen;
                            return RedirectToAction("Overzicht");
                        }
                    }
                }
                ((List<ReserveringForm>)this.Session["Reservaties"]).Add(form);
                
                return RedirectToAction("Overzicht");
            }
            else
            {
                return View(form);
            }
        }


        public ActionResult Overzicht()
        {
            List<ReserveringForm> forms = (List<ReserveringForm>)this.Session["Reservaties"];

            if (forms != null)
                TotaalBerekenen();

            return View(forms);
        }

        [HttpPost]
        public ActionResult Verwijderen(List<ReserveringForm> forms)
        {
            List<ReserveringForm> newForms = new List<ReserveringForm>();

            for (int i = 0; i < forms.Count; i++)
            {
                if (!forms[i].Verwijder)
                {
                    newForms.Add(((List<ReserveringForm>)this.Session["Reservaties"])[i]);
                }
            }
            if (newForms.Count > 0)
                this.Session["Reservaties"] = newForms;
            else
                this.Session["Reservaties"] = null;

            return RedirectToAction("Overzicht");
        }

        private void TotaalBerekenen()
        {
            decimal totaal = 0;

            foreach (ReserveringForm f in (List<ReserveringForm>)this.Session["Reservaties"])
            {
                totaal += f.Plaatsen * f.Voorstelling.Prijs;
            }

            ViewBag.totaal = totaal;
        }



    }
}