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
            var gekozenReis = reisService.GetReisMetBestemmingenByReisId(id);
            return View(gekozenReis);
        }
        [HttpGet]
        public IActionResult Zoek(string klantZoeken, int reisId)
        {
            var reis = reisService.GetReisMetBestemmingenByReisId(reisId);
            var klanten = klantService.GetKlantenByWoonplaatsEnFamilienaam(klantZoeken);
            var reisEnKlanten = new ReisEnKlanten() { Reis = reis, Klanten = klanten };
            return View(reisEnKlanten);
        }
    }
}
