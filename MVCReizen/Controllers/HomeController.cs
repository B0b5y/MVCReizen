using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;
using MVCReizen.ModelView;
using System.Diagnostics;

namespace MVCReizen.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ReizenContext _context;

        public HomeController(ILogger<HomeController> logger, ReizenContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            var werelddelen = _context.Werelddelen.OrderBy(werelddeel => werelddeel.Naam).ToList();
            ViewBag.werelddelen = werelddelen;
            return View(werelddelen);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult ToonLanden(int id)
        {
            var landen = _context.Landen.Where(land => land.Werelddeelid == id).OrderBy(land => land.Naam).ToList();
            var werelddeelNaam = _context.Werelddelen.Where(werelddeel => werelddeel.Id == id)
                                                 .Select(werelddeel => werelddeel.Naam).FirstOrDefault();
            ViewBag.WerelddeelNaam = werelddeelNaam;
            return View(landen);
        }
        public IActionResult ToonBestemmingen(int id)
        {
            var bestemmingen = _context.Bestemmingen.Where(bestemming => bestemming.Landid == id)
                                                    .OrderBy(bestemmingen => bestemmingen.Plaats).ToList();
            var landNaam = _context.Landen.Where(land => land.Id == id).Select(land => land.Naam).FirstOrDefault();
            ViewBag.LandNaam = landNaam;
            return View(bestemmingen);
        }
        public IActionResult ToonReizen(string id)
        {
            var reizen = _context.Reizen.Where(reis => reis.Bestemmingscode == id)
                                                 .OrderBy(reizen => reizen.Vertrek).ToList();
            var bestemming = _context.Bestemmingen.Find(id);
            ViewBag.BestemmingsNaam = bestemming.Plaats;
            return View(reizen);
        }
        public IActionResult ZoekKlant(int id)
        {          
            var gekozenReis = _context.Reizen.Where(reis => reis.Id == id)
                .Include(reis => reis.BestemmingscodeNavigation)
                .FirstOrDefault();
            
            return View(gekozenReis);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Zoek(string klantZoeken, int reisId)
        {
            var reis = _context.Reizen.Where(reis => reis.Id == reisId).Include(reis=>reis.BestemmingscodeNavigation).FirstOrDefault();
            var klanten = _context.Klanten.Where(klant => klant.Familienaam.Contains(klantZoeken))
                    .Include(klant => klant.Woonplaats).OrderBy(klant=>klant.Familienaam).ToList();
            var reisEnKlanten = new ReisEnKlanten() { Reis = reis, Klanten = klanten };            
            return View(reisEnKlanten);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Boeking(int reisId, int klantId)
        {
            var reis = _context.Reizen.Where(reis => reis.Id == reisId).Include(reis => reis.BestemmingscodeNavigation).FirstOrDefault();
            var klant = _context.Klanten.Where(klant => klant.Id == klantId).Include(klant => klant.Woonplaats).FirstOrDefault();
            var klantlijst = new List<Klant> { klant };
            var reisEnKlant = new ReisEnKlanten() { Reis = reis, Klanten = klantlijst };
            return View(reisEnKlant);
        }
    }
} 