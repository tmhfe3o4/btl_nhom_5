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
            string sesid = HttpContext.Current.Session.SessionID;
            System.Web.HttpBrowserCapabilities browser = Request.Browser;
            string s = "Browser Capabilities\n"
             + "Type = " + browser.Type + "\n"
             + "Name = " + browser.Browser + "\n"
             + "Version = " + browser.Version + "\n"
             + "Major Version = " + browser.MajorVersion + "\n"
             + "Minor Version = " + browser.MinorVersion + "\n"
             + "Platform = " + browser.Platform + "\n"
             + "Is Beta = " + browser.Beta + "\n"
             + "Is Crawler = " + browser.Crawler + "\n"
             + "Is AOL = " + browser.AOL + "\n"
             + "Is Win16 = " + browser.Win16 + "\n"
             + "Is Win32 = " + browser.Win32 + "\n"
             + "Supports Frames = " + browser.Frames + "\n"
             + "Supports Tables = " + browser.Tables + "\n"
             + "Supports Cookies = " + browser.Cookies + "\n"
             + "Supports VBScript = " + browser.VBScript + "\n"
             + "Supports JavaScript = " +
                 browser.EcmaScriptVersion.ToString() + "\n"
             + "Supports Java Applets = " + browser.JavaApplets + "\n"
             + "Supports ActiveX Controls = " + browser.ActiveXControls
             + "\n";
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(ipAddress))
            {

                ipAddress = Request.ServerVariables["REMOTE_ADDR"];
            }
            string returnUrl = "";
            HttpCookie ck = Request.Cookies["NameOfCookies"];
            if (Request.UrlReferrer != null)
                returnUrl = Request.UrlReferrer.ToString();
            string cks = "";
            if (ck != null)
                cks = ck.Name;

            test.Value = sesid + "\n" + s + "\n" + ipAddress + "\n" + cks + "\n" + returnUrl;
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
            return db.NhaSanXuats.FirstOrDefault(n => n.MaNSX == db.SanPhams.FirstOrDefault(x => x.MaSP == masp).MaNSX);
        }
        public List<HinhAnh> getImage(int MaSP)
        {
            return db.HinhAnhs.Where(n => n.MaSP == MaSP).Take(1).ToList();
        }
        [WebMethod]
        public static void LoadUserControl(int tensp, int? soluong = null)
        {
            int sl = (soluong ?? 1);
            AddCart(tensp, sl);

            


        }
        public static void AddCart(int tensp, int sl)
        {
            SanPham sp = db.SanPhams.FirstOrDefault(n => n.MaSP == tensp);
            if (sp == null)
                return ;
            List<ItemCart> lst;
            if (HttpContext.Current.Session["Cart"] == null)
            {
                lst = new List<ItemCart>();
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
                foreach (var item in lst)
                {
                    if (item.SP.MaSP == sp.MaSP)
                    {
                        item.soLuong += sl;
                        item.TongTien = decimal.Parse((sp.DonGia * item.soLuong).ToString());
                        check = true;
                        break;
                    }
                    check = false;
                }
                if (check == false)
                {
                    ItemCart item = new ItemCart();
                    item.SP = sp;
                    item.soLuong = sl;
                    item.TongTien = decimal.Parse(sp.DonGia.ToString());
                    lst.Add(item);

                }
                HttpContext.Current.Session["Cart"] = lst;
            }

            
        }


    }
}