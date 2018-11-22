using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;

namespace WebNangCaoNhom5.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        static WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            ThanhVien tv = db.ThanhViens.FirstOrDefault(n => n.UserName == email.Value && n.PassWord == password.Value) as ThanhVien;
            if (tv!=null)
            {
                Session["admin"] = tv;
                Response.Redirect("/Admin/Index.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this,
                                   this.GetType(),
                                     "Script",
                                     "alert('Tài khoản hoặc mật khẩu không chính xác')",
                                     true);
            }

        }
        [WebMethod]
        public static string Register(string username, string password)
        {
            int count = db.ThanhViens.Where(n => n.UserName == username).Count();
            if (count == 0)
            {
                ThanhVien tv = new ThanhVien();
                tv.Email = username;
                tv.PassWord = password;
                db.ThanhViens.InsertOnSubmit(tv);
                db.SubmitChanges();
                return "Ok";
            }
            else
                return "Error";


        }
    }
}