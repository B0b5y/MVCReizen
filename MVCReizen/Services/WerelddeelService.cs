using MVCReizen.Models;
using MVCReizen.Repositories;

namespace MVCReizen.Services
{
    public class WerelddeelService
    {
        private readonly IWerelddeelRepository werelddeelRepository;
        private readonly WerelddeelService werelddeelService;
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
       
     
    }
}
