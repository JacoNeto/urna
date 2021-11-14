using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UrnaApi.Dtos
{
    public class CandidatoRequest
    {
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public string Nome { get; set; }
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        [Range(10, 99999, ErrorMessage = "O valor deve ser entre 10 e 99999")]
        public int Numero { get; set; }
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public string Partido { get; set; }
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        [Range(0, 1, ErrorMessage = "Informe 0 para vereador e 1 para prefeito")]
        public int Cargo { get; set; }
    }

}
