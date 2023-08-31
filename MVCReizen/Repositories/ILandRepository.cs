using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface ILandRepository
    {
        Land GetLandById(int id);
        IEnumerable<Land> GetAllLanden();
    }
}
