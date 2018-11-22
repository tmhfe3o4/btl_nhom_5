using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;
using WebNangCaoNhom5.App_Start;
using Newtonsoft.Json;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace WebNangCaoNhom5.Admin
{
    public partial class ListProductAdmin : System.Web.UI.Page
    {
        static WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string ListProduct()
        {
            SanPham sp = new SanPham();    

          
            return JsonConvert.SerializeObject(db.SanPhams.ToList());
        }
        
    }
}