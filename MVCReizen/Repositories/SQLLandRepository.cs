﻿using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public class SQLLandRepository : ILandRepository
    {
        private readonly ReizenContext _context;
        public SQLLandRepository( ReizenContext context )
        {
            _context = context;
        }
        public IEnumerable<Land> GetAllLanden()
        {
            return _context.Landen;
        }

        public Land? GetLandById(int id)
        {
            return _context.Landen.Find(id);
        }
    }
}
