using Microsoft.AspNetCore.Mvc;

namespace MVCReizen.Controllers
{
    public class ReisController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
