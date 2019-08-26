using Shop_Mobi.Databases;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Shop_Mobi.Areas.Admin.Models
{
    public class Sanpham
    {
        private ShopMobiContextDb db = new ShopMobiContextDb();
        //lấy sản phẩm theo danh mục
        public List<Shop_Mobi.Databases.tbl_sanpham> LaySanPham_DM(int id_dm)
        {
            var list_dt = db.Database.SqlQuery<Shop_Mobi.Databases.tbl_sanpham>("exec LaySanPham_DM @id_dm", new SqlParameter("id_dm", id_dm)).ToList();
            return list_dt;
        }
        //lấy sản phẩm theo id
        public tbl_sanpham Find(int? id)
        {
            //var _sp = db.Database.SqlQuery<Tbl_sanpham>("select * from tbl_sanpham").Where(x => x.id == id);// trả về 1 IEnumerable
            var _sp = db.Database.SqlQuery<tbl_sanpham>("exec [LaySanPham_Id] @id", new SqlParameter("id", id)).FirstOrDefault();
            return _sp;
        }
    }
}