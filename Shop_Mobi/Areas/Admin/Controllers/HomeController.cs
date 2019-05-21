using Shop_Mobi.Databases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shop_Mobi.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        ShopMobiContextDb db = new ShopMobiContextDb();
        // GET: Admin/Home
        public ActionResult Index()
        {
            Shop_Mobi.Databases.tbl_taikhoan acc = null;
            if (Session["UsersAdmin"] != null)
            {
                acc = (Shop_Mobi.Databases.tbl_taikhoan)Session["UsersAdmin"];
                ViewBag.Account = acc;
                //
                Session["acc"] = acc;
                return View();
            }
            else if (Session["UsersEmployee"] != null)
            {
                acc = (Shop_Mobi.Databases.tbl_taikhoan)Session["UsersEmployee"];
                ViewBag.Account = acc;
                //
                Session["acc"] = acc;
                return View();
            }
            return Redirect("~/Admin/Account/Login");
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


    }
}