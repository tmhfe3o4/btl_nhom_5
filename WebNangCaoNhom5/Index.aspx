<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebNangCaoNhom5.Index" %>

<%@ Register TagPrefix="UC" TagName="Category" Src="~/UserControl/Category.ascx" %>
<%@ Register Src="~/UserControl/Cart.ascx" TagPrefix="UC" TagName="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <div class="panel">
        <UC:Category runat="server" />
        <div class="slide">
            <ul>
                <li class="active">
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="content">
        <%  
            if (getListNewProduct().Count > 0)
            {
        %>
        <div class="news_products">
            <div class="head_categorys">
                <span><%=getProducer(getListNewProduct().First().MaSP).TenNSX %></span>
                <a href="/san-pham--<%=getProducer(getListNewProduct().First().MaSP).TenNSX%>">See all
                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                </a>
            </div>
            <div class="list_categorys">
                <%foreach (var item in getListNewProduct().Take(4))
                    {
                %>
                <div class="box1">
                    <div class="icon">
                        <a href="<%=Page.GetRouteUrl("prev", new { id = item.TenSP }) %>">
                            <img src="<%=item.HinhAnhDaiDien %>" alt="">
                        </a>
                    </div>
                    <div class="content">
                        <h3><%=item.TenSP %></h3>
                        <p>
                            <%=item.TomTat.ToString() %>
                        </p>
                        <span><%=string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"), "{0:c}", item.DonGia) %></span>
                        <a data-info="<%=item.MaSP %>" class="order" style="cursor: pointer">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
                <%}
                %>
            </div>
        </div>
        <div class="clear"></div>
        <% 
            } %>
        <%  
            if (getListNewProduct1().Count > 0)
            {
        %>
        <div class="news_products">
            <div class="head_categorys">
                <span><%=getProducer(getListNewProduct1().First().MaSP).TenNSX %></span>
                <a href="/san-pham--<%=getProducer(getListNewProduct1().First().MaSP).TenNSX%>">See all
                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                </a>
            </div>
            <div class="list_categorys">
                <%foreach (var item in getListNewProduct1().Take(4))
                    {
                %>
                <div class="box2">
                    <div class="icon">
                        <a href="<%=Page.GetRouteUrl("prev", new { id = item.TenSP }) %>">
                            <img src="<%=item.HinhAnhDaiDien %>" alt="">
                        </a>
                    </div>
                    <div class="content">
                        <h3><%=item.TenSP %></h3>
                        <p>
                            <%=item.TomTat %>
                        </p>
                        <a class="prev" href="<%=Page.GetRouteUrl("prev", new { id = item.TenSP }) %>">
                            <span></span>
                            Xem chi tiết</a>
                        <a style="cursor: pointer" class="order" data-info="<%=item.MaSP %>">
                            <svg>
                                <rect></rect>
                            </svg>
                            <%=string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"), "{0:c}", item.DonGia) %>
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
                <%}
                    } %>
            </div>
        </div>
        <div class="clear"></div>
        <%  
            if (getListNewProduct2().Count > 0)
            {
        %>
        <div class="news_products">
            <div class="head_categorys">
                <span><%=getProducer(getListNewProduct2().First().MaSP).TenNSX %></span>
                <a href="/san-pham--<%=getProducer(getListNewProduct2().First().MaSP).TenNSX%>">See all
                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                </a>
            </div>
            <div class="list_categorys">
                <%foreach (var item in getListNewProduct2().Take(4))
                    {
                %>
                <div class="box3">
                    <div class="icon">
                        <a href="<%=Page.GetRouteUrl("prev", new { id = item.TenSP }) %>">
                            <img src="<%=item.HinhAnhDaiDien %>" alt="">
                        </a>
                    </div>
                    <div class="content">
                        <h3><%=item.TenSP %></h3>
                        <p>
                            <%=item.TomTat %>
                        </p>
                        <a class="prev" href="<%=Page.GetRouteUrl("prev", new { id = item.TenSP }) %>">
                            <span></span>
                            <span></span>
                            Xem chi tiết</a>
                        <a style="cursor: pointer" data-info="<%=item.MaSP %>" class="order price"><%=string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"), "{0:c}", item.DonGia) %>
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
                <%}
                    }%>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <script src="Asset/Client/js/Index.js"></script>
</asp:Content>
