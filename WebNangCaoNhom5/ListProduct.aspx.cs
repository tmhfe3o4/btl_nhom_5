using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;
using WebNangCaoNhom5.App_Start;

namespace WebNangCaoNhom5
{
    public partial class ListProduct : System.Web.UI.Page
    {
        WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public List<SanPham> getlistProduct(int? page=null)
        {
            int pageIndex;
            if (Request.QueryString["page"]!=null)
            {
                 pageIndex =int.Parse(Request.QueryString["page"].ToString());
            }
           else
                pageIndex = (page) ?? 1;
            string TenNSX = Page.RouteData.Values["producer"].ToString();
            if (TenNSX == null)
            {
                TenNSX = Request.QueryString["page"].ToString();
            }
            NhaSanXuat nsx = db.NhaSanXuats.FirstOrDefault(n=>n.TenNSX==TenNSX);
            List<SanPham> lst = db.SanPhams.Where(n => n.MaNSX == nsx.MaNSX).ToList();
            PageList.pageIndex = pageIndex;

            PageList.totalPage = (int)Math.Ceiling((double)lst.Count / PageList.pageSize);

            return lst.OrderByDescending(n=>n.NgayCapNhat).Skip((PageList.pageIndex-1)*pageIndex).Take(PageList.pageSize).ToList();
        }
       
    }
}