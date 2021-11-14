using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Dtos;
using UrnaApi.Models;

namespace UrnaApi.Interfaces
{
    public interface ICandidatoService
    {
        Task Adicionar(Candidato candidato);
        Task<IEnumerable<Candidato>> Listar(int cargo);
        Task<Candidato> BuscarPorNumero(int numero);
        Task Remover(Guid id);
        
    }
}
