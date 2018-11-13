<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Category.ascx.cs" Inherits="WebNangCaoNhom5.UserControl.Category" %>
 <div class="category">
            <button id="btnHide">Danh mục</button>
            <div class="dropdown">
                <ul id="category" class="active">
                    <% foreach (var item in getProducer()){
                    %>
                    <li><a href="<%=Page.GetRouteUrl("product",new { producer=item.TenNSX}) %>"><%=item.TenNSX %></a></li>
                    <%} %>
                    <%--<li><a href="#">Item 2</a></li>
                    <li><a href="#">Item 3</a></li>
                    <li><a href="#">Item 4</a></li>
                    <li><a href="#">Item 5</a></li>
                    <li><a href="#">Item 6</a></li>
                    <li><a href="#">Item 7</a></li>
                    <li><a href="#">Item 7</a></li>--%>
                </ul>
                <script>
                    $("#btnHide").click(function () {
                        $("#category").toggleClass("active");
                    });
                </script>
            </div>

        </div>