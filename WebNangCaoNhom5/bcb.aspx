<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bcb.aspx.cs" Inherits="WebNangCaoNhom5.bcb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Asset/Admin/js/Plugin/ckfinder/ckfinder.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <textarea id="txt" readonly="readonly" onclick="openKCFinder_multipleFiles()"></textarea>
            <a id="txt1">abc</a>
            <script type="text/javascript">

                function openKCFinder_multipleFiles() {
                    window.KCFinder = {};
                    window.KCFinder.callBackMultiple = function (files) {
                        for (var i; i < files.length; i++) {
                            alert(files[i]);
                        }
                        window.KCFinder = null;
                    };
                    window.open('/kcfinder/browse.php', 'kcfinder_multiple');
                }
            </script>

        </div>
    </form>
</body>
</html>
