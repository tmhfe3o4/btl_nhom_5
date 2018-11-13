$(function () {
    //Add Cart
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
                alert("no");
            }
        });
    });
});