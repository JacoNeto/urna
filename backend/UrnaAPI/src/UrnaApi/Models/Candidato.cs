using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UrnaApi.Models
{
    public class Candidato : Entity
    {
        public string Nome { get; private set; }
        public int Numero { get; private set; }
        public string Partido { get; private set; }
        public int Cargo { get; private set; }

        // mapping
        public IEnumerable<Voto> Votos { get; private set; }
    }
}
