using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;

namespace WebNangCaoNhom5.Admin
{
    public partial class EditProduct : System.Web.UI.Page
    {
        WebDienThoaiDataContext db = new WebDienThoaiDataContext();
       
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["admin"] == null)
            //{
            //    Response.Redirect("/Admin/Login.aspx");
            //}
            //else
            
           
            //}
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SanPham sp1 = getsp();
            sp1.TenSP = tensp.Value;
            sp1.TomTat = tomtat.Value;
            sp1.MaNSX = int.Parse(Page.Request.Form["txt"]);
            sp1.ChiTiet = CKEditorControl1.Text;
            sp1.SoLuongTon = int.Parse(soluong.Value);
            sp1.DonGia = decimal.Parse(dongia.Value);
            sp1.HinhAnhDaiDien = anhdaidien.Value;
            db.SubmitChanges();
        }
       public SanPham getsp()
        {
            return db.SanPhams.FirstOrDefault(n => n.MaSP == int.Parse(Page.RouteData.Values["id"].ToString()));
        }
        public List<NhaSanXuat> getNSX()
        {
            return db.NhaSanXuats.ToList();
        }
    }
}