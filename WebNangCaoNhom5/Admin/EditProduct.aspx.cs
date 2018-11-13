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

            if (Session["admin"] == null)
            {
                Response.Redirect("/Admin/Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    SanPham sp = getsp();
                    tensp.Value = sp.TenSP;
                    tomtat.Value = sp.TomTat;
                    CKEditorControl1.Text = sp.ChiTiet;
                    soluong.Value = sp.SoLuongTon.ToString();
                    dongia.Value = sp.DonGia.ToString();
                    anhdaidien.Value = sp.HinhAnhDaiDien;
                }

            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SanPham sp = getsp();
            sp.TenSP = tensp.Value;
            sp.TomTat = tomtat.Value;
            sp.MaNSX = int.Parse(Page.Request.Form["txt"]);
            sp.ChiTiet = CKEditorControl1.Text;
            sp.SoLuongTon = int.Parse(soluong.Value);
            sp.DonGia = decimal.Parse(dongia.Value);
            sp.HinhAnhDaiDien = anhdaidien.Value;
            db.SubmitChanges();
        }
        public SanPham getsp()
        {
            if (Page.RouteData.Values["id"].ToString() == null || db.SanPhams.FirstOrDefault(n => n.MaSP == int.Parse(Page.RouteData.Values["id"].ToString())) == null)
            {
                Response.Redirect("/404NotFound.aspx");
                return null;
            }
            return db.SanPhams.FirstOrDefault(n => n.MaSP == int.Parse(Page.RouteData.Values["id"].ToString()));
        }
        public List<NhaSanXuat> getNSX()
        {
            return db.NhaSanXuats.ToList();
        }
    }
}