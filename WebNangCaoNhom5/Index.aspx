﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebNangCaoNhom5.Index" %>

<%@ Register TagPrefix="UC" TagName="Category" Src="~/UserControl/Category.ascx" %>
<%@ Register Src="~/UserControl/Cart.ascx" TagPrefix="UC" TagName="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <textarea style="display:none" runat="server" id="test"></textarea>
    <div class="panel">
        <UC:Category runat="server" />
        <div class="slide">
            <ul>
                <li class="active">
                    <a href="#">
                        <img style="height:100%" src="Asset/Client/image/14_11_2018_16_05_26_mi8-800-300.png" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img style="height:100%" src="Asset/Client/image/16_11_2018_09_49_24_iphone-new-800-300.png" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img style="height:100%" src="Asset/Client/image/iphone-6s-32g---phien-ban-hot-nhat_1541687542.jpg" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img style="height:100%" src="Asset/Client/image/iphone-7---128-re-nhu-32-1_1542513668.jpg" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img style="height:100%" src="Asset/Client/image/iphone-7-plus-cu-gia-re-nhat-ha-noi-didongmango_1538119038.jpg" alt=""></a>
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
                        <a href="<%=Page.GetRouteUrl("prev", new { id = item.MaSP }) %>">
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
                        <a href="<%=Page.GetRouteUrl("prev", new { id = item.MaSP }) %>">
                            <img src="<%=item.HinhAnhDaiDien %>" alt="">
                        </a>
                    </div>
                    <div class="content">
                        <h3><%=item.TenSP %></h3>
                        <p>
                            <%=item.TomTat %>
                        </p>
                        <a class="prev" href="<%=Page.GetRouteUrl("prev", new { id = item.MaSP }) %>">
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
                        <a href="<%=Page.GetRouteUrl("prev", new { id = item.MaSP }) %>">
                            <img src="<%=item.HinhAnhDaiDien %>" alt="">
                        </a>
                    </div>
                    <div class="content">
                        <h3><%=item.TenSP %></h3>
                        <p>
                            <%=item.TomTat %>
                        </p>
                        <a class="prev" href="<%=Page.GetRouteUrl("prev", new { id = item.MaSP }) %>">
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
