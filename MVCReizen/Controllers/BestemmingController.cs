using Microsoft.AspNetCore.Mvc;
using MVCReizen.Services;

namespace MVCReizen.Controllers
{
    public class BestemmingController : Controller
    {
        private readonly BestemmingService bestemmingService;
        private readonly LandService landService;       
        public BestemmingController(
          BestemmingService bestemmingService, LandService landService)
        {
            this.bestemmingService = bestemmingService;
            this.landService = landService;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult ToonBestemmingen(int id)
        {
            var bestemmingen = bestemmingService.GetAllBesteminegenByLandId(id);
            var landNaam = landService.GetLandNameById(id);
                 ViewBag.LandNaam = landNaam;
            return View(bestemmingen);
        }
    }
}
