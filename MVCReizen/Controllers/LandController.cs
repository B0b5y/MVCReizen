using Microsoft.AspNetCore.Mvc;
using MVCReizen.Services;

namespace MVCReizen.Controllers
{
    public class LandController : Controller
    {
        private readonly LandService landService;
        private readonly WerelddeelService werelddeelService;
        public LandController( WerelddeelService werelddeelService,
           LandService landService)
        {
            this.werelddeelService = werelddeelService;
            this.landService = landService;
        }
        public IActionResult ToonLanden(int id)
        {
            var landen = landService.GetAllLanden().Where(land => land.Werelddeelid == id).OrderBy(land => land.Naam).ToList();
            var werelddeelNaam = werelddeelService.GetAllWerelddelen().Where(werelddeel => werelddeel.Id == id)
                                                 .Select(werelddeel => werelddeel.Naam).FirstOrDefault();
            ViewBag.WerelddeelNaam = werelddeelNaam;
            return View(landen);
        }
    }
}
