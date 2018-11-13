<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebNangCaoNhom5.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
   
    <div class="content">
        <%if (GetProductByKeyword().Count > 0)
            {%>
        Kết quả tìm kiếm với từ khóa "<%=Request.QueryString["keyword"] %>"
         <div class="news_products">
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
                        alert("Something Wrong");
                    }
                });

            });
                 });
             </script>
       <div class="list_categorys">
                <%foreach (var item in GetProductByKeyword())
                    { %>
                <div class="box1">
                    <div class="icon">
                        <a href="/dtdd--<%=item.TenSP %>">
                            <img src="<%=item.HinhAnhDaiDien %>" alt="">
                        </a>
                    </div>

                    <div class="content">
                        <h3><%=item.TenSP %></h3>
                        <p>
                            <%=item.TomTat %>
                        </p>
                        <span><%=item.DonGia %></span>
                        <a href="#" data-info="<%=item.MaSP %>">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>

                </div>
               <%}
                   }
                   else
                   {%>
           Không có kết quả nào phù hợp với từ khóa "<%=Request.QueryString["keyword"] %>"
            <%}%>
            </div>
             </div>
    </div>
</asp:Content>
