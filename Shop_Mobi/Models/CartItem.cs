using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Shop_Mobi.Models
{
    public class CartItem
    {
        public Databases.tbl_sanpham sanpham { get; set; }
        public int soluong { get; set; }
        public int thanhtien
        {
            get
            {
                return soluong * (int)sanpham.gia;
            }
        }
    }
}