using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;
using MVCReizen.Repositories;

namespace MVCReizen.Services
{
    public class KlantService
    {
        private readonly IKlantRepository klantRepository;
        public KlantService(IKlantRepository klantRepository)
        {
            this.klantRepository = klantRepository;
        }

        public IEnumerable<Klant> GetAllKlanten()
        {
            return klantRepository.GetAllKlanten();
        }

        public Klant? GetKlantById(int id)
        {
            return klantRepository.GetKlantById(id);
        }
    }
}
