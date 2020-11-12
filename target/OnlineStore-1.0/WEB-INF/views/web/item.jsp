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
        <title>Item</title>
        <LINK REL="SHORTCUT ICON" HREF="${pageContext.request.contextPath}/template/admin/img/favicon.png">

        <!-- Css Styles -->
        <jsp:include page="/common/css.jsp"/>
    </head>
    <body>
    <!-- header page -->
    <jsp:include page="/common/header.jsp"/>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/template/web/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Product Detail</h2>
                        <div class="breadcrumb__option">
                            <a href="home.jsp">Home</a>
                            <span>H2LN Store</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <c:set var="item" scope="request" value="${item}"/>
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${pageContext.request.contextPath}/resource/ProductImages/${item.url}" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${item.iname}</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <div class="product__details__price">${item.unitPrice}</div>
                        <p>This is an exclusive product of H2LN store. We are committed to products of clear origin and quality assurance. We hope to receive your support.</p>
                        <div>
                            <b>Quantity: </b>&ensp;
                            <input id="jsQuantity" name="quantity" type="number" value="1" min="1" max="${item.availableAmount}" step="1" onchange="return check()" onkeydown="return event.key != 'Enter';"/><br><br>
                            <c:choose>
                                <c:when test="${cnoLogin!=null}">
                                    <input class="primary-btn" type="button"
                                           onclick="addCart('${cnoLogin}','${item.ino}')" value="ADD TO CART"/>
                                </c:when>    
                                <c:otherwise>
                                    <a href="login-page" class="primary-btn">LOGIN TO BUY</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <ul>
                            <c:choose>
                                <c:when test="${item.availableAmount>0}">
                                    <li><b>Availability: </b> <span id="item-available-amount">${item.availableAmount}</span></li>
                                </c:when>
                                <c:otherwise>
                                    <li><b>Availability: </b> <span style="color:red">Out of stock</span></li>
                                </c:otherwise>
                            </c:choose>
                            
                            <li><b>Share on</b>
                                <div class="share">
                                    <i class="fa fa-facebook"></i>
                                    <i class="fa fa-twitter"></i>
                                    <i class="fa fa-instagram"></i>
                                    <i class="fa fa-pinterest"></i>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach items="${relatedItems}" var="relatedItem">
                    <c:if test="${relatedItem.ino!=item.ino}">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resource/ProductImages/${relatedItem.url}">
                                </div>
                                <div class="product__item__text">
                                    <form action="item-page?ino=${relatedItem.ino}" method="POST">
                                        <input type="hidden" name="ino" value="${relatedItem.ino}"/>
                                        <input type="submit" style="opacity: 0; position:absolute; left: 0px; top: 0px; width:270px; height: 270px; transition-duration: 0.4s;
                                                   cursor: pointer; border: none;"/>
                                        <input type="submit" style="background-color: white; border:none; transition-duration: 0.4s;
                                                   cursor: pointer; border: none;" value="${relatedItem.iname}"/>
                                    </form>
                                    <h5>${relatedItem.unitPrice}</h5>
                                </div>
                            </div>
                        </div>
                    </c:if>       
                </c:forEach>           
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
    <!-- footer page -->
    <jsp:include page="/common/footer.jsp"/>
    <script>
        function check() {
            var x = document.getElementById("jsQuantity").value;
                if(x<1) {
                    alert("Please select at least one");
                    document.getElementById("jsQuantity").value=1;
                    return false;
                } else if(x>${item.availableAmount}){
                    alert("Please select under "+${item.availableAmount});
                    document.getElementById("jsQuantity").value=1;
                    return false;
                }
        }
        function addCart(cno, ino) {
            var quantity = document.getElementById('jsQuantity').value;
            var url = 'add-cart?cno=' + cno
                + '&ino=' + ino
                + '&quantity=' + quantity
            $.ajax({
                url: url,
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                dataType: 'html',
                allowOutsideClick: false,
                closeOnClickOutside: false,
                success: function (result) {
                    swal(
                        'Success!',
                        'This item has been added to cart.',
                        'success'
                    )
                },
                error: function (error) {
                    swal(
                        'Oops!',
                        'Something error.',
                        'error'
                    )
                    console.log(error);
                }
            });
        }
    </script>
    <!-- Js Plugins -->
    <jsp:include page="/common/js.jsp"/>
    </body>
</html>
