namespace Shop_Mobi.Databases
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_xulydon
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id_tk { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id_don { get; set; }

        public bool tinhtrang { get; set; }

        public virtual tbl_dondathang tbl_dondathang { get; set; }

        public virtual tbl_taikhoan tbl_taikhoan { get; set; }
    }
}
