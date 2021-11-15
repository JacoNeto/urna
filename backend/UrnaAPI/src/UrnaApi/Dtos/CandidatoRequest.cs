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
        public int Numero { get; set; }
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public string Partido { get; set; }
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        [Range(0, 1, ErrorMessage = "valor inválido")]
        public int Cargo { get; set; }
        public string Imagem { get; set; }
    }

}
