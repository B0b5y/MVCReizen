using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MVCReizen.ModelView;
using MVCReizen.Services;

namespace MVCReizen.Controllers
{
    public class KlantController : Controller
    {
        private readonly KlantService klantService;
        private readonly ReisService reisService;
        private readonly ILogger<BestemmingController> _logger;
        public IActionResult Index()
        {
            return View();
        }
        public KlantController(
           ReisService reisService,
           KlantService klantService)
        {

            this.reisService = reisService;
            this.klantService = klantService;
        }
        public IActionResult ZoekKlant(int id)
        {
            var gekozenReis = reisService.GetAllReizenMetBetemmingen().Where(reis => reis.Id == id)

                .FirstOrDefault();

            return View(gekozenReis);
        }
        [HttpGet]
        public IActionResult Zoek(string klantZoeken, int reisId)
        {
            var reis = reisService.GetAllReizenMetBetemmingen().Where(reis => reis.Id == reisId)
                    .FirstOrDefault();
            var klanten = klantService.GetAllKlanten().Where(klant => klant.Familienaam.Contains(klantZoeken))
                    .Include(klant => klant.Woonplaats).OrderBy(klant => klant.Familienaam).ToList();
            var reisEnKlanten = new ReisEnKlanten() { Reis = reis, Klanten = klanten };
            return View(reisEnKlanten);
        }
    }
}
