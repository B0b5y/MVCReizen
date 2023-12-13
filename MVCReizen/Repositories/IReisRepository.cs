using System;
using System.Collections.Generic;
using MVCReizen.Models;

namespace MVCReizen.Repositories
{
    public interface IReisRepository
    {
        Reis GetReisById(int id);
        IEnumerable<Reis> GetAllReizen();   
        void UpdateReis(Reis reis);
        IEnumerable<Reis> GetAllReizenMetBestemmingen();
        Reis? GetReisMetBestemmingenByReisId(int reisId);
    }
}