using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;
using MVCReizen.ModelView;
using MVCReizen.Services;

namespace MVCReizen.Controllers
{
    public class BoekingController : Controller
    {
        private readonly ReisService reisService;
        private readonly KlantService klantService;
        private readonly BoekingService boekingService;
        public BoekingController(
            ReisService reisService,
            KlantService klantService,
            BoekingService boekingService)      
        {
            this.reisService = reisService;
            this.klantService = klantService;
            this.boekingService = boekingService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Boeking(int reisId, int klantId)
        {
            var reis = reisService.GetReisMetBestemmingenByReisId(reisId);
            var klant = klantService.GetKlantByIdMetWoonplaats(klantId);
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
        public IActionResult BoekingKlaar(ReisKlantEnNieuweReisForm reisKlantEnNieuweReisForm)
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
                return RedirectToAction(nameof(BoekingBevestigen), new { boekingId = boeking.Id });
            }
            reisKlantEnNieuweReisForm.Klant = klantService.GetKlantByIdMetWoonplaats(reisKlantEnNieuweReisForm.Klant.Id);

            reisKlantEnNieuweReisForm.Reis = reisService.GetReisMetBestemmingenByReisId(reisKlantEnNieuweReisForm.Klant.Id);
            return View(nameof(Boeking), reisKlantEnNieuweReisForm);
        }
        [HttpGet]
        public IActionResult BoekingBevestigen(int boekingId)
        {
            var boeking = new Boeking { Id = boekingId };
            return View(boeking);
        }
    }
}
