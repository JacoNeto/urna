using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UrnaApi.Interfaces;
using UrnaApi.Notifications;

namespace UrnaApi.Services
{
    public abstract class BaseService
    {
        private readonly INotificador _notificador;
        protected BaseService(INotificador notificador)
        {
            _notificador = notificador;
        }

        protected bool isValid()
        {
            return !_notificador.TemNotificacao();
        }

        protected void Notificar(string mensagem)
        {
            _notificador.Handle(new Notificacao(mensagem));
        }
    }
}
