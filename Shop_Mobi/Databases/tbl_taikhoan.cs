namespace Shop_Mobi.Databases
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_taikhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_taikhoan()
        {
            tbl_dondathang = new HashSet<tbl_dondathang>();
            tbl_news = new HashSet<tbl_news>();
            tbl_xulydon = new HashSet<tbl_xulydon>();
        }

        public int id { get; set; }

        public int? id_quyen { get; set; }

        [StringLength(50)]
        public string tentaikhoan { get; set; }

        [StringLength(30)]
        public string matkhau { get; set; }

        public int? id_thontincanhan { get; set; }

        public bool? trangthai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_dondathang> tbl_dondathang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_news> tbl_news { get; set; }

        public virtual tbl_quyen tbl_quyen { get; set; }

        public virtual tbl_thongtincanhan tbl_thongtincanhan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_xulydon> tbl_xulydon { get; set; }
    }
}
