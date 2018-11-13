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
                <script>
                    var app = angular.module('myapp', []);
                    app.controller('getproduct', mycontrol);
                    mycontrol.$inject = ['$scope', '$http'];
                    function mycontrol($scope, $http, $route) {

                        $http.get("/WebService.asmx/getlistProduct").then(function (response) {
                            $scope.SP = response.data;
                        });
                        $http.get("/WebService.asmx/getlistProducer").then(function (response) {
                            $scope.NSX = response.data;
                        });
                        $scope.Row = 10;
                        $scope.click = function (id) {
                            if (confirm("Bạn có muốn xóa sản phẩm này?") == true) {
                                $http.post('/WebService.asmx/deleteProduct', { id: parseInt(id) })
                                    .then(function () {
                                        $http.get("/WebService.asmx/getlistProduct").then(function (response) {
                                            $scope.SP = response.data;
                                        });
                                        $http.get("/WebService.asmx/getlistProducer").then(function (response) {
                                            $scope.NSX = response.data;
                                        });
                                        alert("Xóa thành công");
                                    })
                                    .error(function () {
                                    });
                            }
                        };
                        $scope.EdtImg = function (id) {
                            $("#exampleModal").modal("show");
                            var html = "";
                            $http.post("/WebService.asmx/getImage", { id: id }).then(function (response) {

                                var lst = response.data.d;

                                var newl = lst.toString().split(',');

                                for (i in lst) {
                                    html += '<div style="width:115px;float:left;margin:4px 4px;border:1px solid rgba(0,0,0,.2)"><img width="100" src="' + lst[i] + '" "/><a href="#" class="btnDel"><i class="fa fa-times"></i></a></div>';
                                };
                                $(".imageList").html(html);
                                $(".btnDel").off("click").on("click", function (e) {
                                    e.preventDefault();
                                    $(this).parent().remove();
                                });

                            });
                            $("#btnHide").val(id);
                        };
                        $scope.Update = function () {

                            var image = [];
                            $.each($(".imageList img"), function (i, item) {
                                image.push($(item).attr("src"));
                            });
                            $http.post('/WebService.asmx/UpdateImage', { id: $("#btnHide").val(), imageSrc: image })
                                .then(function () {
                                    $http.get("/WebService.asmx/getlistProduct").then(function (response) {
                                        $scope.SP = response.data;
                                    });
                                    $http.get("/WebService.asmx/getlistProducer").then(function (response) {
                                        $scope.NSX = response.data;
                                    });
                                    $("#exampleModal").modal("hide");
                                })
                                .error(function () {
                                });
                        };
                    };
                    $(function () {
                        $("#btnFinder").off("click").on("click", function (e) {
                            e.preventDefault();
                            var finder = new CKFinder();
                            finder.selectActionFunction = function (fileUrl, file, files) {

                                for (var i = 0; i < files.length; i++) {
                                    if (files[i]["url"]) {
                                        $(".imageList").append('<div style="width:115px;float:left;margin:4px 4px;border:1px solid rgba(0,0,0,.2)"><img width="100" src="' + files[i]["url"] + '" "/><a href="#" class="btnDel"><i class="fa fa-times"></i></a></div>');
                                    }
                                }
                                $(".btnDel").off("click").on("click", function (e) {
                                    e.preventDefault();
                                    $(this).parent().remove();
                                });
                            };
                            finder.popup();
                        });
                    });

                </script>
                <!-- /.panel-heading -->
                <div class="panel-body" data-ng-app="myapp" data-ng-controller="getproduct">
                    <div style="display: flex; float: left">
                        <label style="font-weight: normal">
                            Hiện theo
                            <select class="select" data-ng-model="Row">

                                <option selected="selected" value="5">5</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="">Tất cả</option>
                            </select>
                            sản phẩm</label>
                    </div>
                    <div style="display: flex; float: left; margin-left: 20px">
                        <label style="font-weight: normal">
                            Nhà sản xuất
                            <select id="nsx" class="select" data-ng-model="Select.maNSX">

                                <option data-ng-repeat="nsx in NSX" value="{{nsx.maNSX}}">{{nsx.tenNSX}}</option>
                            </select>
                        </label>
                    </div>
                    <div style="display: flex; margin-left: 70%">
                        <label style="font-weight: normal">
                            Tìm kiếm 
                            <input type="text" placeholder="Search" data-ng-model="Search<%--.masp--%>" class="seacrh" />
                        </label>
                    </div>
                    <style>
                        .select {
                            margin: 0 2px;
                            padding: 5px 5px;
                            border-radius: 4px;
                            width: 80px;
                            transition: .1s;
                            outline: none;
                            display: inline-block;
                        }
                            .select:focus {
                                box-shadow: 0px 0px 6px rgb(33, 150, 177);
                            }

                        .seacrh {
                            transition: .1s;
                            margin: 0 10px;
                            padding: 5px 5px;
                            border-radius: 4px;
                            border: 1px solid rgba(0,0,0,.5);
                            outline: none
                        }
                            .seacrh:focus {
                                box-shadow: 0px 0px 6px rgb(33, 150, 177);
                            }

                        #mytable thead tr th {
                            cursor: pointer;
                        }

                            #mytable thead tr th:first-child {
                                cursor: auto;
                            }
                    </style>
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
</asp:Content>
