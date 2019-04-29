using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shop_Mobi.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            Shop_Mobi.Databases.tbl_taikhoan acc = null;
            if (Session["UsersAdmin"] != null)
            {
                acc = (Shop_Mobi.Databases.tbl_taikhoan)Session["UsersAdmin"];
                ViewBag.Account = acc;
                return View();
            }
            else if (Session["UsersEmployee"] != null)
            {
                acc = (Shop_Mobi.Databases.tbl_taikhoan)Session["UsersEmployee"];
                ViewBag.Account = acc;
                return View();
            }
            return Redirect("~/Admin/Account/Login");
        }
    }
}