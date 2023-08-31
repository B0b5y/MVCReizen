using MVCReizen.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MVCReizen.Repositories
{
    public class WerelddeelRepository : IWerelddeelRepository
    {
        private readonly ReizenContext _context;

        public WerelddeelRepository(ReizenContext context)
        {
            _context = context;
        }

        public IEnumerable<Werelddeel> GetAllWerelddelen()
        {
            return _context.Werelddelen.ToList();
        }

        public Werelddeel GetWerelddeelById(int id)
        {
            return _context.Werelddelen.Find(id);
        }


     
    }
}
