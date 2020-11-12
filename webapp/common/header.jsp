<%@include file="/common/taglib.jsp"%>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>
<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="#"><img src=" img/logo.png" alt=""></a>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <img src="${pageContext.request.contextPath}/template/web/img/language.png" alt="">
            <div>English</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">Spanish</a></li>
                <li><a href="#">English</a></li>
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
            <li class="homeNav"><a href="home-page">Home</a></li>
            <li class="categoryNav"><a href="category-page">Category</a></li>
            <li class="cartNav"><a href="cart-page">Shopping Cart</a></li>
            <li class="aboutNav"><a href="about-page">About</a></li>
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
            <c:choose>
                <c:when test="${cadminLogin=='true'}">
                    <li><a href="customer-page-admin" onMouseOver="this.style.color = 'green'" onmouseout="this.style.color = 'blue'">
                        Switch to admin page</a></li>
                </c:when>
                <c:otherwise>
                    <li>The best online store for everyone.</li>
                </c:otherwise>
            </c:choose>
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
                            <c:choose>
                                <c:when test="${cadminLogin=='true'}">
                                    <li><a href="customer-page-admin" onMouseOver="this.style.color = 'green'" onmouseout="this.style.color = 'blue'">
                                        Switch to admin page
                                    </a></li>
                                </c:when>
                                <c:otherwise>
                                    <li>The best online store for everyone.</li>
                                </c:otherwise>
                            </c:choose>
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
                            <img src="${pageContext.request.contextPath}/template/web/img/language.png" alt="">
                            <div>English</div>
                            <span class="arrow_carrot-down"></span>
                            <ul>
                                <li><a href="#">Spanis</a></li>
                                <li><a href="#">English</a></li>
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
                    <a href="home-page"><img
                            src="${pageContext.request.contextPath}/template/web/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="homeNav"><a href="home-page">Home</a></li>
                        <li class="categoryNav"><a href="category-page">Category</a></li>
                        <li class="cartNav"><a href="cart-page">Shopping Cart</a></li>
                        <li class="aboutNav"><a href="about-page">About</a></li>
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
<c:set var="cus" value="${customer}"/>
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