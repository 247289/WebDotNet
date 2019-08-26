using PagedList;
using Shop_Mobi.Areas.Admin.Models;
using Shop_Mobi.Databases;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Shop_Mobi.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        ShopMobiContextDb db = new ShopMobiContextDb();
        Models.Sanpham sp = new Sanpham();

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

        public ActionResult Chitietdonhang()
        {
            var list_chitietdonhang = db.tbl_chitietdonhang.ToList();
            return View(list_chitietdonhang);
        }

        #region tuan anh
        public ActionResult DienThoai()
        {
            var list_dt = sp.LaySanPham_DM(1);
            return View(list_dt);
        }

        public ActionResult Tablet()
        {
            var list_dt = sp.LaySanPham_DM(2);
            return View(list_dt);
        }

        public ActionResult PhuKien()
        {
            var list_dt = sp.LaySanPham_DM(3);
            return View(list_dt);
        }

        public ActionResult KhuyenMai()
        {
            var list_dt = sp.LaySanPham_DM(5);
            return View(list_dt);
        }

        public ActionResult themspmoi()
        {
            return View();
        }

        [HttpPost]
        public ActionResult themmoisp(
            int id_dm, string ten, int gia, int soluong, int trongluong,
            int ROM, int RAM, string thenho, int camera_truoc, int camera_sau,
            int pin, string baohanh, int bluetooth, int id_nsx, string CPU, int manhinh, int tinhtrang)
        {
            db.Database.ExecuteSqlCommand("exec themsanpham @id_dm, @ten,@gia,@soluong,@trongluong,@ROM,@RAM,@thenho,@camera_truoc,@camera_sau,@pin,@baohanh,@bluetooth,@id_nsx,@CPU,@manhinh,@tinhtrang", parameters: new[] {
                new SqlParameter("id_dm", id_dm),
                new SqlParameter("ten", ten),
                new SqlParameter("gia", gia),
                new SqlParameter("soluong", soluong),
                new SqlParameter("trongluong", trongluong),
                new SqlParameter("ROM", ROM),
                new SqlParameter("RAM", RAM),
                new SqlParameter("thenho", thenho),
                new SqlParameter("camera_truoc", camera_truoc),
                new SqlParameter("camera_sau", camera_sau),
                new SqlParameter("pin", pin),
                new SqlParameter("baohanh", baohanh),
                new SqlParameter("bluetooth", bluetooth),
                new SqlParameter("id_nsx", id_nsx),
                new SqlParameter("CPU", CPU),
                new SqlParameter("manhinh", manhinh),
                new SqlParameter("tinhtrang", tinhtrang)
            });
            return Redirect("~/Admin/Home/DienThoai");
            //return View();
        }

        [HttpGet]
        public ActionResult suasp(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //tìm id sản phẩm xem có hay không
            int _id = id ?? 0;
            var tbl_sp = sp.Find(id);
            if (tbl_sp == null)
            {
                return HttpNotFound();
            }
            return View(tbl_sp);
        }

        [HttpPost]
        public ActionResult suasanpham(int id_sp, int id_dm, string ten, int gia, int soluong, int trongluong,
            string ROM, string RAM, string thenho, int camera_truoc, int camera_sau,
            int pin, string baohanh, int bluetooth, int id_nsx, string CPU, string manhinh, int tinhtrang)
        {
            db.Database.ExecuteSqlCommand("exec suasanpham @id_sp, @id_dm, @ten,@gia,@soluong,@trongluong,@ROM,@RAM,@thenho,@camera_truoc,@camera_sau,@pin,@baohanh,@bluetooth,@id_nsx,@CPU,@manhinh,@tinhtrang", parameters: new[] {
                new SqlParameter("id_sp",id_sp),
                new SqlParameter("id_dm", id_dm),
                new SqlParameter("ten", ten),
                new SqlParameter("gia", gia),
                new SqlParameter("soluong", soluong),
                new SqlParameter("trongluong", trongluong),
                new SqlParameter("ROM", ROM),
                new SqlParameter("RAM", RAM),
                new SqlParameter("thenho", thenho),
                new SqlParameter("camera_truoc", camera_truoc),
                new SqlParameter("camera_sau", camera_sau),
                new SqlParameter("pin", pin),
                new SqlParameter("baohanh", baohanh),
                new SqlParameter("bluetooth", bluetooth),
                new SqlParameter("id_nsx", id_nsx),
                new SqlParameter("CPU", CPU),
                new SqlParameter("manhinh", manhinh),
                new SqlParameter("tinhtrang", tinhtrang)
            });
            return Redirect("~/Admin/Home/DienThoai");
        }

        #endregion

        #region quan
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

        [HttpPost]
        public ActionResult thaydoithongtin(
            int id, string ten, DateTime? ngaysinh, int gioitinh,
            string diachi, decimal? sdt, string email, string anhdaidien)
        {
            string command = "edit_personal_info @id, @name, @birth, @gender, @place, @phone, @mail, @image";
            SqlParameter[] param_list = new SqlParameter[8];
            param_list[0] = new SqlParameter("id", id);
            param_list[1] = new SqlParameter("name",
                (ten == null || ten.Length == 0) ? (object)DBNull.Value : (object)ten);
            param_list[2] = new SqlParameter("birth",
                ngaysinh.HasValue ? (object)ngaysinh : (object)DBNull.Value);
            param_list[3] = new SqlParameter("gender", gioitinh == 0 ? false : true);
            param_list[4] = new SqlParameter("place",
                (diachi == null || diachi.Length == 0) ? (object)DBNull.Value : (object)diachi);
            param_list[5] = new SqlParameter("phone",
                sdt.HasValue ? (object)sdt : (object)DBNull.Value);
            param_list[6] = new SqlParameter("mail",
                (email == null || email.Length == 0) ? (object)DBNull.Value : (object)email);
            param_list[7] = new SqlParameter("image",
                (anhdaidien == null || anhdaidien.Length == 0) ? (object)DBNull.Value : (object)anhdaidien);
            db.Database.ExecuteSqlCommand(command, param_list);
            return Redirect("taikhoan");
        }

        #endregion
    }
}