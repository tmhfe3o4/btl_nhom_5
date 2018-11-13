<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebNangCaoNhom5.Admin.Login" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">


    <title>Đăng nhập</title>

    <!-- Bootstrap Core CSS -->
    <link href="../Asset/Admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../Asset/Admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../Asset/Admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../Asset/Admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>



    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Đăng nhập</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" runat="server">
                             <asp:ScriptManager  runat="server" ID="scriplogin"></asp:ScriptManager>
                            <asp:UpdatePanel runat="server" ID="panelLogin">
                                <ContentTemplate>
                            
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" runat="server" placeholder="E-mail" id="email" type="email" autofocus>

                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="email" ErrorMessage="Email trống" />
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="email" ValidationExpression="^[a-z][a-z0-9%_\.]{3,32}@[a-z0-9]{3,}(\.[a-z]{3,4}){1,2}$" ErrorMessage="Email không hợp lệ"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" runat="server" placeholder="Password" id="password" type="password" value="">
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="password" ErrorMessage="Mật khẩu trống" />
                                    </div>


                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button runat="server" OnClick="Unnamed_ServerClick" CssClass="btn btn-lg btn-success btn-block" Text="Đăng nhập" />
                            </fieldset>

                                                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../Asset/Admin/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../Asset/Admin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../Asset/Admin/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../Asset/Admin/dist/js/sb-admin-2.js"></script>

</body>

</html>
