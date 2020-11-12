<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home</title>

    <!-- Css Styles -->
    <jsp:include page="/common/css.jsp"/>

</head>
<body>

<!-- header page -->
<jsp:include page="/common/header.jsp"/>

<!-- Categories Section Begin -->
<section class="categories">
    <div class="container">
        <div class="row">
            <div class="categories__slider owl-carousel">
                <c:forEach items="${allItemTypes}" var="itemType">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="${pageContext.request.contextPath}/resource/ProductImages/${itemType.url}">
                            <h5 style="bottom: 0; background-color:white; font-weight: bold; font-size: 24px">${itemType.itname}</h5>
                        </div>
                        <form action="category-page" method="get">
                            <input type="hidden" name="itno" value="${itemType.itno}"/>
                            <input type="submit" style="opacity: 0; position:absolute; left: 0px; top: 0px; width:270px; height: 210px; transition-duration: 0.4s;
                                                                cursor: pointer; border: none;" value="$"/>
                        </form>
                        <br>
                    </div>

                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Featured Product</h2>
                </div>
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                        <c:forEach items="${allItemTypes}" var="itemType">
                            <li data-filter=".${itemType.itno}">${itemType.itname}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            <c:forEach items="${featuredItems}" var="item">
                <div class="col-lg-3 col-md-4 col-sm-6 mix ${item.itno}" id="featured${item.ino}">
                    <div class="featured__item">
                        <div class="featured__item">
                            <div class="featured__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resource/ProductImages/${item.url}">
                                <ul class="featured__item__pic__hover">
                                    <c:if test="${cnoLogin!=null}">
                                        <c:choose>
                                            <c:when test="${item.availableAmount>0}">
                                                <li><a href="javascript:void()"
                                                       onclick="addCart('${cnoLogin}','${item.ino}',1)">
                                                    <i style="z-index:99" class="fa fa-shopping-cart"></i></a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li style="color:red; font-weight: bold">Out of stock</li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </ul>
                            </div>
                            <div class="featured__item__text">
                                <form action="item-page?ino=${item.ino}" method="POST">
                                    <input type="submit" style="opacity: 0; position:absolute; left: 0px; top: 0px; width:270px; height: 270px; transition-duration: 0.4s;
                                                   cursor: pointer; border: none;"/>
                                    <input type="submit" style="background-color:white; border:none; transition-duration: 0.4s;
                                                   cursor: pointer; border: none;" value="${item.iname}"/>
                                </form>
                                <h5>${item.unitPrice} ₫</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="${pageContext.request.contextPath}/template/web/img/banner/banner1.png" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="${pageContext.request.contextPath}/template/web/img/banner/banner2.png" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner End -->

<!-- Top Rated Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Top Rated Product</h2>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            <c:forEach items="${topRateItems}" var="item">
                <div class="col-lg-3 col-md-4 col-sm-6" id="topRate${item.ino}">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resource/ProductImages/${item.url}">
                            <ul class="featured__item__pic__hover">
                                <c:if test="${cnoLogin!=null}">
                                    <c:choose>
                                        <c:when test="${item.availableAmount>0}">
                                            <li><a href="javascript:void()"
                                                   onclick="addCart('${cnoLogin}','${item.ino}',1)">
                                                <i style="z-index:99" class="fa fa-shopping-cart"></i></a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li style="color:red; font-weight: bold">Out of stock</li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <form action="item-page?ino=${item.ino}" method="POST">
                                <input type="submit" style="opacity: 0; position:absolute; left: 0px; top: 0px; width:270px; height: 270px; transition-duration: 0.4s;
                                                   cursor: pointer; border: none;"/>
                                <input type="submit" style="background-color:white; border:none;    transition-duration: 0.4s;
                                                   cursor: pointer; border: none;" value="${item.iname}"/>
                            </form>
                            <h5>${item.unitPrice} ₫</h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Top Rated Section End -->

<!-- footer page -->
<jsp:include page="/common/footer.jsp"/>

<style>
    .header__menu ul li.homeNav a {
        color: #7fad39;
    }
</style>

<!-- Js Plugins -->
<jsp:include page="/common/js.jsp"/>

<script>
    function addCart(cno, ino, quantity) {
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

</body>
</html>
