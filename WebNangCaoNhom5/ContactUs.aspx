<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="WebNangCaoNhom5.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <script>
        $(function () {
            $(".menunav ul li").find("a").each(function () {
                $(this).removeClass("active");
            });
            $("#menunav ul li a .icon  ").find(".fa-envelope").each(function () {
                $(this).parent(".icon").parent("a").addClass("active");
            });

        });
    </script>
    <div class="content">
        <div class="contact">
            <h3>Thông tin liên hệ</h3>
            <form id="form">

                Tiêu đề * <input type="text" name="" id="">
                Nội dung * <textarea name="" id="" cols="30" rows="10"></textarea>
                Họ và tên * <input type="text" name="" id="">
                Email <input type="text" name="" id="">
                Số điện thoại <input type="text" name="" id="">

                <input type="submit" value="Gửi">
            </form>
        </div>
    </div>
</asp:Content>
