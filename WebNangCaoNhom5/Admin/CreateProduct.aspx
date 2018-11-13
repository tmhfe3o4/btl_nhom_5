<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPage.Master" AutoEventWireup="true" CodeBehind="CreateProduct.aspx.cs" Inherits="WebNangCaoNhom5.Admin.CreateProduct" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageWraper" runat="server">
    <form runat="server">
        <asp:ScriptManager ID="Scrip" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="Update">
            <ContentTemplate>

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Thêm sản phẩm</h1>
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
                                   
                                    <select name="txt">
                                        <%foreach (var item in getNSX())
                                            { %>
                                        <option  value="<%=item.MaNSX %>" ><%=item.TenNSX %></option>
                                        <%} %>
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
                                <div class="form-group">
                                    <label>Ảnh liên quan </label>
                                    <br />
                                    <textarea readonly="readonly" style="cursor: pointer" cols="60" rows="10" id="anhlienquan" runat="server"></textarea>
                                </div>
                                <asp:Button  cssclass="btn btn-primary" onclientclick="return check();" runat="server" id="btnSubmit" onclick="btnSubmit_Click" text="Thêm" />
                            
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
                
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="../Asset/Admin/js/CreateProDuct.js"></script>
    <script src="../Asset/Admin/js/Plugin/ckfinder/ckfinder.js"></script>
</asp:Content>
