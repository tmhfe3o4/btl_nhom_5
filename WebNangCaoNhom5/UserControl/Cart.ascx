<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cart.ascx.cs" Inherits="WebNangCaoNhom5.UserControl.Cart" %>
<p>
    Chào mừng đến với <span>HIPHONE! </span>
    <a href="/Cart"  
        <%if (getNumberOfCart() != 0)
        {%>
       class="active" 
        data-cart="<%=getNumberOfCart() %>"<%} %>>Giỏ hàng
                        <i class="fa fa-shopping-basket" aria-hidden="true"></i>
    </a>
   
</p>
