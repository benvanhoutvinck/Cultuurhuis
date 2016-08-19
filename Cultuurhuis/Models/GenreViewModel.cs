using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cultuurhuis.Models
{
    public class GenreViewModel
    {
        public int SelectedGenreId { get; set; }
        public ICollection<Genre> Genres { get; set; }
        public ICollection<Voorstelling> Voorstellingen { get; set; }
    }
}