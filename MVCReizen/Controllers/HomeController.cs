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
        public HomeController(ILogger<HomeController> logger, WerelddeelService werelddeelService)
        {
            _logger = logger;      
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
       
    }
} 