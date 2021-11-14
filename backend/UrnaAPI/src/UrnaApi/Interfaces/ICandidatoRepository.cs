using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Models;

namespace UrnaApi.Interfaces
{
    public interface ICandidatoRepository : IRepository<Candidato>
    {
        Task<Candidato> BuscarPorNumero(int numero);
        Task<IEnumerable<Candidato>> Listar(int cargo = 1);
    }
}
