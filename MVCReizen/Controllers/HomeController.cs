using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;
using MVCReizen.ModelView;
using MVCReizen.Repositories;
using MVCReizen.Services;
using System.Diagnostics;
using System.Numerics;

namespace MVCReizen.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly BoekingService boekingService;
        private readonly ReisService reisService;
        private readonly WerelddeelService werelddeelService;
        public HomeController(ILogger<HomeController> logger,
            ReisService reisService, BoekingService boekingService, WerelddeelService werelddeelService)
        {
            _logger = logger;
      
            this.boekingService = boekingService;
            this.reisService = reisService;
            this.werelddeelService = werelddeelService;
        }

        public IActionResult Index()
        {
            var werelddelen = werelddeelService.GetAllWerelddelen().OrderBy(werelddeel => werelddeel.Naam).ToList();
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
            var werelddeel = werelddeelService.GetWerelddeelById(id);
            var landen = werelddeel.Landen.OrderBy(land => land.Naam).ToList();
            var werelddeelNaam = werelddeel.Naam;
            ViewBag.WerelddeelNaam = werelddeelNaam;
            return View(landen);
        }
        public IActionResult ToonBestemmingen(int id)
        {
            var werelddeel = werelddeelService.GetAllWerelddelen();
            var bestemmingen = werelddeel.Where(bestemming => bestemming.Landen
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
        [HttpGet]
        public IActionResult Zoek(string klantZoeken, int reisId)
        {
            var reis = _context.Reizen.Where(reis => reis.Id == reisId).Include(reis => reis.BestemmingscodeNavigation).FirstOrDefault();
            var klanten = _context.Klanten.Where(klant => klant.Familienaam.Contains(klantZoeken))
                    .Include(klant => klant.Woonplaats).OrderBy(klant => klant.Familienaam).ToList();
            var reisEnKlanten = new ReisEnKlanten() { Reis = reis, Klanten = klanten };
            return View(reisEnKlanten);
        }
        [HttpGet]
        public IActionResult Boeking(int reisId, int klantId)
        {
            var reis = _context.Reizen.Where(reis => reis.Id == reisId).Include(reis => reis.BestemmingscodeNavigation).FirstOrDefault();
            var klant = _context.Klanten.Where(klant => klant.Id == klantId).Include(klant => klant.Woonplaats).FirstOrDefault();
            var nieuweReisForm = new NieuweReisForm()
            {
                KlantId = klantId,
                ReisId = reisId
            };
            var reisEnKlant = new ReisKlantEnNieuweReisForm()
            {
                Reis = reis,
                Klant = klant,
                NieuweReisForm = nieuweReisForm
            };


            return View(reisEnKlant);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult KlarBoeking(ReisKlantEnNieuweReisForm reisKlantEnNieuweReisForm)
        {
            if (this.ModelState.IsValid)
            {

                var reis = _context.Reizen.Find(reisKlantEnNieuweReisForm.NieuweReisForm.ReisId);
                reis.AantalVolwassenen += (int)reisKlantEnNieuweReisForm.NieuweReisForm.AantalVolwassenen;
                reis.AantalKinderen = (int)reisKlantEnNieuweReisForm.NieuweReisForm.AantalKinderen;
                _reisRepository.UpdateReis(reis);
                var klant = _context.Klanten.Find(reisKlantEnNieuweReisForm.NieuweReisForm.KlantId);
                var boeking = new Boeking
                {
                    Reis = reis,
                    Klant = klant,
                    AantalVolwassenen = reisKlantEnNieuweReisForm.NieuweReisForm.AantalVolwassenen,
                    AantalKinderen = reisKlantEnNieuweReisForm.NieuweReisForm.AantalKinderen,
                    AnnulatieVerzekering = reisKlantEnNieuweReisForm.NieuweReisForm.AnnulatieVerzekering,
                    GeboektOp = DateTime.Now
                };
                _boekingsRepository.AddBoeking(boeking);

                return RedirectToAction(nameof(BoekingBewestigen), new { boekingId = boeking.Id });
            }

            reisKlantEnNieuweReisForm.Klant = _context.Klanten
                .Where(klant => klant.Id == reisKlantEnNieuweReisForm.NieuweReisForm.KlantId)
                .Include(klant => klant.Woonplaats).FirstOrDefault();
            reisKlantEnNieuweReisForm.Reis = _context.Reizen
                .Where(reis => reis.Id == reisKlantEnNieuweReisForm.NieuweReisForm.ReisId)
                .Include(reis => reis.BestemmingscodeNavigation).FirstOrDefault();

            return View(nameof(Boeking), reisKlantEnNieuweReisForm);

        }
        [HttpGet]

        public IActionResult BoekingBewestigen(int boekingId)
        {
            var boeking = new Boeking { Id = boekingId };

            return View(boeking);
        }

    }
} 