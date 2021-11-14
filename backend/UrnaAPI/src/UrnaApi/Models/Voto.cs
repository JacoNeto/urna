using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UrnaApi.Models
{
    public class Voto : Entity
    {
        public string TItuloEleitor { get; private set; }
        public DateTime Created_at { get; private set; }

        // mapping
        public Candidato Candidato { get; set; }

        public Voto()
        {
            Created_at = DateTime.Now;
        }

    }
}
