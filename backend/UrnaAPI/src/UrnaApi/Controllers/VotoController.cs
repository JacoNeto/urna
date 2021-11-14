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
    public class VotoController : BaseController
    {
        private readonly IVotoService _votoService;
        private readonly ICandidatoService _CandidatoService;
        private readonly IMapper _mapper;
        public VotoController(INotificador notificador, IVotoService votoService, ICandidatoService candidatoService, IMapper mapper) : base(notificador)
        {
            _votoService = votoService;
            _CandidatoService = candidatoService;
            _mapper = mapper;
        }

        [HttpPost]
        public async Task<IActionResult> Criar(VotoRequest votoRequest)
        {
            if (!ModelState.IsValid) CustomResponse(Ok());
            var candidato = await _CandidatoService.BuscarPorNumero(votoRequest.Numero);

            var voto = _mapper.Map<Voto>(votoRequest);
            voto.Candidato = candidato;
                
            await _votoService.Criar(voto);
            return CustomResponse(StatusCode(201));
        }
    }
}
