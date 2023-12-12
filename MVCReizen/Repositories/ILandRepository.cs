using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface ILandRepository
    {
        Land GetLandById(int id);
        IEnumerable<Land> GetAllLanden();
        IEnumerable<Land> GetAllLandenByWerelddeel(int id);
        string GetLandNaamById(int id);
    }
}
