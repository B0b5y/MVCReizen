using System.Collections.Generic;
using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface IWerelddeelRepository
    {
        IEnumerable<Werelddeel> GetAllWerelddelen();
        Werelddeel GetWerelddeelById(int id);
        string GetWerelddeelNaamById(int id);
        IEnumerable<Werelddeel> GetAllWerelddelenOrderByNaam();
    }
       
}