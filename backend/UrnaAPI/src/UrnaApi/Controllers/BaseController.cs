using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Interfaces;
using UrnaApi.Notifications;

namespace UrnaApi.Controllers
{
    [ApiController]
    public class BaseController : ControllerBase
    {
        private readonly INotificador _notificador;

        public BaseController(INotificador notificador)
        {
            _notificador = notificador;
        }

        protected bool OperacaoValida()
        {
            return !_notificador.TemNotificacao();
        }

        protected ActionResult CustomResponse(ActionResult action)
        {
            if (OperacaoValida())
            {
                return action;
            }

            return BadRequest(new { erros = _notificador.ObterNotificacoes().Select(n => n.Mensagem) });
        }

        protected ActionResult CustomResponse(ModelStateDictionary modelState, ActionResult sucessAction)
        {
            if (!ModelState.IsValid) NotificarErroModelInvalida(modelState);
            return CustomResponse(sucessAction);
        }

        protected void NotificarErroModelInvalida(ModelStateDictionary modelState)
        {
            var erros = modelState.Values.SelectMany(e => e.Errors);
            foreach (var erro in erros)
            {
                var errorMsg = erro.Exception == null ? erro.ErrorMessage : erro.Exception.Message;
                NotificarErro(errorMsg);
            }
        }

        protected void NotificarErro(string messagem)
        {
            _notificador.Handle(new Notificacao(messagem));
        }
    }
}
