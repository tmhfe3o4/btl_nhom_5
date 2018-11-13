<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="ListProductAdmin.aspx.cs" Inherits="WebNangCaoNhom5.Admin.ListProductAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageWraper" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Danh sách sản phẩm</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body" data-ng-app="myapp" data-ng-controller="getproduct">
                    <div style="display: flex; float: left">
                        <label style="font-weight: normal">
                            Hiện theo
                            <select class="select" data-ng-model="Row">
                                <option data-ng-repeat="num in Rows" value="{{num.num}}" >{{num.num}}</option>
                                <option value="">Tất cả</option>
                            </select>
                            sản phẩm</label>
                    </div>
                    <div style="display: flex; float: left; margin-left: 20px">
                        <label style="font-weight: normal">
                            Nhà sản xuất
                            <select id="nsx" class="select" data-ng-model="Select.maNSX">
                                <option data-ng-repeat="nsx in NSX" value="{{nsx.maNSX}}">{{nsx.tenNSX}}</option>
                                 <option value="">Tất cả</option>
                            </select>
                        </label>
                    </div>
                    <div style="display: flex; margin-left: 70%">
                        <label style="font-weight: normal">
                            Tìm kiếm 
                            <input type="text" placeholder="Search" data-ng-model="Search<%--.masp--%>" class="seacrh" />
                        </label>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="mytable">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Tên sản phẩm</th>
                                <th>Đơn giá</th>
                                <th>Số lượng tồn</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-ng-repeat="sp in SP |limitTo:Row | filter:Search|filter:Select ">
                                <td>
                                    <a href="/chinh-sua/{{sp.masp}}">Sửa</a>
                                    <a data-ng-click="click(sp.masp)" style="cursor: pointer" class="btnxoa">Xóa</a>
                                    <a id="btnimage" style="cursor: pointer;" data-id="{{sp.masp}}" data-ng-click="EdtImg(sp.masp)">Quản lý ảnh</a>
                                </td>
                                <td>{{sp.tensp}}</td>
                                <td>{{sp.dongia}}</td>
                                <td>{{sp.soluong}}</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="border: none">
                                    <h5 class="modal-title" id="exampleModalLabel">Quản lý ảnh</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="imageList" style="margin: 5px 5px">
                                    </div>
                                    <input type="button" style="margin: 10px 10px;" id="btnFinder" value="Chọn ảnh" class="btn btn-primary" />
                                </div>
                                <div class="modal-footer" style="border: none">
                                    <button type="button" class="btn btn-secondary" id="btnHide" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" data-ng-click="Update()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <!-- Modal -->
    <script src="../Asset/Admin/js/ManaGerProduct.js"></script>
    <link href="../Asset/Admin/dist/css/ManagerProduct.css" rel="stylesheet" />
</asp:Content>
