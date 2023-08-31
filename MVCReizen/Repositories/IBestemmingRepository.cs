using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface IBestemmingRepository
    {
        Bestemming GetBestemmingById(int id);
        IEnumerable<Bestemming> GetAllBestemmingen();
    }
}
