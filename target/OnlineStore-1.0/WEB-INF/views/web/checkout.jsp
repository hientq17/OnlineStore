<%-- 
    Document   : checkout
    Created on : Jun 15, 2020, 10:13:11 PM
    Author     : MrEnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Checkout</title>

        <!-- Css Styles -->
        <jsp:include page="/common/css.jsp"/>

    </head>
    <body style="display: none" onload="checkLogin()">

    <!-- header page -->
    <jsp:include page="/common/header.jsp"/>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/template/web//img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="home-page">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Billing Details</h4>
                <s:form action="checkout" method="POST">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Name<span>*</span></p>
                                        <input type="text" name="cname" value="${customer.cname}" required="required" maxlength="50">
                                    </div>
                                </div>        
                            </div>

                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" name="caddress" value="${customer.caddress}" class="checkout__input__add" required="required" maxlength="50">
                            </div>
                            <div class="checkout__input">
                                <p>Phone<span>*</span></p>
                                <input type="text" name="cphone" value="${customer.cphone}" required="required" maxlength="11">
                            </div>
                            <div class="checkout__input">
                                <p>Order notes</p>
                                <input type="text"
                                    placeholder="Notes about your order, e.g. special notes for delivery.">
                            </div>
                            <input type="hidden" name="cnoLogin" value="${cnoLogin}"/>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <c:set var="totalCart" scope="request" value="0"/>
                                <ul>
                                    <c:forEach items="${cartItemList}" var="cart">
                                        <c:set var="totalCart" scope="request" value="${totalCart+cart.quantity*cart.unitPrice}"/>
                                        <li>${cart.iname} <sup>(${cart.quantity})</sup> <span>${cart.quantity*cart.unitPrice} ₫</span></li>
                                    </c:forEach>
                                </ul>
                                <div class="checkout__order__total">Total Payment <span>${totalCart} ₫</span></div>
                                <c:if test="${totalCart>0}"> 
                                      <input type="submit" class="site-btn" value="PLACE ORDER"/>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </s:form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

    <!-- footer page -->
    <jsp:include page="/common/footer.jsp"/>

    <!-- Js Plugins -->
    <jsp:include page="/common/js.jsp"/>

    <!-- Check login page -->
    <jsp:include page="/common/checkLogin.jsp"/>

    </body>
</html>
