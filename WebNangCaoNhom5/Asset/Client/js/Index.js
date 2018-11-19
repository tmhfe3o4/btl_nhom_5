//Auto Slide

$(function () {
    var autoslide = setInterval(function () {
        if ($(".slide ul li.active").is("li:last")) {

            $(".slide ul li").last("li").removeClass("active");
            $(".slide ul li").first("li").addClass("active");
        }
        else {
            $(".slide ul li.active").next("li").addClass("active");
            $(".slide ul li.active").prev("li").removeClass("active");
        }
    }, 3000);
    $(".menunav ul li").find("a").each(function () {
        $(this).removeClass("active");
    });
    $("#menunav ul li a .icon  ").find(".fa-home").each(function () {
        $(this).parent(".icon").parent("a").addClass("active");
    });
    //Add to Cart
    $(".list_categorys .content a.order").click(function () {
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
    //Mouse to set Slide
    $(".slide li").mousemove(function () {
        clearInterval(autoslide);
        $(".slide ul").find("li").each(function () {
            $(this).removeClass("active");
        });
        $(this).addClass("active");
    }).mouseout(function () {
        autoslide = setInterval(function () {
            if ($(".slide ul li.active").is("li:last")) {
                $(".slide ul li").last("li").removeClass("active");
                $(".slide ul li").first("li").addClass("active");
            }
            else {
                $(".slide ul li.active").next("li").addClass("active");
                $(".slide ul li.active").prev("li").removeClass("active");
            }
        }, 3000);
    });
});