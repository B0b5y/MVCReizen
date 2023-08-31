using System;
using System.Collections.Generic;
using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface IBoekingsRepository
    {
        Boeking GetBoekingById(int id);
        IEnumerable<Boeking> GetAllBoekingen();
        void AddBoeking(Boeking reis);
        
    }
}