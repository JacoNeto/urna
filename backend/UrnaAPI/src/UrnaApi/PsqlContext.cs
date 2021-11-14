using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using UrnaApi.Models;

namespace UrnaApi
{
    public class PsqlContext : DbContext
    {
        public PsqlContext(DbContextOptions opt) : base(opt) { }

        public DbSet<Candidato> Candidatos { get; set; }
        public DbSet<Voto> Votos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(PsqlContext).Assembly);
        }
    }
}
