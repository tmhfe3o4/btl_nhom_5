<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="login_register.aspx.cs" Inherits="WebNangCaoNhom5.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <div>
        <p id="notify"></p>
    </div>
    <div ID="formlogin"style="width: 100%; clear: both; margin: 20px;">
        <form runat="server" style="height: 100px; padding-top: 30px;">
            <table style="width: 50%; float: left;">
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Tên đăng nhập"></asp:Label>
                    </td>
                    <td>
                        <input runat="server" type="text" ID="namelogin" style="border-radius: 0;"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Mật khẩu"></asp:Label>
                    </td>
                    <td>
                        <input runat="server" type="password" id="password" style="border-radius: 0;"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button type="button" runat="server" OnClientClick="signin" Text="Đăng nhập" OnClick="signin" />
                    </td>
                </tr>
            </table>
            <table style="width: 50%; float: left;">
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Tên đăng nhập"></asp:Label>
                    </td>
                    <td>
                        <input runat="server" type="text" ID="nameregister" style="border-radius: 0;"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Nhập mật khẩu"></asp:Label>
                    </td>
                    <td>
                        <input runat="server" type="password" id="password1"></input>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Nhập lại mật khẩu"></asp:Label>
                    </td>
                    <td>
                        <input runat="server" type="password" id="password11"></input>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button type="button" runat="server" OnClientClick="" Text="Đăng ký ngay" OnClick="register"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</asp:Content>
