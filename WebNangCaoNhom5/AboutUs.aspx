<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="WebNangCaoNhom5.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <script>
        $(function () {
            $(".menunav ul li").find("a").each(function () {
                $(this).removeClass("active");
            });
            $("#menunav ul li a .icon  ").find(".fa-users").each(function () {
                $(this).parent(".icon").parent("a").addClass("active");
            });

        });
    </script>
    <div class="content">
        <div class="time_line">
            <ul>
                <li>
                    <div class="image">
                        <img src="Asset/Client/image/ngoc.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>Lê Hồng Ngọc</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s, when an unknown printer took
                            a galley of type and scrambled it to make a type specimen book. It has survived not only
                            five centuries, but also the leap into electronic typesetting, remaining essentially
                            unchanged.</p>
                    </div>
                    <div class="time">
                        <h4>22-04-1997</h4>
                    </div>
                </li>
                <li>
                    <div class="image">
                        <img src="Asset/Client/image/tughe.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>Nguyễn Anh Tú</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s, when an unknown printer took
                            a galley of type and scrambled it to make a type specimen book. It has survived not only
                            five centuries, but also the leap into electronic typesetting, remaining essentially
                            unchanged.</p>
                    </div>
                    <div class="time">
                        <h4>07-06-1996</h4>
                    </div>
                </li>
                <li>
                    <div class="image">
                        <img src="Asset/Client/image/hung.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>Trần Mạnh Hùng</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s, when an unknown printer took
                            a galley of type and scrambled it to make a type specimen book. It has survived not only
                            five centuries, but also the leap into electronic typesetting, remaining essentially
                            unchanged.</p>
                    </div>
                    <div class="time">
                        <h4>27-03-1997</h4>
                    </div>
                </li>

            </ul>
        </div>
        <div class="box_info">

        </div>
        <div class="box_info">

        </div>
    </div>
</asp:Content>
