using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;

namespace WebNangCaoNhom5
{
    public partial class Preview : System.Web.UI.Page
    {
        WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public SanPham getProduct()
        {
            if (Page.RouteData.Values["id"].ToString() == null)
            {
                Response.Redirect("/404NotFound.aspx");
            }
            return db.SanPhams.FirstOrDefault(n => n.TenSP == Page.RouteData.Values["id"].ToString());
        }
        public NhaSanXuat getProducer()
        {
            return db.NhaSanXuats.FirstOrDefault(n => n.MaNSX == getProduct().MaNSX);
        }
        public List<HinhAnh> getImageProduct()
        {
           
            return db.HinhAnhs.Where(n => n.MaSP == getProduct().MaSP).ToList();
        }
        public List<SanPham> getRelatedProducts()
        {
            return db.SanPhams.Where(n => n.MaSP != getProduct().MaSP).Take(4).ToList();
        }
    }
}