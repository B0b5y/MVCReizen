using MVCReizen.Models;
using MVCReizen.Repositories;

namespace MVCReizen.Services
{
    public class BoekingsService
    {
        private readonly IBoekingsRepository boekingsRepository;
        private readonly BoekingsService boekingsService;
        public BoekingsService(IBoekingsRepository boekingsRepository)
        {
            this.boekingsRepository = boekingsRepository;
        }
        public Boeking? GetBoekingById(int id)
        {
            return boekingsRepository.GetBoekingById(id);
        }
        public IEnumerable<Boeking> GetAllBoekingen()
        {
            return boekingsRepository.GetAllBoekingen();
        }
        public void AddBoeking(Boeking reis)
        {
            boekingsRepository.AddBoeking(reis);
        }
   
    }
}
