$(function () {
    $("input:file").attr("accept", "image/x-png,image/gif,image/jpeg");
    function check() {
        return true;
    };
    //Popup finder
    $("#PageWraper_anhdaidien").click(function () {
        var finder = new CKFinder();
        finder.selectActionFunction = function (fileUrl, file, files) {
            for (var i = 0; i < files.length; i++)
                $("#PageWraper_anhdaidien").text(files[i].url);
        };
        finder.popup();
    });
});
