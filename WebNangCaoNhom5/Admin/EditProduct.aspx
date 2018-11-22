<%@ Page Title="Sửa sản phẩm" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="WebNangCaoNhom5.Admin.EditProduct" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageWraper" runat="server">
    <div class="back">
        <div class="loading">
            <script>
                function checkValid() {
                    //if (Page_ClientValidate("Group")) {   

                    $('.back').css('display', 'block');

                    return true;
                    //}
                    //return false;
                };
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
                                <asp:ScriptManager runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <label>Tên sản phẩm</label>
                                            <input type="text" runat="server" class="form-control" id="tensp" placeholder="Tên sản phẩm">
                                            <%--<asp:RequiredFieldValidator ValidationGroup="Group" runat="server" ForeColor="Red" ControlToValidate="tensp" ErrorMessage="Tên không được trống"></asp:RequiredFieldValidator>--%>
                                        </div>
                                        <div class="form-group">
                                            <label>Tóm tắt</label>
                                            <input type="text" runat="server" class="form-control" id="tomtat" placeholder="Tóm tắt">
                                            <%--<asp:RequiredFieldValidator ValidationGroup="Group" runat="server" ForeColor="Red" ControlToValidate="tomtat" ErrorMessage="Tóm tắt không được trống"></asp:RequiredFieldValidator>--%>
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
                                        <%--<asp:RequiredFieldValidator ValidationGroup="Group" runat="server" ForeColor="Red" ControlToValidate="CKEditorControl1" ErrorMessage="Vui lòng viết bài đăng"></asp:RequiredFieldValidator>--%>
                                        <div class="form-group">
                                            <label>Số lượng</label>
                                            <input type="text" runat="server" class="form-control" id="soluong" placeholder="Số lượng">
                                            <%-- <asp:RequiredFieldValidator ValidationGroup="Group" runat="server" ForeColor="Red" ControlToValidate="soluong" ErrorMessage="Số lượng trống"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" ControlToValidate="soluong" ForeColor="red" ValidationExpression="^\d+$" ErrorMessage="Chỉ nhập số"></asp:RegularExpressionValidator>--%>
                                        </div>
                                        <div class="form-group">
                                            <label>Đơn giá</label>
                                            <input type="text" runat="server" class="form-control" id="dongia" placeholder="Đơn giá">
                                            <%--<asp:RequiredFieldValidator ValidationGroup="Group" runat="server" ForeColor="Red" ControlToValidate="dongia" ErrorMessage="Số lượng trống"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ValidationGroup="Group" runat="server" ControlToValidate="dongia" ForeColor="red" ValidationExpression="^-?\d+\.?\d*$" ErrorMessage="Chỉ nhập số"></asp:RegularExpressionValidator>--%>
                                        </div>
                                        <div class="form-group">
                                            <label>Ảnh đại diện</label><br />
                                            <textarea readonly="readonly" style="cursor: pointer" cols="60" rows="2" id="anhdaidien" runat="server"></textarea>
                                            <%--<asp:RequiredFieldValidator ValidationGroup="Group" runat="server" ForeColor="Red" ControlToValidate="anhdaidien" ErrorMessage="Vui lòng chọn ảnh"></asp:RequiredFieldValidator>--%>
                                        </div>
                                        <asp:Button ValidationGroup="Group" CausesValidation="true" CssClass="btn btn-primary" OnClientClick="return checkValid();" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" Text="Lưu" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
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
