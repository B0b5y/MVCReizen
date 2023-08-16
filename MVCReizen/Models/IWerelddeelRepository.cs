using System.Collections.Generic;

namespace MVCReizen.Models
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