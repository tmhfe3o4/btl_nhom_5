<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="WebNangCaoNhom5.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <script>
        $(function () {
            $(".menunav ul li").find("a").each(function () {
                $(this).removeClass("active");
            });
            $("#menunav ul li a .icon  ").find(".fa-newspaper-o").each(function () {
                $(this).parent(".icon").parent("a").addClass("active");
            });

        });
    </script>
    <div class="content">
        <div class="top_news">
            <div class="left_top_news">
                <div class="img">
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                    </a>
                </div>

                <span><a href="#">Tiêu đề tin tức</a></span>
            </div>
            <div class="right_top_news">
                <div class="item_of_4">
                    <div class="img">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                    </div>

                    <span><a href="#">Tiêu đề tin tức</a></span>
                </div>
                <div class="item_of_4">
                    <div class="img">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                    </div>
                    <span><a href="#">Tiêu đề tin tức</a></span>
                </div>
                <div class="item_of_4">
                    <div class="img">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                    </div>
                    <span><a href="#">Tiêu đề tin tức</a></span>
                </div>
                <div class="item_of_4">
                    <div class="img">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                    </div>
                    <span><a href="#">Tiêu đề tin tức</a></span>
                </div>
            </div>
        </div>
        <div class="list_news">
            <div class="row">
                <div class="left">
                    <a href="#" class="im">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                    </a>
                </div>


                <div class="info_news">
                    <a href="#">Thông tin chi tiết</a>
                    <p>20-20-2018</p>
                </div>
            </div>
            <div class="row">
                <div class="left">
                    <a href="#" class="im">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                    </a>
                </div>


                <div class="info_news">
                    <a href="#">Thông tin chi tiết</a>
                    <p>20-20-2018</p>
                </div>
            </div>
            <div class="row">
                <div class="left">
                    <a href="#" class="im">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                    </a>
                </div>


                <div class="info_news">
                    <a href="#">Thông tin chi tiết</a>
                    <p>20-20-2018</p>
                </div>
            </div>
        </div>
        <div class="pagination">
            <ul>
                <li>
                    <a href="#"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                <%for (int i = 1; i <= WebNangCaoNhom5.App_Start.PageList.totalPage; i++)
                    { %>
                <li>
                    <a href="#" class="active"><%=i %></a>
                </li>
                <%} %>
                <li>
                    <a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
