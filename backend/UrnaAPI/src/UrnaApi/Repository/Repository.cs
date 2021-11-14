using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Interfaces;
using UrnaApi.Models;

namespace UrnaApi.Repository
{
    public class Repository<T> : IRepository<T> where T : Entity
    {

        protected readonly PsqlContext _context;
        protected readonly DbSet<T> Dbset;

        public Repository(PsqlContext context)
        {
            _context = context;
            Dbset = _context.Set<T>();
        }

        public async Task Adicionar(T entity)
        {
            Dbset.Add(entity);
            await _context.SaveChangesAsync();
        }

        public async Task<T> Atualizar(T entity)
        {
            Dbset.Update(entity);
            await _context.SaveChangesAsync();
            return entity;
        }

        public virtual async Task<IEnumerable<T>> Listar()
        {
            return await Dbset.AsNoTracking().ToListAsync();
        }

        public async Task<T> ObterPorId(Guid id)
        {
            return await Dbset.AsNoTracking().FirstOrDefaultAsync(entity => entity.Id == id);
        }

        public async Task Remover(Guid id)
        {
            T entity = await Dbset.AsNoTracking().FirstOrDefaultAsync(entity => entity.Id == id);
            Dbset.Remove(entity);
            await _context.SaveChangesAsync();
        }

        public void Dispose()
        {
            _context?.Dispose();
        }
    }
}
