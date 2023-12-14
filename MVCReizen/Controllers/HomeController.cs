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
        private readonly WerelddeelService werelddeelService;    
        public HomeController(WerelddeelService werelddeelService)
        {           
            this.werelddeelService = werelddeelService;
        }
        public IActionResult Index()
        {
            var werelddelen = werelddeelService.GetAllWerelddelenOrderByNaam();
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