using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using ExpressiveAnnotations.Attributes;

namespace Cultuurhuis.Models
{
    public class ReserveringForm : IValidatableObject
    {
        public short VrijePlaatsen { get; set; }
        public Voorstelling Voorstelling { get; set; }
        [Required(ErrorMessage = "Plaatsen is een verplicht veld")]
        public short Plaatsen { get; set; }
        public Boolean Verwijder { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            var validationResults = new List<ValidationResult>();
            if (Plaatsen > VrijePlaatsen)
            {
                validationResults.Add(new ValidationResult("U moet een waarde invoeren tussen 1 en " + VrijePlaatsen));
            }
            return validationResults;
        }
    }
}