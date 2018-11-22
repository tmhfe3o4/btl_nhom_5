<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="ListProduct.aspx.cs" Inherits="WebNangCaoNhom5.ListProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <%if (getlistProduct().Count > 1)
          { %>

                
               
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
                        <a href="<%=Page.GetRouteUrl("prev", new { id = item.MaSP }) %>">
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
                <%if (WebNangCaoNhom5.App_Start.PageList.pageIndex > 1)
                    {%>                  
                <li>
                    <a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=1"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
                <li><a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=WebNangCaoNhom5.App_Start.PageList.pageIndex - 1 %>"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                <%} %>
                <%for (int i = startPageIndex; i <= endPageIndex; i++)
                    {
                        if (i == WebNangCaoNhom5.App_Start.PageList.pageIndex)
                        {
                %>
                <li>
                    <a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=i %>" class="active"><%=i %></a>
                </li>
                <%}
                    else
                    {%>
                <li>
                    <a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=i %>"><%=i %></a>
                </li>
                <% }
                    } %>
                <%if (WebNangCaoNhom5.App_Start.PageList.pageIndex < WebNangCaoNhom5.App_Start.PageList.totalPage)
                    {%>
                <li>
                    <a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=WebNangCaoNhom5.App_Start.PageList.pageIndex + 1 %>""><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                </li>
                <li>
                    <a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=WebNangCaoNhom5.App_Start.PageList.totalPage %>""><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                </li>
                <%} %>
            </ul>
        </div>
             <%}%>

                
    </div>
    <%}  else
                 {%>
        <span style="margin-top: 40px;position: absolute;">Không có sản phẩm nào</span>
        <%} %>
    <script src="Asset/Client/js/ListProduct.js"></script>
    <%--  <script>
          $(function () {
              $("#sort").change(function () {
                  var s = $(this).attr("name");
                  console.log(s);
                  if ($(this).attr("name") == "")
                      window.location.href = "/san-pham--" + $("#producer").text() + "?page=1&sort=" + $(this).val() + "";

                  else
                      window.location.href = "/san-pham--" + $("#producer").text() + "?page=" + $(this).attr("name") + "&sort=" + $(this).val() + "";
              });
              var url = new URLSearchParams(window.location.search);
              var value = url.get("sort");
              if (value != null)
                  $("#sort").val(value);
          });
    </script>   
    <select id="sort" name="<%=Request.QueryString["page"]+"" %>">        
        <option value="1">Ngày đăng</option>
        <option value="2">Tên sản phẩm</option>
        <option value="3">Giá</option>
    </select>  
      <%if (getlistProduct().Count > 1)
          { %>            
    <div class="content">
        <div class="news_products">
            <div class="head_categorys">
                <span id="producer"><%=Page.RouteData.Values["producer"].ToString()%></span>            
            </div>          
            <div class="list_categorys">
                <%foreach (var item in getlistProduct())
                    { %>
                <div class="box1">
                    <div class="icon">
                        <a href="<%=Page.GetRouteUrl("prev", new { id = item.MaSP }) %>">
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
                <%if (WebNangCaoNhom5.App_Start.PageList.pageIndex > 1)
                    {%>                  
                <li>
                    <a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=1&sort=<%=Request.QueryString["sort"] %>"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
                <li><a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=WebNangCaoNhom5.App_Start.PageList.pageIndex - 1 %>&sort=<%=Request.QueryString["sort"] %>"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                <%} %>
                <%for (int i = startPageIndex; i <= endPageIndex; i++)
                    {
                        if (i == WebNangCaoNhom5.App_Start.PageList.pageIndex)
                        {
                %>
                <li>
                    <a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=i %>&sort=<%=Request.QueryString["sort"] %>" class="active"><%=i %></a>
                </li>
                <%}
                    else
                    {%>
                <li>
                    <a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=i %>&sort=<%=Request.QueryString["sort"] %>"><%=i %></a>
                </li>
                <% }
                    } %>
                <%if (WebNangCaoNhom5.App_Start.PageList.pageIndex < WebNangCaoNhom5.App_Start.PageList.totalPage)
                    {%>
                <li>
                    <a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=WebNangCaoNhom5.App_Start.PageList.pageIndex + 1 %>&sort=<%=Request.QueryString["sort"] %>"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                </li>
                <li>
                    <a href="/san-pham--<%=Page.RouteData.Values["producer"].ToString() %>?page=<%=WebNangCaoNhom5.App_Start.PageList.totalPage %>&sort=<%=Request.QueryString["sort"] %>"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                </li>
                <%} %>
            </ul>
        </div>
             <%}%>

                
    </div>
    <%}
        else
        {%>
        <span style="margin-top: 40px;position: absolute;">Không có sản phẩm nào</span>
        <%} %>
    <script src="Asset/Client/js/ListProduct.js"></script>--%>
</asp:Content>
