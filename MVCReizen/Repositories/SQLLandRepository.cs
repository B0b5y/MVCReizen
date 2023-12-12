using MVCReizen.Models;

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
        public IEnumerable<Land> GetAllLandenByWerelddeel(int id) 
        {
            return _context.Landen.Where(land => land.Werelddeelid == id).OrderBy(land => land.Naam).ToList();
        }
        public string? GetLandNaamById(int id)
        {
            return _context.Landen.Where(land => land.Id == id).Select(land => land.Naam).FirstOrDefault();          
        }
       
    }
}
