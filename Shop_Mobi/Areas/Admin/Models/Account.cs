using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;

namespace Shop_Mobi.Areas.Admin.Models
{
    public class Account
    {
        Shop_Mobi.Databases.tbl_taikhoan account = new Databases.tbl_taikhoan();
        public int CheckLogin(string user, string pass)
        {
            using (var db = new Shop_Mobi.Databases.ShopMobiContextDb())
            {
                account = db.tbl_taikhoan.SingleOrDefault(x => x.tentaikhoan == user && x.matkhau == pass);
                //_account = account;
                if (account != null)
                {
                    return (int)account.id_quyen;
                }
                else
                {
                    return 0;
                }
            }

        }

        public Shop_Mobi.Databases.tbl_taikhoan GetInfo(string user)
        {
            if (account.tentaikhoan.Equals(user))
            {
                return account;
            }
            else
                return null;
        }

        public void register(string user, string email, string pass)
        {
            using (var item = new Shop_Mobi.Databases.ShopMobiContextDb())
            {
                item.Database.ExecuteSqlCommand("Register @user, @email, @pass", new[]
                {
                    new SqlParameter("user", user),
                    new SqlParameter("email", email),
                    new SqlParameter("pass", pass)
                });
            }
        }

        //random code check
        public int Random()
        {
            Random ran = new Random();
            int res = ran.Next(100000, 999999);
            return res;
        }

        public void GuiMail(string nguoinhan, string tieude, string noidung)
        {
            SmtpClient smtp = new SmtpClient();
            try
            {
                //ĐỊA CHỈ SMTP Server
                smtp.Host = "smtp.gmail.com";
                //Cổng SMTP
                smtp.Port = 587;
                //SMTP yêu cầu mã hóa dữ liệu theo SSL
                smtp.EnableSsl = true;
                //UserName và Password của mail
                smtp.Credentials = new NetworkCredential("youremail@gmail.com", "yourpass");

                //Tham số lần lượt là địa chỉ người gửi, người nhận, tiêu đề và nội dung thư
                smtp.Send("Website Quản bá và bán điện thoại di dộng <shop_mobi@gmail.com>", nguoinhan, tieude, noidung);

            }
            catch
            {

            }
        }
    }
}
