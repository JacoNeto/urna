using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Models;

namespace UrnaApi.Interfaces
{
    public interface IVotoRepository : IRepository<Voto>
    {
        Task<Voto> BuscarPorNumero(string titulo, int cargo);
        Task<IEnumerable<Voto>> BuscarPorTitulo(string titulo, int cargo);
    }
}
