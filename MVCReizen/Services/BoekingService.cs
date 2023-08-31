using MVCReizen.Models;
using MVCReizen.Repositories;

namespace MVCReizen.Services
{
    public class BoekingService
    {
        private readonly IBoekingRepository boekingRepository;
        
        public BoekingService(IBoekingRepository boekingRepository)
        {
            this.boekingRepository = boekingRepository;
        }
        public Boeking? GetBoekingById(int id)
        {
            return boekingRepository.GetBoekingById(id);
        }
        public IEnumerable<Boeking> GetAllBoekingen()
        {
            return boekingRepository.GetAllBoekingen();
        }
        public void AddBoeking(Boeking reis)
        {
            boekingRepository.AddBoeking(reis);
        }
   
    }
}
