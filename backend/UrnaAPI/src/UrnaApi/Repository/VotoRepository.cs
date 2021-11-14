﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Interfaces;
using UrnaApi.Models;

namespace UrnaApi.Repository
{
    public class VotoRepository : Repository<Voto>, IVotoRepository
    {
        public VotoRepository(PsqlContext context) : base(context) {}

        public async Task<Voto> BuscarPorNumero(string titulo, int cargo)
        {
            return await Dbset.FirstOrDefaultAsync(c => c.TItuloEleitor == titulo && c.Candidato.Cargo == cargo);
        }
    }
}
