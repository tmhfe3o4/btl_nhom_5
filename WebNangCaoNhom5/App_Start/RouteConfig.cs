using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace WebNangCaoNhom5
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();

            settings.AutoRedirectMode = RedirectMode.Off;
            routes.Ignore("{resource}.aspx/{*pathInfo}");
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("trangchu", "Home", "~/Index.aspx");
            routes.MapPageRoute("tintuc", "News", "~/News.aspx");
            routes.MapPageRoute("dichvu", "Services", "~/Services.aspx");
            routes.MapPageRoute("dieukhoan", "DieuKhoan", "~/DieuKhoan.aspx");
            routes.MapPageRoute("thongtin", "AboutUs", "~/AboutUs.aspx");
            routes.MapPageRoute("lienhe", "ContactUs", "~/ContactUs.aspx");
            routes.MapPageRoute("prev", "dtdd--{id}", "~/Preview.aspx");
            
            
            routes.MapPageRoute("cart", "Cart", "~/Cart.aspx");
            routes.MapPageRoute("pagelist", "san-pham--{producer}/{page}", "~/ListProduct.aspx");
            routes.MapPageRoute("product", "san-pham--{producer}", "~/ListProduct.aspx");
            routes.MapPageRoute("edit", "chinh-sua/{id}", "~/Admin/EditProduct.aspx");
        }
    }
}
