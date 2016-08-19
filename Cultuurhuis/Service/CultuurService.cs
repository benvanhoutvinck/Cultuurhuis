using Cultuurhuis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cultuurhuis.Service
{
    public class CultuurService
    {
        private EntitiesDbContext db = new EntitiesDbContext();

        public Klant getKlantByUserid(string userId)
        {
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
            using (db)
            {
                db.Klanten.Add(klant);
                db.SaveChanges();
            }
            return klant;
        }

    }
}