using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;
using MVCReizen.Repositories;
namespace MVCReizen.Services

{
    public class LandService
    {
        private readonly ILandRepository landRepository;
        public LandService(ILandRepository landRepository)
        {
            this.landRepository = landRepository;
        }
        public IEnumerable<Land> GetAllLanden()
        {
            return landRepository.GetAllLanden();
        }

        public Land? GetLandById(int id)
        {
            return landRepository.GetLandById(id);
    }
}
