$(function () {
    $("input:file").attr("accept", "image/x-png,image/gif,image/jpeg");
    function checkSubmit() {
        return true;
    };
    $("#PageWraper_anhlienquan").click(function () {
        var finder = new CKFinder();
        finder.selectActionFunction = function (fileUrl, file, files) {
            var src = "";
            for (var i = 0; i < files.length; i++) {
                if (files[i]["url"]) {
                    src += files[i]["url"] + "\n";
                }
            }
            $("#PageWraper_anhlienquan").text(src);
        };
        finder.popup();
    });
    $("#PageWraper_anhdaidien").click(function () {
        var finder = new CKFinder();
        finder.selectActionFunction = function (fileUrl, file, files) {
            for (var i = 0; i < files.length; i++)
                $("#PageWraper_anhdaidien").text(files[i].url);
        };
        finder.popup();
    });
});