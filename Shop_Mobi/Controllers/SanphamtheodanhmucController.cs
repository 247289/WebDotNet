using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Shop_Mobi.Databases;
using Shop_Mobi.Models;

namespace Shop_Mobi.Controllers
{
    [RoutePrefix("api")]
    public class SanphamtheodanhmucController : ApiController
    {
        ShopMobiContextDb db = new ShopMobiContextDb();
        [Route("sanpham/{dm}")]
        public IHttpActionResult getSanphamtheodanhmuc(string dm)
        {
            List<Sanphamtheodanhmuc> sanpham = db.Database.SqlQuery<Sanphamtheodanhmuc>
                ("Select id , ten from tbl_sanpham where id_dm in(select id from tbl_danhmuc where ten= N'" + dm +"')").ToList();
            return Json(sanpham);
        }
    }
}
