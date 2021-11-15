using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Dtos;
using UrnaApi.Interfaces;
using UrnaApi.Models;

namespace UrnaApi.Controllers
{
    [Route("api/[controller]")]
    public class CadidatoController : BaseController
    {
        private readonly ICandidatoService _candidatoService;
        private readonly IMapper _mapper;
        public CadidatoController(INotificador notificador, ICandidatoService candidatoService, IMapper mapper) : base(notificador)
        {
            _candidatoService = candidatoService;
            _mapper = mapper;
        }

        [HttpPost]
        public async Task<IActionResult> Adicionar(CandidatoRequest candidatoDto)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState, Ok());
            var candidato = _mapper.Map<Candidato>(candidatoDto);
            await _candidatoService.Adicionar(candidato);

            return CustomResponse(StatusCode(201));
        }

        [HttpGet]
        public async  Task<IActionResult> Listar(int cargo)
        {
            var candidatos = await _candidatoService.Listar(cargo);

            var response = new List<ListaResponse>();

            foreach(var candidato in candidatos)
            {
                response.Add(new ListaResponse(candidato.Nome, candidato.Numero, candidato.Partido, candidato.Cargo, candidato.Votos.Count(), candidato.Imagem));
            }

            return CustomResponse(Ok(response.OrderByDescending(r => r.Votos)));
        }

        [HttpGet("/{numero:int}")]
        public async Task<IActionResult> Buscar(int numero)
        {
            var candidato = await _candidatoService.BuscarPorNumero(numero);

            if (candidato is null) return NotFound();
            return CustomResponse(Ok(candidato));
        }

        [HttpDelete("/{id:guid}")]
        public async Task<IActionResult> Remover(Guid id)
        {
            await _candidatoService.Remover(id);
            return CustomResponse(Ok());
        }
    }
}
