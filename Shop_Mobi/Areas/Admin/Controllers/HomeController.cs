using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shop_Mobi.Databases;
namespace Shop_Mobi.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        ShopMobiContextDb db = new ShopMobiContextDb();
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Sanpham()
        {
            var list_sp = db.tbl_sanpham.ToList();
            return View(list_sp);
        }

        public ActionResult Chitietdonhang()
        {
            var list_chitietdonhang = db.tbl_chitietdonhang.ToList();
            return View(list_chitietdonhang);
        }

        public ActionResult danhmuc()
        {
            var list_danhmuc = db.tbl_danhmuc.ToList();
            return View(list_danhmuc);
        }

        public ActionResult nhasanxuat()
        {
            var list_nhasanxuat = db.tbl_nhasanxuat.ToList();
            return View(list_nhasanxuat);
        }

        public ActionResult taikhoan()
        {
            var list_taikhoan = db.tbl_taikhoan.ToList();
            return View(list_taikhoan);
        }

        public ActionResult thongtincanhan()
        {
            var list_thongtincanhan = db.tbl_thongtincanhan.ToList();
            return View(list_thongtincanhan);
        }

        public ActionResult xulydon()
        {
            var list_xulydon = db.tbl_xulydon.ToList();
            return View(list_xulydon);
        }
    }
}