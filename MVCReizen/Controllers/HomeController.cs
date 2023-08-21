﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;
using MVCReizen.ModelView;
using MVCReizen.Repositories;
using System.Diagnostics;
using System.Numerics;

namespace MVCReizen.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ReizenContext _context;
        private readonly IReisRepository _reisRepository;

        private readonly IBoekingsRepository _boekingsRepository;

        public HomeController(ILogger<HomeController> logger, ReizenContext context, IReisRepository reisRepository, IBoekingsRepository boekingsRepository)
        {
            _logger = logger;
            _context = context;
            _reisRepository = reisRepository;
            _boekingsRepository = boekingsRepository;
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
        public IActionResult ToonLanden(int id)
        {
            var landen = _context.Landen.Where(land => land.Werelddeelid == id).OrderBy(land => land.Naam).ToList();
            var werelddeelNaam = _context.Werelddelen.Where(werelddeel => werelddeel.Id == id)
                                                 .Select(werelddeel => werelddeel.Naam).FirstOrDefault();
            ViewBag.WerelddeelNaam = werelddeelNaam;
            return View(landen);
        }
        public IActionResult ToonBestemmingen(int id)
        {
            var bestemmingen = _context.Bestemmingen.Where(bestemming => bestemming.Landid == id)
                                                    .OrderBy(bestemmingen => bestemmingen.Plaats).ToList();
            var landNaam = _context.Landen.Where(land => land.Id == id).Select(land => land.Naam).FirstOrDefault();
            ViewBag.LandNaam = landNaam;
            return View(bestemmingen);
        }
        public IActionResult ToonReizen(string id)
        {
            var reizen = _context.Reizen.Where(reis => reis.Bestemmingscode == id)
                                                 .OrderBy(reizen => reizen.Vertrek).ToList();
            var bestemming = _context.Bestemmingen.Find(id);
            ViewBag.BestemmingsNaam = bestemming.Plaats;
            return View(reizen);
        }
        public IActionResult ZoekKlant(int id)
        {
            var gekozenReis = _context.Reizen.Where(reis => reis.Id == id)
                .Include(reis => reis.BestemmingscodeNavigation)
                .FirstOrDefault();

            return View(gekozenReis);
        }
        [HttpGet]
        public IActionResult Zoek(string klantZoeken, int reisId)
        {
            var reis = _context.Reizen.Where(reis => reis.Id == reisId).Include(reis=>reis.BestemmingscodeNavigation).FirstOrDefault();
            var klanten = _context.Klanten.Where(klant => klant.Familienaam.Contains(klantZoeken))
                    .Include(klant => klant.Woonplaats).OrderBy(klant=>klant.Familienaam).ToList();
            var reisEnKlanten = new ReisEnKlanten() { Reis = reis, Klanten = klanten };            
            return View(reisEnKlanten);
        }
        [HttpGet]
        public IActionResult Boeking(int reisId, int klantId, int volwassen, int kinderen, bool verzekering)
        {
            var reis = _context.Reizen.Where(reis => reis.Id == reisId).Include(reis => reis.BestemmingscodeNavigation).FirstOrDefault();
            var klant = _context.Klanten.Where(klant => klant.Id == klantId).Include(klant => klant.Woonplaats).FirstOrDefault();
            var nieuweReisForm = new NieuweReisForm() { 
                AantalVolwassenen = volwassen, 
                AantalKinderen = kinderen, 
                AnnulatieVerzekering = verzekering,
                KlantId = klantId,
                ReisId = reisId
            };
            var reisEnKlant = new ReisKlantEnNieuweReisForm() { 
                Reis = reis, 
                Klant = klant, 
                NieuweReisForm = nieuweReisForm  };
            

            return View(reisEnKlant);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult KlarBoeking(ReisKlantEnNieuweReisForm reisKlantEnNieuweReisForm)
        {
            if (this.ModelState.IsValid)
            {
                
                var reis = _context.Reizen.Find(reisKlantEnNieuweReisForm.Reis.Id);
                var hudigeVolwassen = _context.Reizen.Where(reis => reis.Id == reisKlantEnNieuweReisForm.Reis.Id).Select(reis => reis.AantalVolwassenen).FirstOrDefault();
                var hudigeKinderen = _context.Reizen.Where(reis => reis.Id == reisKlantEnNieuweReisForm.Reis.Id).Select(reis => reis.AantalKinderen).FirstOrDefault();


                var somVolvassenen = reisKlantEnNieuweReisForm.NieuweReisForm.AantalVolwassenen + hudigeVolwassen;
                var somKinderen = reisKlantEnNieuweReisForm.NieuweReisForm.AantalKinderen + hudigeKinderen;
                reis.AantalVolwassenen = (int)somVolvassenen;
                reis.AantalKinderen = (int)somKinderen;
                _reisRepository.UpdateReis(reis);
                var klant = _context.Klanten.Find(reisKlantEnNieuweReisForm.Klant.Id);
                var boeking = new Boeking
                {
                    Reis = reis,
                    Klant = klant,
                    AantalVolwassenen = reisKlantEnNieuweReisForm.NieuweReisForm.AantalVolwassenen,
                    AantalKinderen = reisKlantEnNieuweReisForm.NieuweReisForm.AantalKinderen,
                    AnnulatieVerzekering = reisKlantEnNieuweReisForm.NieuweReisForm.AnnulatieVerzekering,
                    GeboektOp = DateTime.Now
                };
                _boekingsRepository.AddBoeking(boeking);
                
                return RedirectToAction(nameof(BoekingBewestigen), new { boekingId = boeking.Id });
            }

            return View(nameof(Boeking), reisKlantEnNieuweReisForm);
           
        }
        [HttpGet]
        
        public IActionResult BoekingBewestigen(int boekingId)
        {
            var boeking = new Boeking { Id = boekingId };
            
            return View(boeking);
        }

    }
} 