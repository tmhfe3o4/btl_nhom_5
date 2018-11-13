//Angular
var app = angular.module('myapp', []);
app.controller('getproduct', mycontrol);
mycontrol.$inject = ['$scope', '$http'];
function mycontrol($scope, $http, $route) {
    //Get ListProduct
    $http.get("/WebService.asmx/getlistProduct").then(function (response) {
        $scope.SP = response.data;
    });
    //Get Category
    $http.get("/WebService.asmx/getlistProducer").then(function (response) {
        $scope.NSX = response.data;
    });
    $scope.Rows = [{ "num": "5" }, { "num": "10" }, { "num": "15" }, {"num":"20"}];
    //Delete Product
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
    //Image Manager
    $scope.EdtImg = function (id) {
        $("#exampleModal").modal("show");
        var html = "";
        $http.post("/WebService.asmx/getImage", { id: id }).then(function (response) {
            var lst = response.data.d;
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
    //Popup finder
    $("#btnFinder").off("click").on("click", function (e) {
        e.preventDefault();
        var finder = new CKFinder();
        //Get Url after select images
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