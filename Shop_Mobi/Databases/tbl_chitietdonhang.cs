namespace Shop_Mobi.Databases
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_chitietdonhang
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(12)]
        public string id_don { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id_sp { get; set; }

        public int? soluong { get; set; }

        public decimal? gia { get; set; }

        public virtual tbl_dondathang tbl_dondathang { get; set; }

        public virtual tbl_sanpham tbl_sanpham { get; set; }
    }
}
