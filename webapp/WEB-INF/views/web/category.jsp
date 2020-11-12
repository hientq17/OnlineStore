<%@page contentType="text/html" pageEncoding="UTF-8"  %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Category</title>

    <!-- Css Styles -->
    <jsp:include page="/common/css.jsp"/>
</head>
<body onload="initDisplay()">

<!-- header page -->
<jsp:include page="/common/header.jsp"/>

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div>
                    <select name="itno" id="itnoValue">
                        <option id="all-category" value="${null}" selected>All Department</option>
                        <c:forEach items="${allItemTypes}" var="itemType">
                             <option value="${itemType.itno}">${itemType.itname}</option>
                        </c:forEach>
                    </select>
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <input type="text" id="inameValue" placeholder="What do you need?"
                                   style="width: 70%; border: none; height: 100%">
                            <button class="site-btn" onclick="advancedCategory()" style="float:right">SEARCH</button>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i style="margin-top: 12px;" class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+84-988-608-213</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
         data-setbg="${pageContext.request.contextPath}/template/web/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Category</h2>
                    <div class="breadcrumb__option">
                        <a href="home-page">Home</a>
                        <span>Category</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Department</h4>
                        <ul>
                            <div>
                                <c:choose>
                                    <c:when test="${itno!=null}">
                                        <button class="department" type="button" style="background-color: white; transition-duration: 0.4s;
                                        cursor: pointer; border: none;" onclick="chooseDepartment(this)" value="${null}">All</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="department" type="button" style="background-color: white; font-weight: bold; transition-duration: 0.4s;
                                        cursor: pointer; border: none;" onclick="chooseDepartment(this)" value="${null}">All</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <br>
                            <c:forEach items="${allItemTypes}" var="itemType">
                                <div>
                                    <c:choose>
                                        <c:when test="${itemType.itno==itno}">
                                            <button class="department"  type="button" style="font-weight: bold; background-color: white; transition-duration: 0.4s;
                                          cursor: pointer; border: none;" onclick="chooseDepartment(this)"
                                                    value="${itemType.itno}">${itemType.itname}</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="department"  type="button" style="background-color: white; transition-duration: 0.4s;
                                          cursor: pointer; border: none;" onclick="chooseDepartment(this)"
                                                    value="${itemType.itno}">${itemType.itname}</button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <br>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort">
                                <span>Sort By</span>
                                <select id="sortValue" onchange="advancedCategory()">
                                    <option value="0" selected="true">Default</option>
                                    <option value="1">Price: Low to High</option>
                                    <option value="-1">Price: High to Low</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-3">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <span class="icon_ul"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="list-categories">
                    <div class="row">
                        <c:set var="varCount" scope="request" value="0"/>
                        <c:forEach items="${listItems}" var="item">
                            <c:set var="varCount" scope="request" value="${varCount+1}"/>
                            <div class="col-lg-4 col-md-6 col-sm-6 jsItem" id="jsItem${varCount}" style="display:none">
                                <div class="product__item" id="category${item.ino}">
                                    <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resource/ProductImages/${item.url}">
                                        <ul class="product__item__pic__hover">
                                            <li><a href="javascript:void()"
                                                   onclick="addCart('${cnoLogin}','${item.ino}',1)">
                                                <i style="z-index:99" class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <form action="item-page?ino=${item.ino}" method="POST">
                                            <input type="submit" style="opacity: 0; position:absolute; left: 0px; top: 0px; width:270px; height: 270px; transition-duration: 0.4s;
                                                                                            cursor: pointer; border: none;"/>
                                            <input type="submit" style="background-color: white; border:none; transition-duration: 0.4s;
                                                                                            cursor: pointer; border: none;"
                                                   value="${item.iname}"/>
                                        </form>
                                        <h5>${item.unitPrice} ₫</h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <button id="jsPageNo1" onclick="displayItem(1); return false;" class="page-link"
                                    style="color:white; background-color: gray">1
                            </button>
                        </li>
                        <c:forEach var="pageNo" begin="2" end="${paginationNo}">
                            <li class="page-item">
                                <button id="jsPageNo${pageNo}" onclick="displayItem(${pageNo}); return false;"
                                        class="page-link">${pageNo}</button>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer page -->
<jsp:include page="/common/footer.jsp"/>

<!-- Js Plugins -->
<jsp:include page="/common/js.jsp"/>

<!-- Product Section End -->
<style>
    .header__menu ul li.categoryNav a {
        color: #7fad39;
    }
</style>


<script>

    function initDisplay() {
        for (var i = 1; i <= 6; i++) {
            document.getElementById('jsItem' + i).style.display = 'block';
        }
    }

    function displayItem(pageNo) {
        var items = document.getElementsByClassName('jsItem');
        for (var i = 1; i <=${paginationNo}; i++) {
            document.getElementById('jsPageNo' + i).style.backgroundColor = 'white';
            document.getElementById('jsPageNo' + i).style.color = 'black';
        }
        document.getElementById('jsPageNo' + pageNo).style.backgroundColor = 'gray';
        document.getElementById('jsPageNo' + pageNo).style.color = 'white';
        for (var i = 0; i < items.length; i++) {
            items[i].style.display = 'none';
        }
        for (var i = ((pageNo - 1) * 6 + 1); i <= (6 * pageNo); i++) {
            document.getElementById('jsItem' + i).style.display = 'block';
        }
    }

    function advancedCategory() {
        var iname, itno, sort;
        iname = document.getElementById('inameValue').value;
        itno = document.getElementById('itnoValue').value;
        sort = document.getElementById('sortValue').value;
        var url = 'advanced-category-page?iname=' + iname
            + '&itno=' + itno
            + '&sort=' + sort
        $.ajax({
            url: url,
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: 'html',
            allowOutsideClick: false,
            closeOnClickOutside: false,
            success: function (result) {
                document.getElementById('list-categories').outerHTML = result;
                initDisplay();
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    function chooseDepartment(x) {
        var list = document.getElementsByClassName('department');
        for (var i = 0; i < list.length; i++) {
            list[i].style.fontWeight = "normal";
        }
        x.style.fontWeight = "bold";
        document.getElementById('inameValue').value = '';
        document.getElementById('itnoValue').value = x.value;
        advancedCategory();
    }

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
