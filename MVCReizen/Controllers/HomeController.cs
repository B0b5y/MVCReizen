﻿using Microsoft.AspNetCore.Mvc;
using MVCReizen.Models;
using System.Diagnostics;

namespace MVCReizen.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ReizenContext _context;

        public HomeController(ILogger<HomeController> logger, ReizenContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            var werelddelen = _context.Werelddelen.OrderBy(werelddeel => werelddeel.Naam).ToList();
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
        public IActionResult ToonLanden()
        {
            var landen = _context.Landen.OrderBy(landen => landen.Naam).ToList();
            return View(landen);
        }
        public IActionResult ToonBestemmingen()
        {
            var bestemmingen = _context.Bestemmingen.OrderBy(bestemmingen => bestemmingen.Plaats).ToList();
            return View(bestemmingen);
        }
        
    }
}