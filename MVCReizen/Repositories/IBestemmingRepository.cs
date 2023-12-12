using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface IBestemmingRepository
    {
        Bestemming GetBestemmingByCode(string id);
        IEnumerable<Bestemming> GetAllBestemmingen();
        IEnumerable<Bestemming> GetAllBestemmingenByLandId(int id);
    }
}
