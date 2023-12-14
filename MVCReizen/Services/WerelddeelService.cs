using MVCReizen.Models;
using MVCReizen.Repositories;

namespace MVCReizen.Services
{
    public class WerelddeelService
    {
        private readonly IWerelddeelRepository werelddeelRepository;
        public WerelddeelService(IWerelddeelRepository werelddeelRepository)
        {
            this.werelddeelRepository = werelddeelRepository;
        }
        public IEnumerable<Werelddeel> GetAllWerelddelen() 
        {
            return werelddeelRepository.GetAllWerelddelen();
        }
        public Werelddeel? GetWerelddeelById(int id)
        {
            return werelddeelRepository.GetWerelddeelById(id);
        }
        public string? GetWereldeelNaamById(int id)
        { 
            return werelddeelRepository.GetWerelddeelNaamById(id);
        }        
        public IEnumerable<Werelddeel> GetAllWerelddelenOrderByNaam()
        {
            return werelddeelRepository.GetAllWerelddelenOrderByNaam();
        }
    }
}
