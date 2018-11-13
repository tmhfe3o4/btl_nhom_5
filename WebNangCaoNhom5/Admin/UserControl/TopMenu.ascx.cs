using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNangCaoNhom5.Admin.UserControl
{
    public partial class TopMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}