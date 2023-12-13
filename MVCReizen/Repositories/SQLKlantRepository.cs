using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;
using System.Numerics;

namespace MVCReizen.Repositories
{
    public class SQLKlantRepository : IKlantRepository
    {
        private readonly ReizenContext _context;
        public SQLKlantRepository(ReizenContext context) 
        {
            _context = context;
        }
        public IQueryable<Klant> GetAllKlanten()
        {
            return _context.Klanten;
        }

        public Klant? GetKlantById(int id)
        {
            return _context.Klanten.Find(id);
        } 
        public ICollection<Klant> GetKlantenByWoonplaatsEnFamilienaam(string klantZoeken)
        {
            return _context.Klanten.Where(klant => klant.Familienaam.Contains(klantZoeken)).Include(klant => klant.Woonplaats).OrderBy(klant => klant.Familienaam).ToList();             
        }
        //GetAllKlanten().Where(klant => klant.Familienaam.Contains(klantZoeken))
        //            .Include(klant => klant.Woonplaats).OrderBy(klant => klant.Familienaam).ToList();
    }
}
