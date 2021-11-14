using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Models;

namespace UrnaApi.Interfaces
{
    public interface IRepository<T> : IDisposable where T : Entity
    {
        Task Adicionar(T entity);
        Task<T> ObterPorId(Guid id);
        Task<IEnumerable<T>> Listar();
        Task Remover(Guid id);
        Task<T> Atualizar(T entity);

    }
}
