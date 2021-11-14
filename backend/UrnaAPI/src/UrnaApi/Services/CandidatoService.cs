using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Dtos;
using UrnaApi.Interfaces;
using UrnaApi.Models;

namespace UrnaApi.Services
{
    public class CandidatoService : BaseService, ICandidatoService
    {
        private readonly ICandidatoRepository _candidatoRepository;

        public CandidatoService(INotificador notificador, ICandidatoRepository candidatoRepository) : base(notificador)
        {
            _candidatoRepository = candidatoRepository;
        }

        public async Task Adicionar(Candidato candidato)
        {
            var candidatoExist = await _candidatoRepository.BuscarPorNumero(candidato.Numero);

            if(!(candidatoExist is null))
            {
                Notificar("Já existe um cadidato cadastrado com o número informado.");
            }

            if (candidato.Cargo == 0)
            {
                if(candidato.Numero < 10000 || candidato.Numero > 99999) Notificar("Vereador possui um número com 5 digitos.");
                if (!isValid()) return;
                await _candidatoRepository.Adicionar(candidato);
                return;
            }

            if (candidato.Numero < 10 || candidato.Numero > 99) Notificar("Prefeito possui número com 2 digitos");
            if (!isValid()) return;
            await _candidatoRepository.Adicionar(candidato);
            return;
        }

        public async Task<IEnumerable<Candidato>> Listar(int cargo)
        {
            return await _candidatoRepository.Listar(cargo);
        }

        public async Task<Candidato> BuscarPorNumero(int numero)
        {
            return await _candidatoRepository.BuscarPorNumero(numero);
        }

        public async Task Remover(Guid id)
        {
           await _candidatoRepository.Remover(id);
        }
    }
}
