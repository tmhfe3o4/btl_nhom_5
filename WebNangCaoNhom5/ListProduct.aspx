﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="ListProduct.aspx.cs" Inherits="WebNangCaoNhom5.ListProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <script>
        $(function () {
            $(".list_categorys .content a").click(function () {

                $.ajax({

                    type: "post",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    data: '{tensp:' + $(this).attr("data-info") + ',soluong:""}',
                    url: "Index.aspx/LoadUserControl",
                    success: function (data) {
                       $("#load").load(location.href + " #load");

                        $(".alert").addClass("activealert");
                        $(".alert").text("Đặt thành công!");
                        $(".alert").css("background", "#b2cea7")

                        setTimeout(function () {
                            $(".alert").removeClass("activealert");
                        }, 3000);
                    },
                    error: function (msg) {
                        alert("no");
                    }
                });

            });
        });
    </script>
    <div class="content">
        <div class="news_products">
            <div class="head_categorys">
                <span><%=Page.RouteData.Values["producer"].ToString()%></span>
                
            </div>
            <div class="list_categorys">
                <%foreach (var item in getlistProduct())
                    { %>
                <div class="box1">
                    <div class="icon">
                        <a href="<%=Page.GetRouteUrl("prev", new { id = item.TenSP }) %>">
                            <span >Chi tiết</span>
                            <img src="<%=item.HinhAnhDaiDien %>" alt="">
                        </a>
                    </div>

                    <div class="content">
                        <h3><%=item.TenSP %></h3>
                        <p>
                            <%=item.TomTat %>
                        </p>
                        <span><%=string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"), "{0:c}", item.DonGia) %></span>
                        <a data-info="<%=item.MaSP %>" style="cursor: pointer">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>
                    <span class="name"><%=item.TenSP %> </span>
                </div>
                <%} %>
            </div>
        </div>
        <div class="clear"></div>
        <%if (WebNangCaoNhom5.App_Start.PageList.totalPage > 1)



            {
                int totalPage = WebNangCaoNhom5.App_Start.PageList.totalPage;
                int maxPage = WebNangCaoNhom5.App_Start.PageList.maxPage;
                int currntPage = WebNangCaoNhom5.App_Start.PageList.pageIndex;
                var endPageIndex = Math.Min(totalPage, currntPage + maxPage / 2);
                var startPageIndex = Math.Max(1, currntPage - maxPage / 2);
                %>
        <div class="pagination">


            <ul>
                <%if (WebNangCaoNhom5.App_Start.PageList.pageIndex > 1) {%>                  
                <li>
                    <a href="/<%=Page.RouteData.Values["producer"].ToString() %>?page=1"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
                <li><a href="/<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=WebNangCaoNhom5.App_Start.PageList.pageIndex-1 %>"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                <%} %>


                <%for (int i = startPageIndex; i <= endPageIndex; i++)
                    {
                        if (i == WebNangCaoNhom5.App_Start.PageList.pageIndex)
                        {
                %>
                <li>
                    <a href="/<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=i %>" class="active"><%=i %></a>
                </li>
                <%}
                else
                {%>
                <li>
                    <a href="/<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=i %>"><%=i %></a>
                </li>
                <% }
                } %>
                <%if (WebNangCaoNhom5.App_Start.PageList.pageIndex < WebNangCaoNhom5.App_Start.PageList.totalPage)
                    {%>
                <li>
                    <a href="/<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=WebNangCaoNhom5.App_Start.PageList.pageIndex+1 %>""><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                </li>
                <li>
                    <a href="/<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=WebNangCaoNhom5.App_Start.PageList.totalPage %>""><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                </li>
                <%} %>
            </ul>

        </div>
             <%}
            else
            {%>
        <span>Không có sản phẩm nào</span>
        <%} %>
    </div>

</asp:Content>