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
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>About</title>
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
                        <h2>Contact Us</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Contact Us</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>Phone</h4>
                        <p>+84-988-608-213</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>Address</h4>
                        <p>FPT High Tech Park, Hoa Hai Ward, Ngu Hanh Son District, Da Nang city</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>nhochiennhoc@gmail.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
    <div class="map">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8556132794115!2d108.2580633143649!3d15.968914846361187!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314218e6e0975b07%3A0xcaff29dfb73f0ac!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgxJDDoCBO4bq1bmc!5e0!3m2!1sen!2sbd!4v1593687105096!5m2!1sen!2sbd"
            height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        <div class="map-inside">
            <i class="icon_pin"></i>
            <div class="inside-widget">
                <h4>Da Nang City</h4>
                <ul>
                    <li>Phone: +84-988-608-213</li>
                    <li>Add: FPT High Tech Park, Hoa Hai Ward, Ngu Hanh Son District</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Map End -->

    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>Leave Message</h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Your name">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Your Email">
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea placeholder="Your message"></textarea>
                        <button type="submit" class="site-btn">SEND MESSAGE</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->
    <style>
        .header__menu ul li.aboutNav a {
                color: #7fad39;
        }
    </style>
    <!--  Styles -->
    <jsp:include page="/common/css.jsp"/>
    <!-- Js Plugins -->
    <jsp:include page="/common/js.jsp"/>
    </body>
</html>
