<%@include file="/common/taglib.jsp"%>

<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="home.jsp"><img
                src="${pageContext.request.contextPath}/template/admin/${pageContext.request.contextPath}/template/admin/img/logo.png"
                alt=""></a>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <img src="${pageContext.request.contextPath}/template/admin/img/language.png" alt="">
            <div>English</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">English</a></li>
                <li><a href="#">Spanish</a></li>
            </ul>
        </div>
        <div class="header__top__right__auth">
            <c:choose>
                <c:when test="${sessionScope.cnoLogin!=null}">
                    <div class="header__top__right__auth">
                        <a style="display:inline-block" class="btn" onclick="openForm();"><i
                                class="fa fa-user"></i>${sessionScope.cnoLogin}</a>
                        <a href="logout" style="display:inline-block; float: right">
                            <button>Logout</button>
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="login-page"><i class="fa fa-user"></i>Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="customerNav"><a href="customer-page-admin">CUSTOMER</a></li>
            <li class="itemNav"><a href="item-page-admin">ITEM</a></li>
            <li class="itemTypeNav"><a href="itemType-page-admin">ITEM TYPE</a></li>
            <li class="invoiceNav"><a href="invoice-page-admin">INVOICE</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a><i class="fa fa-facebook"></i></a>
        <a><i class="fa fa-twitter"></i></a>
        <a><i class="fa fa-linkedin"></i></a>
        <a><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> Welcome to H2LN Store</li>
            <li><a href="home-page">Switch to customer page</a></li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> Welcome to H2LN Store</li>
                            <li><a href="home-page" onMouseOver="this.style.color='green'"
                                   onmouseout="this.style.color='blue'">Switch to customer page</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a><i class="fa fa-facebook"></i></a>
                            <a><i class="fa fa-twitter"></i></a>
                            <a><i class="fa fa-linkedin"></i></a>
                            <a>><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__language">
                            <img src="${pageContext.request.contextPath}/template/admin/img/language.png" alt="">
                            <div>English</div>
                            <span class="arrow_carrot-down"></span>
                            <ul>
                                <li><a href="#">English</a></li>
                                <li><a href="#">Spanish</a></li>
                            </ul>
                        </div>
                        <div class="header__top__right__auth">
                            <c:choose>
                                <c:when test="${sessionScope.cnoLogin!=null}">
                                    <div class="header__top__right__auth">
                                        <a style="display:inline-block" class="btn" onclick="openForm();"><i
                                                class="fa fa-user"></i>${sessionScope.cnoLogin}</a>
                                        <a href="logout" style="display:inline-block; float: right">
                                            <button>Logout</button>
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <a href="login-page"><i class="fa fa-user"></i>Login</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="home-page"><img src="${pageContext.request.contextPath}/template/admin/img/logo.png"
                                            alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="customerNav"><a href="customer-page-admin">CUSTOMER</a></li>
                        <li class="itemNav"><a href="item-page-admin">ITEM</a></li>
                        <li class="itemTypeNav"><a href="itemType-page-admin">ITEM TYPE</a></li>
                        <li class="invoiceNav"><a href="invoice-page-admin">INVOICE</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->
<!--popup form-->
<div class="form-popup" id="myForm">
</div>
<script>
    function openForm() {
        document.getElementById("myForm").style.display = "block";
        var url = 'get-customer-information';
        $.ajax({
            url: url,
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: 'html',
            allowOutsideClick: false,
            closeOnClickOutside: false,
            success: function (result) {
                document.getElementById('myForm').outerHTML = result;
                document.getElementById("myForm").style.display = "block";
            },
            error: function (error) {
                console.log(error);
            }
        });

    }

    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }
</script>