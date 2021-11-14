using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UrnaApi.Dtos
{
    public class VotoRequest
    {
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        [RegularExpression("[0-9]{12}", ErrorMessage = "O campo deve possuir 12 digitos numéricos")]
        public String TItuloEleitor { get; set; }
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        [Range(10, 99999, ErrorMessage = "Número informado é inválido")]
        public int Numero { get; set; }

    }
}
