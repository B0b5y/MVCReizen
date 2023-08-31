using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public class SQLBestemmingRepository : IBestemmingRepository
    {
        private readonly ReizenContext _context;
        public SQLBestemmingRepository(ReizenContext context)
        {
        _context = context;
        }

        public IEnumerable<Bestemming> GetAllBestemmingen()
        {
            return _context.Bestemmingen;
        }

        public Bestemming? GetBestemmingById(int id)
        {
            return _context.Bestemmingen.Find(id);
        }
    }
}
