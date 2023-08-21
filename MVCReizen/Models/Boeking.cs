using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace MVCReizen.Models;

public partial class Boeking
{
    public int Id { get; set; }

    public int Klantid { get; set; }

    public int Reisid { get; set; }

    public DateTime GeboektOp { get; set; }
    [Required(ErrorMessage = "Jij moet minimum 1 volvassen boeken.")]
    [Range(1, 100, ErrorMessage = "De minimum- en maximumwaarden zijn : {1} en {2}")]
    public int? AantalVolwassenen { get; set; }
    [Range(0, 100, ErrorMessage = "De minimum- en maximumwaarden zijn : {1} en {2}")]
    public int? AantalKinderen { get; set; }

    public bool AnnulatieVerzekering { get; set; }

    public virtual Klant Klant { get; set; } = null!;

    public virtual Reis Reis { get; set; } = null!;
}
