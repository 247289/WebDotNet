using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Shop_Mobi.Areas.Admin.Models
{
    public class Person
    {
        public int id { get; set; }

        public int? id_q { get; set; }

        public int? id_ttcn { get; set; }

        [StringLength(50)]
        public string tentaikhoan { get; set; }

        [StringLength(50)]
        public string quyen { get; set; }

        [StringLength(100)]
        public string hoten { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ngaysinh { get; set; }

        public bool? gioitinh { get; set; }

        [StringLength(100)]
        public string diachi { get; set; }

        public decimal? sdt { get; set; }

        [StringLength(100)]
        public string email { get; set; }

        [StringLength(255)]
        public string anhdaidien { get; set; }

        public bool? trangthai { get; set; }

        public Person() { }

    }
}