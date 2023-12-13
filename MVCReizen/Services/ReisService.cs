using MVCReizen.Models;
using MVCReizen.Repositories;
namespace MVCReizen.Services
{
    public class ReisService
    {
        private readonly IReisRepository reisRepository;
        
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
        public IEnumerable<Reis>GetAllReizenMetBetemmingen()
        {
            return reisRepository.GetAllReizenMetBestemmingen();
        }
        public Reis? GetReisMetBestemmingenByReisId(int reisId)
        {
            return reisRepository.GetReisMetBestemmingenByReisId(reisId);            
        }
        public IEnumerable<Reis> GetAllReizenMetZelfdeBestemmingscode(string id)
        {
            return reisRepository.GetAllReizenMetZelfdeBetstemmingscode(id);
        }



    }
}
