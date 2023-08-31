using System;
using System.Collections.Generic;
using System.Linq;
using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public class SQLReisRepository : IReisRepository
    {
        private readonly ReizenContext _context;

        public SQLReisRepository(ReizenContext context)
        {
            _context = context;
        }

        public Reis GetReisById(int id)
        {
            return _context.Reizen.Find(id);
        }

        public IEnumerable<Reis> GetAllReizen()
        {
            return _context.Reizen.ToList();
        }


        public void UpdateReis(Reis reis)
        {
            _context.Reizen.Update(reis);
            //_context.SaveChanges();
        }

           
        
    }
}
