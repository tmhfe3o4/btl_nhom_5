using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;

namespace WebNangCaoNhom5
{
    public partial class Carts : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string CartProcess()
        {
            HttpContext.Current.Session["Cart"] = null;
            
            return "Đơn hàng của bạn đang được xử lý!";
        }
        public bool checkSession()
        {
           
            if (Session["Cart"] == null)
                return false;
            List<ItemCart> lst = Session["Cart"] as List<ItemCart>;
            if (lst.Count == 0 )
                return false;
            return true;
        }
        public List<ItemCart> getCarts()
        {
            if (checkSession())
                return Session["Cart"] as List<ItemCart>;
            return null;
        }

        [WebMethod]
        public static string removeItem(int masp)
        {
            List<ItemCart> lst = HttpContext.Current.Session["Cart"] as List<ItemCart>;
            for (int i = 0; i < lst.Count; i++)
            {
                if (lst[i].SP.MaSP == masp)
                {
                    lst.RemoveAt(i);
                    return "ok";
                }
            }
            return "no";
        }


       
    }
}