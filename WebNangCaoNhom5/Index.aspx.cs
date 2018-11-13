using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;
using WebNangCaoNhom5.UserControl;

namespace WebNangCaoNhom5
{
    public partial class Index : System.Web.UI.Page
    {
        static WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        public List<SanPham> getListNewProduct()
        {
         
            return db.SanPhams.Where(n => n.MaNSX == 1).ToList();
        }
        public List<SanPham> getListNewProduct1()
        {
            return db.SanPhams.Where(n => n.MaNSX == 2).ToList();
        }
        public List<SanPham> getListNewProduct2()
        {
            return db.SanPhams.Where(n => n.MaNSX == 3).ToList();
        }
        public NhaSanXuat getProducer(int masp)
        {
            return db.NhaSanXuats.FirstOrDefault(n => n.MaNSX == db.SanPhams.FirstOrDefault(x=> x.MaSP == masp).MaNSX);
        }
        public List<HinhAnh> getImage(int MaSP)
        {
            return db.HinhAnhs.Where(n => n.MaSP == MaSP).Take(1).ToList();
        }
        [WebMethod]
        public static string LoadUserControl(int tensp,int? soluong=null)
        {
            int sl = (soluong ?? 1);
                AddCart(tensp,sl);
           
                using (Index page = new Index())
                {
                    HtmlForm form = new HtmlForm();
                    Cart userControl = (Cart)page.LoadControl("~/UserControl/Cart.ascx");
                    form.Controls.Add(userControl);
                    using (StringWriter writer = new StringWriter())
                    {
                        page.Controls.Add(form);
                        HttpContext.Current.Server.Execute(page, writer, false);
                        return writer.ToString();
                    }
                }
            
           
        }
        public static bool AddCart(int tensp,int sl)
        {
            SanPham sp = db.SanPhams.FirstOrDefault(n => n.MaSP == tensp);
            if (sp == null)
                return false;
            List<ItemCart> lst;
            if (HttpContext.Current.Session["Cart"]==null)
            {
                lst= new List<ItemCart>();
                ItemCart item = new ItemCart();
                item.SP = sp;
                item.soLuong = sl;
                item.TongTien = decimal.Parse(sp.DonGia.ToString());
                lst.Add(item);
                HttpContext.Current.Session["Cart"] = lst;

            }
            else
            {
                 lst = HttpContext.Current.Session["Cart"] as List<ItemCart>;
                bool check = false;
                foreach(var item in lst)
                {
                    if (item.SP.MaSP == sp.MaSP) {
                        item.soLuong+=sl;
                        item.TongTien =decimal.Parse((sp.DonGia * item.soLuong).ToString());
                        check = true;
                        break;
                    }
                    check = false;
                }
                if(check==false)
                {
                    ItemCart item = new ItemCart();
                    item.SP = sp;
                    item.soLuong = sl;
                    item.TongTien = decimal.Parse(sp.DonGia.ToString());
                    lst.Add(item);
                    
                }
                HttpContext.Current.Session["Cart"] = lst;
            }
            
            return true;
        }


    }
}