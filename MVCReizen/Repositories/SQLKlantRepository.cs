using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public class SQLKlantRepository : IKlantRepository
    {
        private readonly ReizenContext _context;
        public SQLKlantRepository(ReizenContext context) 
        {
            _context = context;
        }
        public IQueryable<Klant> GetAllKlanten()
        {
            return _context.Klanten;
        }

        public Klant? GetKlantById(int id)
        {
            return _context.Klanten.Find(id);
        }
    }
}
