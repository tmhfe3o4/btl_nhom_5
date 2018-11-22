<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftMenu.ascx.cs" Inherits="WebNangCaoNhom5.Admin.UserControl.LeftMenu" %>
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">

            <li>
                <a href="/Admin/ListProductAdmin.aspx"><i class="fa fa-dashboard fa-fw"></i>Danh sách sản phẩm</a>
            </li>
            <li>
                <a href="/Admin/CreateProduct.aspx"><i class="fa fa-bar-chart-o fa-fw"></i>Thêm sản phẩm</a>

                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="#" id="btnRegister">Thêm user</a>
            </li>

        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>

