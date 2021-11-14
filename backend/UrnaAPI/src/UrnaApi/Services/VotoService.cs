using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Interfaces;
using UrnaApi.Models;

namespace UrnaApi.Services
{
    public class VotoService : BaseService, IVotoService
    {
        private readonly IVotoRepository _votoRepository;
        private readonly ICandidatoRepository _candidatoRepository;
        public VotoService(INotificador notificador, IVotoRepository votoRepository, ICandidatoRepository candidatoRepository) : base(notificador)
        {
            _votoRepository = votoRepository;
            _candidatoRepository = candidatoRepository;
        }

        public async Task Criar(Voto voto)
        { 
            var votoExist = await _votoRepository.BuscarPorNumero(voto.TItuloEleitor, voto.Candidato.Cargo);
            
            if(!(votoExist is null))
            {
                Notificar("Eleitor já votou em um caditado para este cargo");
            }

            if(!isValid())
            {
                return;
            }

            await _votoRepository.Adicionar(voto);
        }

    }
}
