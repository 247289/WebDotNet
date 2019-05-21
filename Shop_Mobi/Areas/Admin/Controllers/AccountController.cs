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

        //[HttpPost]
        //public ActionResult Register(string user, string email, string pass)
        //{
        //    if (a.XacThucMail(email))
        //    {
        //        Register(user, email, pass);
        //        return View("/");
        //    }
        //    else
        //    {
        //        ModelState.AddModelError("", "Đăng ký thất bại");
        //        return View();
        //    }
        //}

        //[HttpGet]
        //public ActionResult XacThucMail(int vertif)
        //{

        //}
    }
}