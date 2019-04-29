using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;

namespace Shop_Mobi.Models
{
    public class Tbl_nhasanxuat
    {
        public int id { get; set; }

        [StringLength(50)]
        public string ten { get; set; }

        //lấy ra số lượng sản phẩm có trong cơ sở dữ liệu ứng với nhà sản xuất tương ứng
        public int soluong(int id_nsx)
        {
            using (var sl = new Shop_Mobi.Databases.ShopMobiContextDb())
            {
                //SqlParameter para = new SqlParameter("@id_nsx", id_nsx);
                var _sl = sl.Database.SqlQuery<int>("exec SoSp_Nsx @id_nsx ", new SqlParameter("id_nsx", id_nsx)).ToList().Count();
                return _sl;
            }
        }

        //lấy ra top sản phẩm theo nhà sản xuất
        public List<Tbl_sanpham> GetTop(int id_nsx, int soSP)
        {
            using (var item = new Shop_Mobi.Databases.ShopMobiContextDb())
            {
                List<SqlParameter> parameter = new List<SqlParameter>()
                {
                    new SqlParameter("id_nsx", id_nsx),
                    new SqlParameter("count", soSP)
                };
                var topsp = item.Database.SqlQuery<Tbl_sanpham>("exec [LaySanPham_Nsx] @id_nsx, @count", parameter.ToArray()).ToList();
                return topsp;
            }
        }

        //lấy ra tên nhà sản xuất
        public List<Tbl_nhasanxuat> getName()
        {
            using (var item = new Shop_Mobi.Databases.ShopMobiContextDb())
            {
                return item.Database.SqlQuery<Tbl_nhasanxuat>("select * from tbl_nhasanxuat").ToList();
            }
        }

        public Shop_Mobi.Databases.tbl_nhasanxuat getName(int? id_nsx)
        {
            using (var item = new Shop_Mobi.Databases.ShopMobiContextDb())
            {
                return item.tbl_nhasanxuat.Find(id_nsx);
            }
        }

    }
}