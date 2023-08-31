using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;
using MVCReizen.Repositories;

namespace MVCReizen.Services
{
    public class BestemmingService
    {
        private readonly IBestemmingRepository bestemmingRepository;
        public BestemmingService(IBestemmingRepository bestemmingRepository)
        {
            this.bestemmingRepository = bestemmingRepository;
        }
        public IEnumerable<Bestemming> GetAllBestemmingen()
        {
            return bestemmingRepository.GetAllBestemmingen();
        }

        public Bestemming? GetBestemmingByCode(string id)
        {
            return bestemmingRepository.GetBestemmingByCode(id);
        }

    }
}
