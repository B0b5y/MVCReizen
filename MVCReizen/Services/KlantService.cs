﻿using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;
using MVCReizen.Repositories;
using System.Linq;

namespace MVCReizen.Services
{
    public class KlantService
    {
        private readonly IKlantRepository klantRepository;
        public KlantService(IKlantRepository klantRepository)
        {
            this.klantRepository = klantRepository;
        }

        public IQueryable<Klant> GetAllKlanten()
        {
            return klantRepository.GetAllKlanten();
        }

        public Klant? GetKlantById(int id)
        {
            return klantRepository.GetKlantById(id);
        }
        public ICollection<Klant> GetKlantenByWoonplaatsEnFamilienaam(string klantZoeken)
        {
            return klantRepository.GetKlantenByWoonplaatsEnFamilienaam(klantZoeken);
        }
    }
}
