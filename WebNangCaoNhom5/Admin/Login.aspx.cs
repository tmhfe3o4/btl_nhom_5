using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNangCaoNhom5.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            if (email.Value == "ngokprao121@gmail.com" && password.Value == "admin")
            {
                Session["admin"] = "Admin";
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

       
    }
}