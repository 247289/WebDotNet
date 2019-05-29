using PagedList;
using Shop_Mobi.Databases;
using Shop_Mobi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace Shop_Mobi.Controllers
{
    public class HomeController : Controller
    {
        private ShopMobiContextDb db = new ShopMobiContextDb();
        private Tbl_sanpham sp = new Tbl_sanpham();
        //private Tbl_nhasanxuat nsx = new Tbl_nhasanxuat();
        // GET: Home
        public ActionResult Index(int? page)
        {
            var list = sp.getList();
            int pageNumber = (page ?? 1);
            int pageSize = 9;
            //lấy ra ảnh của sản phẩm tương ứng
            Dictionary<int, string> listImg = new Dictionary<int, string>();
            for (int i = 0; i<pageSize; i++)
            {
                try
                {
                    listImg.Add(i, sp.getImg(list[(pageNumber - 1) * pageSize + i].id)[0]);//add ảnh lấy được vào dict
                }
                catch (Exception)
                {
                    
                }
            }
            ViewBag.Anh = listImg;

            return View(list.ToPagedList(pageNumber, pageSize));
        }

        // GET: Home/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //tìm id sản phẩm xem có hay không
            int _id = id ?? 0;
            tbl_sanpham tbl_sp = sp.Find(_id);
            if (tbl_sp == null)
            {
                return HttpNotFound();
            }
            var id_nsx = tbl_sp.id_nsx ?? 1;
            var listRI = db.tbl_sanpham.Where(x => x.id_nsx == id && x.tinhtrang == 1).OrderByDescending(x => x.gia).Take(4).ToList(); //new Tbl_nhasanxuat().GetTop(id_nsx, 6);
            ViewBag.RecommendedItems = listRI;//sản phẩm có liên quan
            return View(tbl_sp);
        }

        //Get: Danh mục theo id
        [HttpGet]
        public ActionResult Category(int? id, int? page)
        {
            ViewBag.id = id;
            try
            {
                var listDM = db.tbl_sanpham.Where(x => x.id_dm == id && x.tinhtrang == 1).ToList();//lấy ra toàn bộ sản phẩm theo danh mục
                if (listDM != null)
                {
                    ViewBag.ListCategory = db.tbl_danhmuc.SingleOrDefault(dm => dm.id == id).ten.ToString();

                    int pageNumber = (page ?? 1);
                    int pageSize = 9;
                    return View(listDM.ToList().ToPagedList(pageNumber, pageSize));
                }
                else
                    return RedirectToAction("Index");
            }
            catch
            {
                return View("404");
            }

        }

        //Get: Sản phẩm theo id
        [HttpGet]
        public ActionResult Producer(int? id, int page = 1, int pageSize = 6)
        {
            ViewBag.ProId = id;
            try
            {
                var listSP = db.tbl_sanpham.Where(x => x.id_nsx == id && x.tinhtrang == 1).ToList();//lấy ra toàn bộ sản phẩm theo nhà sản xuất
                if (listSP != null)
                {
                    ViewBag.ListProducer = db.tbl_nhasanxuat.SingleOrDefault(sp => sp.id == id).ten.ToString();
                    return View(listSP.ToList().ToPagedList(page, pageSize));
                }
                else
                    return RedirectToAction("Index");

            }
            catch
            {
                return View("404");
            }

        }
        //Get: Tìm kiếm sản phẩm
        public ActionResult Search(string key, int page = 1, int pageSize = 6)
        {
            ViewBag.search = key;
            var list = sp.TimKiemSanPham(key);
            if (list != null && list.ToList().Count != 0)
            {
                return View(list.ToPagedList(page, pageSize));
            }
            return View("404");
        }

        //Get: Tin tức công nghệ
        public ActionResult News(int page =1, int size = 4)
        {
            List<Databases.tbl_news> list = db.tbl_news.OrderByDescending(x => x.id).ToList();

            List<Databases.tbl_news> listConvert = new List<tbl_news>();

            foreach (var i in list)
            {
                Databases.tbl_news news = new Databases.tbl_news();

                string cont = i.noidung;
                if (cont.Length >= 10)
                {
                    cont = i.noidung.Substring(0, 100);
                }

                news.anh = i.anh;
                news.tieude = i.tieude;
                news.ngaydang = i.ngaydang;
                news.noidung = cont;

                listConvert.Add(news);
            }
            
            //ViewBag.Newlist = listConvert;

            return View("_News", listConvert.ToPagedList(page, size));
        }


    }
}