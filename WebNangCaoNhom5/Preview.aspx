<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Preview.aspx.cs" Inherits="WebNangCaoNhom5.Preview" %>

<%@ Register TagPrefix="UC" TagName="Category" Src="~/UserControl/Category.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <div class="content">
        <div class="container">
            <div class="center_preview">
                <div class="top_product">
                    <div class="slide_preview">
                        <div class="image_detail">
                            <div class="cut_room hide" id="cut">
                            </div>
                            <img id="imageid" src="<%=getProduct().HinhAnhDaiDien %>" alt="">
                        </div>
                        <div class="room hide" id="result">
                        </div>
                       
                        <div class="wrapper">
                            <span id="btnpre"><i class="fa fa-angle-left" aria-hidden="true"></i></span>
                            <span id="btnnext"><i class="fa fa-angle-right" aria-hidden="true"></i></span>

                            <div class="inner_wraper">

                                <%foreach (var item in getImageProduct())
                                    { %>
                                <div class="slider">

                                    <img src="<%=item.TenHinhAnh %>" alt="">
                                </div>
                                <%} %>
                                <%--<div class="slider">

                                    <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                                </div>
                                    <div class="slider">

                                    <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                                </div>
                                <div class="slider">
                                    <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                                </div>
                                <div class="slider">
                                    <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                                </div>
                                <div class="slider">
                                    <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                                </div>
                                <div class="slider">
                                    <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                                </div>
                                <div class="slider">
                                    <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                                </div>
                                <div class="slider">
                                    <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                                </div>
                                <div class="slider">
                                    <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                                </div>--%>
                            </div>

                        </div>


                    </div>
                    <div class="info_shopping">
                        <h3><%=getProduct().TenSP %></h3>
                        <p><%=getProduct().TomTat %></p>
                        Giá:<span style="color: rgb(209, 88, 88); font-size: 18px; margin-left: 40px"><%=string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"),"{0:c}",getProduct().DonGia) %></span>
                        <div class="quati">
                            Số lượng: <span style="cursor: pointer" id="minus">-</span><span id="quati">2</span><span style="cursor: pointer" id="plus">+</span>
                        </div>
                  
                        <a style="cursor: pointer" data-info="<%=getProduct().MaSP %>" class="addcart">Thêm vào giỏ hàng</a>
                    </div>
                </div>

                <div class="detail_product">
                    <%=getProduct().ChiTiet %>
                </div>
            </div>
            <div class="right_preview">
                <UC:Category runat="server" />
            </div>
        </div>
        <div class="news_products">
            <div class="head_categorys">
                <span>Sản phẩm liên quan</span>
                <a href="/san-pham--<%=getProducer().TenNSX %>">See all
                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                </a>
            </div>
            <div class="list_categorys">
                <%foreach (var item in getRelatedProducts())
                    {  %>
                <div class="box1">
                    <div class="icon">
                        <a href="/dtdd--<%=item.TenSP %>">
                            <img src="<%=item.HinhAnhDaiDien %>" alt="">
                        </a>
                    </div>
                    <div class="content">
                        <h3><%=item.TenSP %></h3>
                        <p>
                            <%=item.TomTat %>
                        </p>
                        <span><%=string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"),"{0:c}",getProduct().DonGia) %></span>
                        <a style="cursor: pointer" data-info="<%=item.MaSP %>">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
                <%} %>
                <%-- <div class="box">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>

                    <div class="content">
                        <h3>Search</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                            has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <span>1500000$</span>
                        <a href="#">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>

                </div>
                <div class="box">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>
                    <div class="content">
                        <h3>Search</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <span>1500000$</span>
                        <a href="#">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>

                <div class="box">
                    <div class="icon">
                        
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>
                    <div class="content">
                        <h3>Search</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <span>1500000$</span>
                        <a href="#">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
    <script src="Asset/Client/js/PreView.js"></script>
</asp:Content>
