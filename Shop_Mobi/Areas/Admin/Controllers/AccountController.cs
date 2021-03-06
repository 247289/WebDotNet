﻿using Shop_Mobi.Databases;
using System.Web.Mvc;

namespace Shop_Mobi.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        Models.Account a = new Models.Account();
        // GET: Admin/Account
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string user, string pass)
        {
            if (a.CheckLogin(user, pass) == 1)//admin
            {
                Session["UsersAdmin"] = a.GetInfo(user);//get info admin;     
                                                        //Session["test"] = "A";

                // tbl_taikhoan tk = (tbl_taikhoan)Session["UsersAdmin"];

                return Redirect("~/Admin/Home/Index");
            }
            else if (a.CheckLogin(user, pass) == 2)//nhân viên
            {
                Session["UsersEmployee"] = a.GetInfo(user);//get info employee;                
                return Redirect("~/Admin/Home/Index");
            }
            else if (a.CheckLogin(user, pass) == 3)//nhân viên
            {
                Session["Users"] = a.GetInfo(user);//get info user;                
                return Redirect("~/Home/Index");
            }
            else
            {
                ModelState.AddModelError("", "Đăng nhập không thành công!");
                return View();
            }
        }

        public ActionResult Logout()
        {
            if (Session["UsersAdmin"] != null || Session["UsersEmployee"] != null)
            {
                Session["UsersAdmin"] = null;
                Session["UsersEmployee"] = null;
                return Redirect("~/Admin/Account/Login");
            }
            else
            {
                Session["Users"] = null;
                return Redirect("~/Admin/Account/Login");
            }
        }

        //[HttpGet]
        //public ActionResult Register()
        //{
        //    return View();
        //}

        [HttpPost]
        public ActionResult Register(string user, string email, string pass)
        {
            int code = a.Random();
            Session["vertify"] = code;
            string[] b = { user, email, pass };
            Session["thongtin"] = b;
            a.GuiMail(email, "Shop-Mobi | Website Quảng bá điện thoại di động", "Mã xác nhận của bạn là: " + code);
            return Redirect("~/Admin/Account/ConfirmMail");
            //.register(user, email, pass);
            //return Redirect("~/Admin/Account/Login");
        }

        [HttpGet]
        public ActionResult ConfirmMail()//action xac thuc mail
        {
            return View();
        }

        [HttpPost]
        public ActionResult ConfirmMail(int vertify)
        {
            if (vertify == (int)Session["vertify"])
            {
                string[] ac = (string[])Session["thongtin"];
                a.register(ac[0], ac[1], ac[2]);
                Session["thongtin"] = null;
                Session["vertify"] = null;
                return Redirect("~/Admin/Account/Login");
            }
            ViewBag.Notice = "Mã sai, vui lòng nhập lại trong vòng 1 phút! thanks!!!";
            return View();
        }

    }
}
