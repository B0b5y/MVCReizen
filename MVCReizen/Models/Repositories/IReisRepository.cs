using System;
using System.Collections.Generic;
using MVCReizen.Models;

namespace MVCReizen.Models.Repositories
{
    public interface IReisRepository
    {
        Reis GetReisById(int id);
        IEnumerable<Reis> GetAllReizen();
        void AddReis(Reis reis);
        void UpdateReis(Reis reis);
        void DeleteReis(int id);
    }
}