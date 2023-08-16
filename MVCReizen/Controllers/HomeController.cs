using Microsoft.AspNetCore.Mvc;
using MVCReizen.Models;
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
            var landen = _context.Landen.Where(land=>land.Werelddeelid == id).OrderBy(land=>land.Naam).ToList();
            var werelddeelNaam = _context.Werelddelen.Where(werelddeel => werelddeel.Id == id)
                                                 .Select(werelddeel => werelddeel.Naam).FirstOrDefault();
            ViewBag.WerelddeelNaam = werelddeelNaam;
            return View(landen);
        }
        public IActionResult ToonBestemmingen(int id)
        {
            var bestemmingen = _context.Bestemmingen.Where(bestemming=>bestemming.Landid == id)
                                                    .OrderBy(bestemmingen => bestemmingen.Plaats).ToList();
            var landNaam = _context.Landen.Where(land=>land.Id == id).Select(land=>land.Naam).FirstOrDefault();
            ViewBag.LandNaam = landNaam;
            return View(bestemmingen);
        }
        public IActionResult ToonReizen(int id, string bestemmingscode)
        {
            var reizen = _context.Reizen.Where(reis => reis.Id == id)
                                                 .OrderBy(reizen => reizen.Vertrek).ToList();
            //var bestemmingsCode = _context.Reizen.Where(reis => reis.Bestemmingscode == bestemmingscode).FirstOrDefault();
            var bestemmingsNaam = _context.Bestemmingen.Where(bestemming => bestemming.Code == bestemmingscode).Select(bestemming => bestemming.Plaats).FirstOrDefault();
            ViewBag.BestemmingsNaam = bestemmingsNaam;
            return View(reizen);
        }

    }
}