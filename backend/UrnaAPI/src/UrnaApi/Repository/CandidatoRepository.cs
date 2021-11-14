using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Interfaces;
using UrnaApi.Models;

namespace UrnaApi.Repository
{
    public class CandidatoRepository : Repository<Candidato>, ICandidatoRepository
    {
        public CandidatoRepository(PsqlContext context) : base(context) {}

        public async Task<Candidato> BuscarPorNumero(int numero)
        {
            return await Dbset.FirstOrDefaultAsync(c => c.Numero == numero);
        }

        public async Task<IEnumerable<Candidato>> Listar(int cargo = 1) 
        {
            List<Candidato> candidatos = new List<Candidato>();
            candidatos = await Dbset.AsNoTracking().Where(c => c.Cargo == cargo).Include(c => c.Votos).ToListAsync();

            candidatos.OrderBy(c => c.Votos?.Count());
            return candidatos;
        }
    }
}
