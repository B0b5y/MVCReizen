using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;
using MVCReizen.ModelView;
using MVCReizen.Services;
using System.Diagnostics;


namespace MVCReizen.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly BoekingService boekingService;
        private readonly ReisService reisService;
        private readonly WerelddeelService werelddeelService;
        private readonly KlantService klantService;
        private readonly BestemmingService bestemmingService;
        private readonly LandService landService;
        public HomeController(ILogger<HomeController> logger,
            ReisService reisService, BoekingService boekingService, WerelddeelService werelddeelService,
            KlantService klantService,  BestemmingService bestemmingService, LandService landService)
        {
            _logger = logger;      
            this.boekingService = boekingService;
            this.reisService = reisService;
            this.werelddeelService = werelddeelService;
            this.bestemmingService = bestemmingService;
            this.klantService = klantService;
            this.landService = landService;
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
        [HttpGet]
        public IActionResult Boeking(int reisId, int klantId)
        {
            var reis = reisService.GetAllReizenMetBetemmingen().Where(reis => reis.Id == reisId)
                .FirstOrDefault();
            var klant = klantService.GetAllKlanten().Where(klant => klant.Id == klantId).Include(klant => klant.Woonplaats).FirstOrDefault();
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
                var reis = reisService.GetReisById(reisKlantEnNieuweReisForm.NieuweReisForm.ReisId);
                reis.AantalVolwassenen += (int)reisKlantEnNieuweReisForm.NieuweReisForm.AantalVolwassenen;
                reis.AantalKinderen = (int)reisKlantEnNieuweReisForm.NieuweReisForm.AantalKinderen;
                reisService.UpdateReis(reis);
                var klant = klantService.GetKlantById(reisKlantEnNieuweReisForm.NieuweReisForm.KlantId);
                var boeking = new Boeking
                {
                    Reis = reis,
                    Klant = klant,
                    AantalVolwassenen = reisKlantEnNieuweReisForm.NieuweReisForm.AantalVolwassenen,
                    AantalKinderen = reisKlantEnNieuweReisForm.NieuweReisForm.AantalKinderen,
                    AnnulatieVerzekering = reisKlantEnNieuweReisForm.NieuweReisForm.AnnulatieVerzekering,
                    GeboektOp = DateTime.Now
                };
                boekingService.AddBoeking(boeking);
                return RedirectToAction(nameof(BoekingBewestigen), new { boekingId = boeking.Id });
            }
            reisKlantEnNieuweReisForm.Klant = klantService.GetAllKlanten()
                .Where(klant => klant.Id == reisKlantEnNieuweReisForm.NieuweReisForm.KlantId)
                .Include(klant => klant.Woonplaats).FirstOrDefault();
            reisKlantEnNieuweReisForm.Reis = reisService.GetAllReizenMetBetemmingen()
                .Where(reis => reis.Id == reisKlantEnNieuweReisForm.NieuweReisForm.ReisId)
                .FirstOrDefault();
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