using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace MVCReizen.Models;

public partial class Reis
{
    public int Id { get; set; }

    public string Bestemmingscode { get; set; } = null!;

    public DateTime Vertrek { get; set; }

    public int AantalDagen { get; set; }

    public decimal PrijsPerPersoon { get; set; }
    [Required(ErrorMessage = "Jij moet minimum 1 volvassen boeken.")]
    [Range(1, 100, ErrorMessage = "De minimum- en maximumwaarden zijn : {1} en {2}")]
    public int AantalVolwassenen { get; set; }
    [Range(0, 100, ErrorMessage = "De minimum- en maximumwaarden zijn : {1} en {2}")]

    public int AantalKinderen { get; set; }

    public virtual Bestemming BestemmingscodeNavigation { get; set; } = null!;

    public virtual ICollection<Boeking> Boekingen { get; set; } = new List<Boeking>();
}
