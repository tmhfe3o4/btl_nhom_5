<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenu.ascx.cs" Inherits="WebNangCaoNhom5.Admin.UserControl.TopMenu" %>

<ul class="nav navbar-top-links navbar-right">
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-user">

            <li class="divider"></li>

            <li>
                <a runat="server" onserverclick="Unnamed_ServerClick" ><i class="fa fa-sign-out fa-fw"></i> Logout</a>
            </li>
        </ul>
        <!-- /.dropdown-user -->
    </li>
    <!-- /.dropdown -->
</ul>
