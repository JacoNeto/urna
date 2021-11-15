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
            if(voto.Candidato is null)
            {
                Notificar("Candidato com número informado não existe.");
                return;
            }

            var votos = await _votoRepository.BuscarPorTitulo(voto.TItuloEleitor, voto.Candidato.Cargo);

            if(voto.Candidato.Cargo == 1 && votos.Any())
            {
                Notificar("Você já votou para presidente");
            }

            if(voto.Candidato.Cargo == 0 && votos.Count() == 2)
            {
                Notificar("Você já votou em 2 senadores");
            }

            if(voto.Candidato.Cargo == 0 && votos.Where(v => v.Candidato.Numero == voto.Candidato.Numero).Any())
            {
                Notificar("Você já votou nesse senador");
            }

            if (!isValid())
            {
                return;
            }

            await _votoRepository.Adicionar(voto);
        }

    }
}
