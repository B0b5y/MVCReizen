using System;
using System.Collections.Generic;
using MVCReizen.Models;

namespace MVCReizen.Models.Repositories
{
    public interface IBoekingsRepository
    {
        Boeking GetBoekingById(int id);
        IEnumerable<Boeking> GetAllBoekingen();
        void AddBoeking(Boeking reis);
        void UpdateBoeking(Boeking reis);
        void DeleteBoeking(int id);
    }
}