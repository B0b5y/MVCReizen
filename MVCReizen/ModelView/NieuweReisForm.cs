using MVCReizen.Models;
using System.ComponentModel.DataAnnotations;

namespace MVCReizen.ModelView
{
    public class NieuweReisForm
    {

        [Required(ErrorMessage = "Jij moet minimum 1 volvassen boeken.")]
        [Range(1, 100, ErrorMessage = "De minimum- en maximumwaarden zijn : {1} en {2}")]
        public int? AantalVolwassenen { get; set; }
        [Range(0, 100, ErrorMessage = "De minimum- en maximumwaarden zijn : {1} en {2}")]
        public int? AantalKinderen { get; set; }

        public bool AnnulatieVerzekering { get; set; }
        public int KlantId { get; set; }
        public int ReisId { get; set; }
    }
}

