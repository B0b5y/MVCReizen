using Microsoft.AspNetCore.Mvc;
using MVCReizen.Services;

namespace MVCReizen.Controllers
{
    public class ReisController : Controller
    {
        private readonly ReisService reisService;
        private readonly BestemmingService bestemmingService;
        public IActionResult Index()
        {
            return View();
        }
        public ReisController(
           ReisService reisService, BestemmingService bestemmingService)
        {
            this.reisService = reisService;
            this.bestemmingService = bestemmingService;
        }
        public IActionResult ToonReizen(string id)
        {
            var reizen = reisService.GetAllReizenMetZelfdeBestemmingscode(id);
            var bestemming = bestemmingService.GetBestemmingByCode(id);
            ViewBag.BestemmingsNaam = bestemming.Plaats;
            return View(reizen);
        }
    }
}
