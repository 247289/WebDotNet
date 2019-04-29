using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Shop_Mobi.Models
{
    public class Tbl_danhmuc
    {
        public int id { get; set; }

        [StringLength(10)]
        public string ten { get; set; }

    }
}