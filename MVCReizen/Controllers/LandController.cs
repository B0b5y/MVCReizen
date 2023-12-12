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
            var landen = landService.GetAllLandenByWerelddeel(id);
            var werelddeelNaam = werelddeelService.GetWereldeelNaamById(id);
            ViewBag.WerelddeelNaam = werelddeelNaam;
            return View(landen);
        }
    }
}
