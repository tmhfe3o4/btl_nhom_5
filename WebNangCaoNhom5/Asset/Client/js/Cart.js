//Remove item in Cart
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
        if (!emailCheck.test($("#email").val())) {

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
    const formatter = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
        minimumFractionDigits: 2
    });
    //Tăng giảm số lượng<Đã giấu code>
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