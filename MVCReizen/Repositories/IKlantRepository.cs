using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface IKlantRepository
    {
        Klant GetKlantById(int id);
        IEnumerable<Klant> GetAllKlanten();
    }
}
