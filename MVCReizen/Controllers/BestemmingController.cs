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

            var bestemmingen = bestemmingService.GetAllBestemmingen().Where(bestemming => bestemming.Landid == id)
                                                    .OrderBy(bestemmingen => bestemmingen.Plaats).ToList();
            var landNaam = landService.GetAllLanden().Where(land => land.Id == id).Select(land => land.Naam).FirstOrDefault();
            ViewBag.LandNaam = landNaam;
            return View(bestemmingen);
        }
    }
}
