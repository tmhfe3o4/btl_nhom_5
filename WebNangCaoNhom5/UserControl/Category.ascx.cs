using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;

namespace WebNangCaoNhom5.UserControl
{
    public partial class Category : System.Web.UI.UserControl
    {
        WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<NhaSanXuat> getProducer()
        {
            return db.NhaSanXuats.ToList();
        }
    }
}