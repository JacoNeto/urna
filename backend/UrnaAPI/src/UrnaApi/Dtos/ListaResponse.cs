using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UrnaApi.Dtos
{
    public class ListaResponse
    {
        public ListaResponse(string nome, int numero, string partido, int cargo, int votos, string imagem)
        {
            Nome = nome;
            Numero = numero;
            Partido = partido;
            Cargo = cargo;
            Votos = votos;
            Imagem = imagem;
        }

        public string Nome { get; private set; }
        public int Numero { get; private set; }
        public string Partido { get; private set; }
        public int Cargo { get; private set; }
        public int Votos { get; private set; }
        public string Imagem { get; private set; }
    }
}
