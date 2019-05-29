using PagedList;
using Shop_Mobi.Areas.Admin.Models;
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
            //tbl_taikhoan tk = (tbl_taikhoan)Session["UsersAdmin"];
            //Shop_Mobi.Databases.tbl_taikhoan acc = null;
            if (Session["UsersAdmin"] != null)
            {
                //acc = (Shop_Mobi.Databases.tbl_taikhoan)Session["UsersAdmin"];
                //Session["acc"] = acc;
                return View();
            }
            else if (Session["UsersEmployee"] != null)
            {
                //acc = (Shop_Mobi.Databases.tbl_taikhoan)Session["UsersEmployee"];
                //Session["acc"] = acc;
                return View();
            }
            return Redirect("~/Admin/Account/Login");
        }

        public ActionResult Sanpham()
        {
            var list_sp = db.tbl_sanpham.ToList();
            //var list = db.Database.SqlQuery<tbl_sanpham>("select * from tbl_sanpham where id_dm = 1").ToList();//laays ra san pham la dien thoai
            return View(list_sp);
        }

        public ActionResult Chitietdonhang()
        {
            var list_chitietdonhang = db.tbl_chitietdonhang.ToList();
            return View(list_chitietdonhang);
        }

        public ActionResult taikhoan(int? employee_page, int? customer_page, int? page_size)
        {
            if (employee_page.HasValue) Session["employee_page"] = employee_page;
            else if (Session["employee_page"] == null) Session["employee_page"] = 1;
            if (customer_page.HasValue) Session["customer_page"] = customer_page;
            else if (Session["customer_page"] == null) Session["customer_page"] = 1;
            if (page_size.HasValue) Session["page_size"] = page_size;
            else if (Session["page_size"] == null) Session["page_size"] = 3;
            ViewBag.TabIndex = (customer_page.HasValue && !employee_page.HasValue) ? false : true;
            return View();
        }

        [ChildActionOnly]
        public ActionResult nhanvien()
        {
            var list_employee = db.Database.SqlQuery<Person>("get_all_employee").ToList();
            return PartialView(list_employee.ToPagedList(
            Convert.ToInt32(Session["employee_page"]),
                Convert.ToInt32(Session["page_size"])));
        }

        [ChildActionOnly]
        public ActionResult khachhang()
        {
            var list_customer = db.Database.SqlQuery<Person>("get_all_customer").ToList();
            return PartialView(list_customer.ToPagedList(
                Convert.ToInt32(Session["customer_page"]),
                Convert.ToInt32(Session["page_size"])));
        }


    }
}