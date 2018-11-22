using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;

namespace WebNangCaoNhom5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void signin(object sender, EventArgs e)
        {
            var xxxx = db.ThanhViens.Where(a => a.UserName.CompareTo(namelogin.Value) == 0 && a.PassWord.CompareTo(password.Value) == 0);
            foreach(var i in xxxx)
            {
                if(i.UserName != null && i.PassWord != null)
                {
                    HttpCookie hk = new HttpCookie("name_login");
                    hk.Value = i.UserName.ToString();
                    hk.Expires = DateTime.Now.AddDays(15);
                    Response.Cookies.Add(hk);
                }
            }
        }
        protected void register(object sender, EventArgs e)
        {
            ThanhVien tv = new ThanhVien();
            if(password1 == password11)
            {
                tv.UserName = namelogin.Value;
                tv.PassWord = password1.Value;
                db.ThanhViens.InsertOnSubmit(tv);
                db.SubmitChanges();
            }
        }
    }
}