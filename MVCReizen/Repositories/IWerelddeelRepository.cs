using System.Collections.Generic;
using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface IWerelddeelRepository
    {
        IEnumerable<Werelddeel> GetAllWerelddelen();
        Werelddeel GetWerelddeelById(int id);
        void AddWerelddeel(Werelddeel werelddeel);
        void UpdateWerelddeel(Werelddeel werelddeel);
        void DeleteWerelddeel(int id);
    }
}