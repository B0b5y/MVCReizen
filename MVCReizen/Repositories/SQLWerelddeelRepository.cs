using MVCReizen.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MVCReizen.Repositories
{
    public class SQLWerelddeelRepository : IWerelddeelRepository
    {
        private readonly ReizenContext _context;

        public SQLWerelddeelRepository(ReizenContext context)
        {
            _context = context;
        }

        public IEnumerable<Werelddeel> GetAllWerelddelen()
        {
            return _context.Werelddelen.ToList();
        }
        public Werelddeel? GetWerelddeelById(int id)
        {
            return _context.Werelddelen.Find(id);
        }
        public string? GetWerelddeelNaamById(int id)
        {
            return _context.Werelddelen.Where(werelddeel => werelddeel.Id == id).Select(werelddeel => werelddeel.Naam).FirstOrDefault();
        }
        public IEnumerable<Werelddeel> GetAllWerelddelenOrderByNaam()
        {
            return _context.Werelddelen.OrderBy(Werelddeel => Werelddeel.Naam).ToList();
        }
        
    }
}
