
using Microsoft.EntityFrameworkCore;
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

        public Reis? GetReisById(int id)
        {
            return _context.Reizen.Find(id);
        }

        public IEnumerable<Reis> GetAllReizen()
        {
            return _context.Reizen.ToList();
        }
        public IEnumerable<Reis> GetAllReizenMetBestemmingen() => _context.Reizen
                    .Include(reis => reis.BestemmingscodeNavigation).ToList();


        public void UpdateReis(Reis reis)
        {
            _context.Reizen.Update(reis);
            //_context.SaveChanges();
        }
        public Reis? GetReisMetBestemmingenByReisId(int reisId)
        {
            return _context.Reizen.Include(reis => reis.BestemmingscodeNavigation).ToList().Where(reis => reis.Id == reisId).FirstOrDefault();
        }

        public IEnumerable<Reis> GetAllReizenMetZelfdeBetstemmingscode(string id)
        {
            return _context.Reizen.Where(reis => reis.Bestemmingscode == id).OrderBy(reizen => reizen.Vertrek).ToList();
        }
    }
}
