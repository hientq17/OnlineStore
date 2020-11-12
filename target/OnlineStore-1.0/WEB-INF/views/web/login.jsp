<%-- 
    Document   : login
    Created on : Jun 16, 2020, 7:14:04 AM
    Author     : MrEnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Log In</title>
        <LINK REL="SHORTCUT ICON" HREF="${pageContext.request.contextPath}/template/admin/img/favicon.png">

        <!-- Font Icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/login/fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/web/login/css/style.css">
    </head>
    <body>
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="${pageContext.request.contextPath}/template/web/img/signin-image.jpg" alt="sing in image"></figure>
                        <a href="signup-page" class="signup-image-link">Create an account</a>
                        <a href="home-page" class="signup-image-link">Login as guest</a>
                    </div>
                    <div class="signin-form">
                        <h2 class="form-title">Login</h2>
                        <s:form action="login" class="register-form" id="login-form" method="POST">
                            <s:textfield name="cnoLogin" placeholder="Your ID" required="true" maxlength="16"></s:textfield>
                            <s:password name="cpass" placeholder="Password" required="true" maxlength="16"></s:password>
                            <input type="hidden" name="status" value="login"/>
                            <s:submit label="Submit"/>
                        </s:form>
                    </div>
                </div>
            </div>
        </section>
        <!-- JS -->
        <script src="${pageContext.request.contextPath}/template/web/login/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/template/web/login/js/main.js"></script>
    </body>
</html>
