$(function () {
    //Room picture
    $(".image_detail").mousemove(function () {
        $("#result").removeClass("hide");
        $("#cut").removeClass("hide");
        imageZoom("imageid", "result");
    });

    $(".image_detail").mouseout(function () {
        $("#result").addClass("hide");
        $("#cut").addClass("hide");
    });

    function imageZoom(imgID, resultID) {
        var img, lens, result, cx, cy;
        img = document.getElementById(imgID);
        result = document.getElementById(resultID);

        lens = document.getElementById("cut");

        cx = result.offsetWidth / lens.offsetWidth;
        cy = result.offsetHeight / lens.offsetHeight;

        result.style.backgroundImage = "url('" + img.src + "')";
        result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";

        lens.addEventListener("mousemove", moveLens);
        img.addEventListener("mousemove", moveLens);

        lens.addEventListener("touchmove", moveLens);
        img.addEventListener("touchmove", moveLens);
        function moveLens(e) {
            var pos, x, y;

            e.preventDefault();

            pos = getCursorPos(e);

            x = pos.x - (lens.offsetWidth / 2);
            y = pos.y - (lens.offsetHeight / 2);

            if (x > img.width - lens.offsetWidth) { x = img.width - lens.offsetWidth; }
            if (x < 0) { x = 0; }
            if (y > img.height - lens.offsetHeight) { y = img.height - lens.offsetHeight; }
            if (y < 0) { y = 0; }

            lens.style.left = x + "px";
            lens.style.top = y + "px";

            result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
        }
        function getCursorPos(e) {
            var a, x = 0, y = 0;
            e = e || window.event;

            a = img.getBoundingClientRect();

            x = e.pageX - a.left;
            y = e.pageY - a.top;

            x = x - window.pageXOffset;
            y = y - window.pageYOffset;
            return { x: x, y: y };
        }
    }
    //Next Slide
    $("#btnnext").click(function () {
        var x = $(".inner_wraper").css("left");
        if ((parseInt(x, 10) * -1 + 301) < parseInt($(".inner_wraper").css("width"), 10))
            $(".inner_wraper").css("left", "calc(" + x + " - 100px" + ")");
    });
    //Pre Slide
    $("#btnpre").click(function () {
        var x = $(".inner_wraper").css("left");
        if (parseInt(x, 10) < 0)
            $(".inner_wraper").css("left", "calc(" + x + " + 100px" + ")");
    });
    //modyfi src inner_wrapper
    $(".inner_wraper .slider img").click(function () {
        $(".image_detail img").attr("src", $(this).attr("src"));
    });
    //Add to Cart
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
    $("#minus").click(function () {
        var x = document.getElementById("quati").innerHTML;
        if (x > 1) {
            document.getElementById("quati").innerHTML = --x;
        }
    });
    $("#plus").click(function () {
        var x = document.getElementById("quati").innerHTML;
        if (x < 50)
            document.getElementById("quati").innerHTML = ++x;
    });
    //Add cart of list product
    $(".addcart").click(function () {
        if ($("#quati").text() == 0 || isNaN($("#quati").text()) || $("#quati").text() < 0) {
            $(".alert").addClass("activealert");
            $(".alert").text("Vui lòng nhập số lượng");
            $(".alert").css("background", "#f44336")
            setTimeout(function () {
                $(".alert").removeClass("activealert");
            }, 3000);
        }
        else {
            $.ajax({
                type: "post",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: '{tensp:' + $(this).attr("data-info") + ',soluong:' + parseInt($("#quati").text()) + '}',
                url: "Index.aspx/LoadUserControl",
                success: function (data) {
                    $("#load").load(location.href + " #load");
                    $("html, body").animate({ scrollTop: 0 }, "slow");
                    $(".alert").addClass("activealert");
                    $(".alert").text("Đặt thành công!");
                    $(".alert").css("background", "#b2cea7")
                    setTimeout(function () {
                        $(".alert").removeClass("activealert");
                    }, 3000);
                },
                error: function (msg) {
                    alert("Something Erro");
                }
            });
        }
    });
});