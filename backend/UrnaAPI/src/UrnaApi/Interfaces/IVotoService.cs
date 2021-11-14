using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Models;

namespace UrnaApi.Interfaces
{
    public interface IVotoService
    {
        Task Criar(Voto voto);
    }
}
