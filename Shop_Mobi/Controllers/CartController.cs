using Shop_Mobi.Databases;
using Shop_Mobi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shop_Mobi.Controllers
{
    public class CartController : Controller
    {
        ShopMobiContextDb db = new ShopMobiContextDb();
        // GET: Cart
        public ActionResult Index()
        {
            List<CartItem> cartitem = Session["CartItem"] as List<CartItem>;
            return View(cartitem);
        }

        public RedirectToRouteResult AddItem(int id)
        {
            if (Session["CartItem"] == null)
            {
                Session["CartItem"] = new List<CartItem>();  // Khởi tạo Session["giohang"] là 1 List<CartItem>
            }

            List<CartItem> giohang = Session["CartItem"] as List<CartItem>;  // Gán qua biến giohang dễ code

            // Kiểm tra xem sản phẩm khách đang chọn đã có trong giỏ hàng chưa

            if (giohang.FirstOrDefault(m => m.sanpham.id == id) == null) // ko co sp nay trong gio hang
            {
                tbl_sanpham sp = db.tbl_sanpham.Find(id);  // tim sp theo sanPhamID

                CartItem newItem = new CartItem()
                {
                    sanpham = sp,
                    soluong = 1
                };  // Tạo ra 1 CartItem mới

                giohang.Add(newItem);  // Thêm CartItem vào giỏ 
            }
            else
            {
                // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                CartItem cardItem = giohang.FirstOrDefault(m => m.sanpham.id == id);
                cardItem.soluong++;
            }
            //lấy ra số lượng sản phẩm
            int Tsoluong = 0;
            Tsoluong += giohang.Count();
            if (Tsoluong == 0)
            {
                Session["Tsoluong"] = 0;
            }
            Session["Tsoluong"] = Tsoluong;// đưa số lượng vào session

            // Action này sẽ chuyển hướng về trang chi tiết sp khi khách hàng đặt vào giỏ thành công. Bạn có thể chuyển về chính trang khách hàng vừa đứng bằng lệnh return Redirect(Request.UrlReferrer.ToString()); nếu muốn.
            return RedirectToAction("Index", "Home");
        }

        public RedirectToRouteResult SuaSoLuong(int id, int soluongmoi)
        {
            // tìm carditem muon sua
            List<CartItem> giohang = Session["CartItem"] as List<CartItem>;
            CartItem itemSua = giohang.FirstOrDefault(m => m.sanpham.id == id);
            if (itemSua != null)
            {
                itemSua.soluong = soluongmoi;
            }
            return RedirectToAction("Index");

        }

        public RedirectToRouteResult XoaKhoiGio(int id)
        {
            List<CartItem> giohang = (List<CartItem>)Session["CartItem"];
            CartItem itemXoa = giohang.FirstOrDefault(m => m.sanpham.id == id);
            if (itemXoa != null)
            {
                giohang.Remove(itemXoa);
            }
            //
            int Tsoluong = 0;
            Tsoluong += giohang.Count();
            if (Tsoluong == 0)
            {
                Session["Tsoluong"] = 0;
            }
            Session["Tsoluong"] = Tsoluong;
            //
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Payment()
        {
            var cart = Session["CartItem"];

            if (cart != null)
            {
                //list = (List<CartItem>)cart;
                return View();
            }
            return View("404");
        }

        [HttpPost]
        public ActionResult Payment(string Name, string PhoneNumber, string Email, string Address)
        {
            try
            {
                return View("404");
            }
            catch
            {

                return View("404");
            }
        }
    }
}