<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebNangCaoNhom5.Carts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">

    <div class="content">
        <%
            if (getCarts() != null)
            {%>
        <div class="list_cart">
            <table class="table">
                <thead>
                    <tr>
                        <td>Hình ảnh</td>
                        <td>Tên sản phẩm</td>
                        <td>Đơn giá</td>
                        <td>Số lượng</td>
                        <td>Thành tiền</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <%
                        decimal total = 0;
                        foreach (var item in getCarts())
                        {
                            total += item.TongTien;
                    %>
                    <tr>
                        <td><a href="<%=Page.GetRouteUrl("prev", new { id = item.SP.MaSP }) %>">
                            <img src="<%=item.SP.HinhAnhDaiDien%>" alt="">
                        </a>
                        </td>
                        <td><a href="<%=Page.GetRouteUrl("prev", new { id = item.SP.MaSP }) %>"><%=item.SP.TenSP %></a></td>
                        <td class="price"><%=string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"),"{0:c}",item.SP.DonGia) %></td>
                        <td>
                            <div>
                                <span><%=item.soLuong %></span>
                            </div>
                        </td>
                        <td class="total"><%=string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"),"{0:c}",item.SP.DonGia*item.soLuong) %></td>
                        <td>
                            <a style="cursor: pointer" data-product="<%=item.SP.MaSP %>" class="remove">
                                <i class="fa fa-times" aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>           
            <div class="total_price">
                Tổng thành tiền: <span id="totalpay"><%=string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"),"{0:c}",total) %></span>
            </div>
        </div>
        <div class="info_pay">
            <div class="contact">
                <h3>Thông tin mua hàng</h3>
                <form id="form">                 
                    Họ và tên*
                    <input required type="text" name="" id="name">
                    Số điện thoại*
                    <input required type="text" id="phone">
                    Email *
                    <input required type="text" name="" id="email">
                    Địa chỉ *
                    <input required type="text" name="" id="address">
                   
                    <input id="submitButton" type="button" value="Gửi">
                </form>
              
            </div>
        </div>
        <%}
            else
            {%>
        <img style="position: absolute; left: 50%; font-size: 20px; transform: translateX(-50%)" src="Asset/Client/image/icons8-sad-80.png" />
        <p style="position: absolute; left: 50%; margin-top: 90px; font-size: 20px; transform: translateX(-50%)">Giỏ hàng rỗng</p>
        <%} %>
    </div>
    <script src="Asset/Client/js/Cart.js"></script>
</asp:Content>
