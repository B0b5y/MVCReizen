using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface IKlantRepository
    {
        Klant GetKlantById(int id);
        IQueryable<Klant> GetAllKlanten();
        public ICollection<Klant> GetKlantenByWoonplaatsEnFamilienaam(string klantZoeken);
    }
}
