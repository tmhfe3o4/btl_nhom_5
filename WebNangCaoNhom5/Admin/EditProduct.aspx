<%@ Page Title="Sửa sản phẩm"  Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="WebNangCaoNhom5.Admin.EditProduct" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageWraper" runat="server">
    <div class="back">
        <div class="loading">       
            <script>
                $(function () {
                    $("#PageWraper_btnSubmit").click(function () {
                        $('.back').css('display', 'block');
                    });
                });
            </script>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Sửa sản phẩm</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Thông tin sản phẩm
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form runat="server" id="formUpload">
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <input type="text" runat="server" class="form-control" id="tensp" placeholder="Tên sản phẩm">
                                </div>
                                <div class="form-group">
                                    <label>Tóm tắt</label>
                                    <input type="text" runat="server" class="form-control" id="tomtat" placeholder="Tóm tắt">
                                </div>
                                <div class="form-group">
                                    <label>Hãng sản xuất</label>
                                    <select name="txt" style="margin: 0 2px; padding: 5px 5px; border-radius: 4px; width: 100px; transition: .1s; outline: none; display: inline-block;">
                                        <%foreach (var item in getNSX())
                                            {
                                                if (item.MaNSX == getsp().MaNSX)
                                                {
                                        %>
                                        <option selected="selected" value="<%=item.MaNSX %>"><%=item.TenNSX %></option>
                                        <%}
                                            else
                                            { %>
                                        <option value="<%=item.MaNSX %>"><%=item.TenNSX %></option>
                                        <% }
                                        } %>                                        
                                    </select>
                                    <%--<div name="abc">
                                        <input type="radio" name="1" value="1" />
                                        <input type="radio" name="1" value="2" />
                                        <input type="radio" name="1" value="3" />
                                        <input type="radio" name="1" value="4" />
                                    </div>--%>
                                </div>
                                <label>Chi tiết</label>
                                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"></CKEditor:CKEditorControl>
                                <div class="form-group">
                                    <label>Số lượng</label>
                                    <input type="text" runat="server" class="form-control" id="soluong" placeholder="Số lượng">
                                </div>
                                <div class="form-group">
                                    <label>Đơn giá</label>
                                    <input type="text" runat="server" class="form-control" id="dongia" placeholder="Số lượng">
                                </div>
                                <div class="form-group">
                                    <label>Ảnh đại diện</label><br />
                                    <textarea readonly="readonly" style="cursor: pointer" cols="60" rows="2" id="anhdaidien" runat="server"></textarea>
                                </div>
                                <asp:Button CssClass="btn btn-primary" OnClientClick="return check();" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" Text="Lưu" />
                            </form>
                        </div>
                        <!-- /.col-lg-6 (nested) -->

                        <!-- /.col-lg-6 (nested) -->
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <script src="../Asset/Admin/js/Plugin/ckfinder/ckfinder.js"></script>
    <link href="../Asset/Admin/dist/css/Loading.css" rel="stylesheet" />
    <script src="../Asset/Admin/js/EditProduct.js"></script>
</asp:Content>
