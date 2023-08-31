using MVCReizen.Models;
using MVCReizen.Repositories;
namespace MVCReizen.Services
{
    public class ReisService
    {
        private readonly IReisRepository reisRepository;
        private readonly ReisService reisService;
        public ReisService(IReisRepository reisRepository)
        {
            this.reisRepository = reisRepository;
        }
        public Reis GetReisById(int id)
        {
            return reisRepository.GetReisById(id);
        }
        public IEnumerable<Reis>GetAllReizen() 
        {
            return reisRepository.GetAllReizen();
        }

        public void UpdateReis(Reis reis)
        {
            reisRepository.UpdateReis(reis);
        }

        
    }
}
