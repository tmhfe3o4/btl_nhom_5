using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;

namespace WebNangCaoNhom5
{
    public partial class Search : System.Web.UI.Page
    {
        WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public List<SanPham> GetProductByKeyword()
        {
            return db.SanPhams.Where(n => n.ChiTiet.Contains(Request.QueryString["keyword"])).ToList();
        }

    }
}