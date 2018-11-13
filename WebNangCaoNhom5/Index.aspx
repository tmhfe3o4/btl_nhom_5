<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebNangCaoNhom5.Index" %>

<%@ Register TagPrefix="UC" TagName="Category" Src="~/UserControl/Category.ascx" %>
<%@ Register Src="~/UserControl/Cart.ascx" TagPrefix="UC" TagName="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <script>
        $(function () {
            $(".menunav ul li").find("a").each(function () {
                $(this).removeClass("active");
            });
            $("#menunav ul li a .icon  ").find(".fa-home").each(function () {
                $(this).parent(".icon").parent("a").addClass("active");
            });
            $(".list_categorys .content a").click(function () {

                $.ajax({
                    type: "post",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    data: '{tensp:' + $(this).attr("data-info") + ',soluong:""}',
                    url: "Index.aspx/LoadUserControl",
                    success: function (data) {
                        $("#load").load(location.href + " #load");
                        $(".alert").addClass("activealert");
                        $(".alert").text("Đặt thành công!");
                        $(".alert").css("background", "#b2cea7")
                        setTimeout(function () {
                            $(".alert").removeClass("activealert");
                        }, 3000);
                    },
                    error: function (msg) {
                        alert("Something Wrong");
                    }
                });

            });

        });
    </script>

    <div class="panel">
        <UC:Category runat="server" />
        <div class="slide">
            <ul>
                <li class="active">
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                </li>
                <li>
                    <a href="#">
                        <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt=""></a>
                </li>
                <script>
                    
                    var autoslide = setInterval(function () {
                        if ($(".slide ul li.active").is("li:last")) {

                            $(".slide ul li").last("li").removeClass("active");
                            $(".slide ul li").first("li").addClass("active");
                        }
                        else {
                            $(".slide ul li.active").next("li").addClass("active");
                            $(".slide ul li.active").prev("li").removeClass("active");
                        }
                    }, 3000);
                    $(document).ready(function () {
                        $(".slide li").mousemove(function () {
                            clearInterval(autoslide);
                            $(".slide ul").find("li").each(function () {
                                $(this).removeClass("active");

                            });
                            $(this).addClass("active");

                        }).mouseout(function () {
                            autoslide = setInterval(function () {
                                if ($(".slide ul li.active").is("li:last")) {

                                    $(".slide ul li").last("li").removeClass("active");
                                    $(".slide ul li").first("li").addClass("active");
                                }
                                else {
                                    $(".slide ul li.active").next("li").addClass("active");
                                    $(".slide ul li.active").prev("li").removeClass("active");
                                }
                            }, 3000);
                        });


                    });

                </script>
            </ul>
        </div>
    </div>

    <div class="content">
        <%  var clas = 1;
            foreach (var group in getProducer())
            {
                if (getListNewProduct(group.MaNSX).Count > 0)
                {
        %>
        <div class="news_products">
            <div class="head_categorys">
                <span><%=group.TenNSX %></span>
                <a href="/san-pham--<%=group.TenNSX %>">See all
                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                </a>
            </div>
            <div class="list_categorys">
                <%foreach (var item in getListNewProduct(group.MaNSX).Take(4))
                    {

                %>

                <div class="<%="box1" %>">
                    <div class="icon">
                        <a href="<%=Page.GetRouteUrl("prev", new { id = item.TenSP }) %>">
                            <span >Chi tiết</span>
                            <img src="<%=item.HinhAnhDaiDien %>" alt="">
                        </a>
                    </div>

                    <div class="content">
                        <h3><%=item.TenSP %></h3>
                        <p>
                            <%=item.TomTat.ToString() %>
                        </p>
                        <span><%=string.Format(System.Globalization.CultureInfo.GetCultureInfo("vi-VN"), "{0:c}", item.DonGia) %></span>
                        <a data-info="<%=item.MaSP %>" style="cursor: pointer">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>
                    <span class="name"><%=item.TenSP %> </span>
                </div>


                <%}
                    } %>
                <%-- <div class="box1">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>

                    <div class="content">
                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                            has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <span>1500000$</span>
                        <a href="#">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>

                </div>
                <div class="box1">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>
                    <div class="content">
                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <span>1500000$</span>
                        <a href="#">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>

                <div class="box1">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>
                    <div class="content">
                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
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
        <div class="clear"></div>

        <% clas++;
            } %>
        <%--<div class="news_products">
            <div class="head_categorys">
                <span>NAME OF CATEGORY</span>
                <a href="#">See all
                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                </a>
            </div>
            <div class="list_categorys">
                <div class="box11">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>

                    <div class="content" id="content1">

                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <a class="prev" href="#">
                            <span></span>
                            Xem chi tiết</a>
                        <a href="#">
                            <svg>
                                <rect></rect>
                            </svg>
                            150000000$
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>


                </div>
                <div class="box11">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>
                    <div class="content" id="content1">

                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <a class="prev" href="#">
                            <span></span>
                            Xem chi tiết</a>
                        <a href="#">
                            <svg>
                                <rect></rect>
                            </svg>
                            150000000$
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>


                </div>
                <div class="box11">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>
                    <div class="content" id="content1">

                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <a class="prev" href="#">
                            <span></span>
                            Xem chi tiết</a>
                        <a href="#">
                            <svg>
                                <rect></rect>
                            </svg>
                            150000000$
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>


                </div>

                <div class="box11">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>
                    <div class="content" id="content1">

                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <a class="prev" href="#">
                            <span></span>
                            Xem chi tiết</a>
                        <a href="#">
                            <svg>
                                <rect></rect>
                            </svg>
                            150000000$
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>


                </div>

            </div>
        </div>
        <div class="clear"></div>
        <div class="news_products">
            <div class="head_categorys">
                <span>NAME OF CATEGORY</span>
                <a href="#">See all
                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                </a>
            </div>
            <div class="list_categorys">
                <div class="box12">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>

                    <div class="content" id="content1">

                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <a class="prev" href="#">
                            <span></span>
                            <span></span>
                            Xem chi tiết</a>
                        <a href="#" class="price">150000000$
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>

                </div>
                <div class="box12">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>

                    <div class="content" id="content1">

                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <a class="prev" href="#">
                            <span></span>
                            <span></span>
                            Xem chi tiết</a>
                        <a href="#" class="price">150000000$
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>

                </div>
                <div class="box12">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>

                    <div class="content" id="content1">

                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <a class="prev" href="#">
                            <span></span>
                            <span></span>
                            Xem chi tiết</a>
                        <a href="#" class="price">150000000$
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>

                </div>
                <div class="box12">
                    <div class="icon">
                        <a href="#">
                            <img src="Asset/Client/image/anh-nen-riven-than-kiem-6-6-17.jpg" alt="">
                        </a>
                    </div>

                    <div class="content" id="content1">

                        <h3>Search</h3>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s

                        </p>
                        <a class="prev" href="#">
                            <span></span>
                            <span></span>
                            Xem chi tiết</a>
                        <a href="#" class="price">150000000$
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        </a>
                    </div>

                </div>

            </div>
            <div class="clear"></div>
        </div>--%>
    </div>
</asp:Content>
