using MVCReizen.Models;

namespace MVCReizen.ModelView
{
    public class ReisEnKlanten
    {
        public Reis? Reis { get; set; }
        public virtual ICollection<Klant> Klanten { get; set; } = new List<Klant>();
    }
}
