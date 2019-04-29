using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using Shop_Mobi.Databases;

namespace Shop_Mobi.Models
{
    public class Tbl_sanpham
    {

        private ShopMobiContextDb db = new ShopMobiContextDb();

        public int id { get; set; }

        public string tendm { get; set; }

        [StringLength(150)]
        public string ten { get; set; }

        public decimal? gia { get; set; }

        public int? soluong { get; set; }

        [StringLength(10)]
        public string trongluong { get; set; }

        [StringLength(10)]
        public string ROM { get; set; }

        [StringLength(10)]
        public string RAM { get; set; }

        [StringLength(50)]
        public string thenho { get; set; }

        [StringLength(10)]
        public string camera_sau { get; set; }

        [StringLength(10)]
        public string camera_truoc { get; set; }

        public int? pin { get; set; }

        [StringLength(50)]
        public string baohanh { get; set; }

        public int? bluetooth { get; set; }

        public string tennsx { get; set; }

        [StringLength(50)]
        public string CPU { get; set; }

        [StringLength(50)]
        public string manhinh { get; set; }

        //tìm sản phẩm theo id
        //public tbl_sanpham Find(int id)
        //{
        //    var _sp = db.tbl_sanpham.SingleOrDefault(x => x.id == id);
        //    return _sp;
        //}

        public tbl_sanpham Find(int id)
        {
            //var _sp = db.Database.SqlQuery<Tbl_sanpham>("select * from tbl_sanpham").Where(x => x.id == id);// trả về 1 IEnumerable
            var _sp = db.Database.SqlQuery<tbl_sanpham>("exec [LaySanPham_Id] @id", new SqlParameter("id", id)).FirstOrDefault();
            return _sp;
        }

        //lấy ra toàn bộ sản phẩm được phép bán trong cơ sở dữ liệu
        public List<Tbl_sanpham> getList()
        {
            using (var item = new ShopMobiContextDb())
            {
                return item.Database.SqlQuery<Tbl_sanpham>("Exec LaySanPham").ToList();
            }
        }


        //lấy ra ảnh của sản phẩm theo id
        public List<string> getImg(int id_sp)
        {
            using (var item = new ShopMobiContextDb())
            {
                var listImg = db.Database.SqlQuery<string>("exec LayAnh @id_sp", new SqlParameter("id_sp", id_sp)).ToList();
                return listImg;
            }
        }

        public List<tbl_sanpham> TimKiemSanPham(string key)
        {
            return db.Database.SqlQuery<tbl_sanpham>("exec TimKiemSanPham @name", new SqlParameter("name", key)).ToList();
        }

    }
}