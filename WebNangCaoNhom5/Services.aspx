<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="WebNangCaoNhom5.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <script>
        $(function () {
            $(".menunav ul li").find("a").each(function () {
                $(this).removeClass("active");
            });
            $("#menunav ul li a .icon  ").find(".fa-cogs").each(function () {
                $(this).parent(".icon").parent("a").addClass("active");
            });

        });
    </script>
     <div class="content">

        <div class="box_services">
            <div class="item">
                <div class="icon">
                    <i class="fa fa-truck" aria-hidden="true"></i>
                </div>

                <div class="detail_item">
                    Đội ngũ vận chuyển nhiệt tình
                </div>
            </div>
            <div class="item">
                <div class="icon">
                    <i class="fa fa-refresh" aria-hidden="true"></i>
                </div>
                <div class="detail_item">
                    Chính sách <b> 1 đổi 1</b> trong 12 tháng chuẩn Apple Store
                </div>
            </div>
            <div class="item">
                <div class="icon">
                    <i class="fa fa-gift" aria-hidden="true"></i>
                </div>
                <div class="detail_item">
                    Tặng full bộ phụ kiện kèm máy khi mua hàng
                </div>
            </div>
            <div class="item">
                <div class="icon">
                    <i class="fa fa-shirtsinbulk" aria-hidden="true"></i>
                </div>
                <div class="detail_item">
                    Bảo Hành Vàng cả nguồn, màn hình, vân tay không tốn thêm tiền mua
                </div>
            </div>
            <div class="item">
                <div class="icon">
                    <i class="fa fa-shield" aria-hidden="true"></i>
                </div>
                <div class="detail_item">
                    Thông tin khách hàng luôn được bảo mật
                </div>
            </div>
            <div class="item">
                <div class="icon">
                    <i class="fa fa-money" aria-hidden="true"></i>
                </div>
                <div class="detail_item">
                    Hỗ trợ trả góp khi mua tại cửa hàng HIPHONE
                </div>
            </div>

        </div>
    </div>
</asp:Content>
