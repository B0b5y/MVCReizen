﻿using MVCReizen.Models;

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

        public Bestemming? GetBestemmingByCode(string id)
        {
            return _context.Bestemmingen.Find(id);
        }
       public IEnumerable<Bestemming> GetAllBestemmingenByLandId(int id)
        {
            return _context.Bestemmingen.Where(bestemming => bestemming.Landid == id)
                                                    .OrderBy(bestemmingen => bestemmingen.Plaats).ToList();
        }
    }
}
