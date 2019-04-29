using Shop_Mobi.Models;
using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shop_Mobi.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult CategoryProduct()
        {
            using (var context = new Shop_Mobi.Databases.ShopMobiContextDb())
            {
                var model = context.Database.SqlQuery<Tbl_danhmuc>("select * from tbl_danhmuc").ToList();
                ViewBag.NSX = context.Database.SqlQuery<Tbl_nhasanxuat>("select * from tbl_nhasanxuat").ToList();
                return PartialView(model);
            }
        }
    }
}