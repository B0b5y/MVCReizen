using System;
using System.Collections.Generic;
using System.Linq;
using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public class SQLBoekingRepository : IBoekingsRepository
    {
        private readonly ReizenContext _context;

        public SQLBoekingRepository(ReizenContext context)
        {
            _context = context;
        }

        public Boeking? GetBoekingById(int id)
        {
            return _context.Boekingen.Find(id);
        }

        public IEnumerable<Boeking> GetAllBoekingen()
        {
            return _context.Boekingen.ToList();
        }

        public void AddBoeking(Boeking boeking)
        {
            _context.Boekingen.Add(boeking);
            _context.SaveChanges();
        }


        
    }
}
