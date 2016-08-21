using Cultuurhuis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cultuurhuis.Service
{
    public class CultuurService
    {
        private EntitiesDbContext db;

        public Klant getKlantByUserid(string userId)
        {
            db = new EntitiesDbContext();
            using (db)
            {
                var query = from klant in db.Klanten
                            where klant.User_id == userId
                            select klant;
                return query.FirstOrDefault();
            }
        }

        public Klant createKlant(Klant klant)
        {
            db = new EntitiesDbContext();
            using (db)
            {
                db.Klanten.Add(klant);
                db.SaveChanges();
            }
            return klant;
        }

        public bool usernameInUse(string username)
        {
            db = new EntitiesDbContext();
            using (db)
            {
                if (db.Klanten.Any(o => o.GebruikersNaam == username))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

    }
}