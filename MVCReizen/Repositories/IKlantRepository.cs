using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface IKlantRepository
    {
        Klant GetKlantById(int id);
        IQueryable<Klant> GetAllKlanten();
        ICollection<Klant> GetKlantenByWoonplaatsEnFamilienaam(string klantZoeken);
        Klant GetKlantByIdMetWoonplats(int klantId);
    }
}
