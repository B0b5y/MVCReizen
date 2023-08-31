using System.Collections.Generic;
using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface IWerelddeelRepository
    {
        IEnumerable<Werelddeel> GetAllWerelddelen();
        Werelddeel GetWerelddeelById(int id);
    }
       
}