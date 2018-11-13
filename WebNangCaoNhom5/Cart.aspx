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
                        <td><a href="<%=Page.GetRouteUrl("prev", new { id = item.SP.TenSP }) %>">
                            <img src="<%=item.SP.HinhAnhDaiDien%>" alt="">
                        </a>
                        </td>
                        <td><a href="<%=Page.GetRouteUrl("prev", new { id = item.SP.TenSP }) %>"><%=item.SP.TenSP %></a></td>
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

            <script>
                $(function () {
                    const formatter = new Intl.NumberFormat('vi-VN', {
                        style: 'currency',
                        currency: 'VND',
                        minimumFractionDigits: 2
                    });

                    $(".minus").click(function () {
                        var quti = $(this).next("span").text();

                        var tdprice = $(this).parent(".quti").parent("td").prev("td").text();


                        if (quti > 0) {
                            $(this).next("span").text(--quti);

                            var result = quti * parseFloat(tdprice, 10);




                            $(this).parent(".quti").parent("td").next("td").text(formatter.format(result));
                            refeshtotalprice();
                        }
                    });
                    $(".plus").click(function () {
                        var quti = $(this).prev("span").text();

                        var tdprice = $(this).parent(".quti").parent("td").prev("td").text();

                        // var x = document.getElementById("quati").innerHTML;
                        if (quti < 50) {
                            $(this).prev("span").text(++quti);

                            var result = quti * parseFloat(tdprice, 10);




                            $(this).parent(".quti").parent("td").next("td").text(formatter.format(result));

                            refeshtotalprice();
                        }



                    });


                    function refeshtotalprice() {
                        var result = 0;
                        $(".table").find(".total").each(function () {
                            result += parseFloat($(this).text(), 20);

                        });
                        $("#totalpay").text(result);

                    }

                });
                $("a.remove").click(function () {


                    $.ajax({
                        type: "post",
                        url: "Cart.aspx/removeItem",
                        data: '{masp:' + parseInt($(this).attr("data-product")) + '}',
                        contentType: "application/json; charset=utf-8",


                        success: function (data) {
                            window.location.reload();
                        },
                        error: function (msg) {
                            alert("Erro Something");
                        }
                    });
                });
            </script>
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
                <script>
                    $(function () {
                        $("input").keydown(function (e) {
                            if (e.keyCode == 13)
                                $('#submitButton').click();
                        });
                        $('#submitButton').click(function () {
                            var emailCheck = new RegExp('^[a-z][a-z0-9%_\.]{3,32}@[a-z0-9]{3,}(\.[a-z]{3,4}){1,2}$');
                            var phoneCheck = new RegExp('\\b(01|09)[2|6|8|9]+[0-9]{6,8}\\b');
                            if ($("#name").val().trim() == "") {
                                alert("Tên trống");
                                return;
                            }
                             if ($("#address").val().trim() == "") {
                                alert("Địa chỉ trống");
                                return;
                            }
                            
                            if (!phoneCheck.test($("#phone").val())) {
                                alert("Số điện thoại sai!");
                                return;
                            }
                            if (!emailCheck.test($("#email").val()) ) {
                               
                                alert("Email sai!");
                                return;
                            }
                              
                            else {
                                $.ajax({
                                    url: 'Cart.aspx/CartProcess',
                                    type: 'post',
                                    contentType: "application/json",
                                    dataType: 'json',
                                    data: $('form#form').serialize(),
                                    success: function (data) {

                                        setTimeout(alert(data.d), 2000);
                                        window.location.reload();
                                    },
                                    error: function (msg) {
                                        alert("Something Wrong!!");
                                    }
                                });
                            }
                        });
                    });
                </script>
            </div>
        </div>
        <%}
            else
            {%>
        <img style="position: absolute; left: 50%; font-size: 20px; transform: translateX(-50%)" src="Asset/Client/image/icons8-sad-80.png" />
        <p style="position: absolute; left: 50%; margin-top: 90px; font-size: 20px; transform: translateX(-50%)">Giỏ hàng rỗng</p>
        <%} %>
    </div>

</asp:Content>
