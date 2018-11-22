using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;



namespace WebNangCaoNhom5.Admin
{
    public partial class CreateProduct : System.Web.UI.Page
    {
        public static WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            CKFinder.FileBrowser fileBrowser = new CKFinder.FileBrowser();
            fileBrowser.BasePath = "/Asset/Admin/js/Plugin/ckfinder/";
            fileBrowser.SetupCKEditor(CKEditorControl1);
           
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            
            Thread.Sleep(2000);
                ScriptManager.RegisterStartupScript(this,
                                  this.GetType(),
                                    "Script",
                                    " $('.back').css('display','none');",
                                    true);
                Response.Write(Page.Request.Form["txtname"]);
              SanPham sp = new SanPham();
            //sp.TenSP = tensp.Value;
            //sp.TomTat = tomtat.Value;
            //sp.SoLuongTon = int.Parse(soluong.Value);
            //sp.ChiTiet = CKEditorControl1.Text;
            //sp.DonGia = decimal.Parse(dongia.Value);

            //sp.HinhAnhDaiDien = anhdaidien.Value;
            //sp.NgayCapNhat = DateTime.Now;
            //sp.MaNCC = 1;
            //sp.MaNSX = int.Parse(Page.Request.Form["txt"]);
            //sp.MaLoaiSP = 1;
            //db.SanPhams.InsertOnSubmit(sp);
            //db.SubmitChanges();
            //string[] x = anhlienquan.InnerText.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.RemoveEmptyEntries);
            //foreach (var item in x)
            //{
            //    HinhAnh hinhAnh = new HinhAnh();
            //    hinhAnh.MaSP = sp.MaSP;
            //    hinhAnh.TenHinhAnh = item;
            //    db.HinhAnhs.InsertOnSubmit(hinhAnh);
            //}
            //db.SubmitChanges();
            tensp.Value = "";
            tomtat.Value = "";
            CKEditorControl1.Text = "";
            soluong.Value = "";
            dongia.Value = "";
            anhdaidien.InnerText = "";
            anhlienquan.InnerText = "";


        }
        public List<NhaSanXuat> getNSX()
        {
            return db.NhaSanXuats.ToList();
        }
    }
}