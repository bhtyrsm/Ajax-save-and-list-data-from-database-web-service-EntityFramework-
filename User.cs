
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace jqueryDatatable
{
    public class User
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        [Required]
        [StringLength(20)]
        public string UserName { get; set; }
       

        [Required]
        [StringLength(20)]
        public string UserLastName { get; set; }
   


        [Required]
        [StringLength(20)]
        public string UserAge { get; set; }
  


        [Required]
        [StringLength(20)]
        public string UserPhoneNum { get; set; }
        

    }
}