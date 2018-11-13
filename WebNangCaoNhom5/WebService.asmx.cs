using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using WebNangCaoNhom5.Models;

namespace WebNangCaoNhom5
{
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {
        WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        [WebMethod]

        public void getlistProduct()
        {
            List<Product> lst = new List<Product>();
            foreach (var item in db.SanPhams)
            {
                Product pd = new Product();
                pd.masp = item.MaSP;
                pd.tensp = item.TenSP;
                pd.soluong = item.SoLuongTon;
                pd.dongia = item.DonGia;
                pd.maNSX = item.MaNSX;
                pd.tenNSX = item.NhaSanXuat.TenNSX;
                lst.Add(pd);
            }

            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();

            Context.Response.Write(javaScriptSerializer.Serialize(lst));
        }
        [WebMethod]
        public void getlistProducer()
        {
            List<Producer> lst = new List<Producer>();
            foreach (var item in db.NhaSanXuats)
            {
                Producer pd = new Producer();
                pd.maNSX = item.MaNSX;
                pd.tenNSX = item.TenNSX;
                lst.Add(pd);
            }

            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();

            Context.Response.Write(javaScriptSerializer.Serialize(lst));
        }
        [WebMethod]
        public void deleteProduct(int id)
        {
            foreach (var item in db.HinhAnhs)
            {
                if (item.MaSP == id)
                {
                    db.HinhAnhs.DeleteOnSubmit(item);
                    db.SubmitChanges();
                }
            }
            foreach (var item in db.SanPhams)
            {
                if (item.MaSP == id)
                {
                    db.SanPhams.DeleteOnSubmit(item);
                    db.SubmitChanges();
                    break;
                }
            }
        }
        [WebMethod]
        public void UpdateImage(int id, List<string> imageSrc)
        {
            foreach (var item in db.HinhAnhs)
            {
                if (item.MaSP == id)
                {
                    db.HinhAnhs.DeleteOnSubmit(item);
                    db.SubmitChanges();
                }
            }
            if (imageSrc.Count > 0)
            {
                foreach (var item in imageSrc)
                {
                    HinhAnh hinhAnh = new HinhAnh();
                    hinhAnh.MaSP = id;
                    hinhAnh.TenHinhAnh = item;
                    db.HinhAnhs.InsertOnSubmit(hinhAnh);
                    db.SubmitChanges();
                }
            }
        }
        [WebMethod]
       public List<string> getImage(int id)
        {
            List<string> lstIm = new List<string>();
            foreach(var item in db.HinhAnhs)
            {
                if (item.MaSP == id)
                    lstIm.Add(item.TenHinhAnh);
            }
            return lstIm;
        }
    }
}
