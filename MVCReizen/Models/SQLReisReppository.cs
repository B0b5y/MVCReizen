using System;
using System.Collections.Generic;
using System.Linq;

namespace MVCReizen.Models
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

        public void AddReis(Reis reis)
        {
            _context.Reizen.Add(reis);
            _context.SaveChanges();
        }

        public void UpdateReis(Reis reis)
        {
            _context.Reizen.Update(reis);
            _context.SaveChanges();
        }

        public void DeleteReis(int id)
        {
            var reis = _context.Reizen.Find(id);
            if (reis != null)
            {
                _context.Reizen.Remove(reis);
                _context.SaveChanges();
            }
        }
    }
}
