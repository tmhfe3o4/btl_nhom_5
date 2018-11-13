using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebNangCaoNhom5.Models;


namespace WebNangCaoNhom5.UserControl
{
    public partial class Cart : System.Web.UI.UserControl
    {
        static WebDienThoaiDataContext db = new WebDienThoaiDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
        public int getNumberOfCart()
        {
            List<ItemCart> lst = Session["Cart"] as List<ItemCart>;
            if(lst==null)
            {
                return 0;
            }
            int count = 0;
            foreach(ItemCart itemCart in lst)
            {
                count += itemCart.soLuong;
            }
            return count;
        }
        
    }
}