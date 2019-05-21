using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using Shop_Mobi.Databases;
using Shop_Mobi.Models;

namespace Shop_Mobi.Controllers
{
    [RoutePrefix("api")]
    public class BaogiaController : ApiController
    {
        ShopMobiContextDb db = new ShopMobiContextDb();
        //Get : Gia 
        [HttpGet]
        public IHttpActionResult getGia()
        {
            List<BaoGia> gia = db.Database.SqlQuery<BaoGia>("select id, ten, gia from tbl_sanpham").ToList();
            return Json(gia);
        }
    }
}
