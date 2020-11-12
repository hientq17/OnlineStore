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
        <title>Sign Up</title>
        <LINK REL="SHORTCUT ICON" HREF="${pageContext.request.contextPath}/template/web/img/favicon.png">

        <!-- Font Icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/login/fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/login/css/style.css">
    </head>
    <body>
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <s:form method="POST" class="register-form" id="register-form" action="signup">
                            <s:fielderror cssStyle="color:red" fieldName="cnoLoginField"/>
                            <div class="form-group">
                                <label for="cnoLogin"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="cnoLogin" value="${cnoLogin}" id="name" placeholder="Your ID" required="required" maxlength="16"/>
                            </div>
                            <s:fielderror cssStyle="color:red" fieldName="cpassField"/>
                            <div class="form-group">
                                <label for="cpass"><i class="zmdi zmdi-email"></i></label>
                                <input type="password" name="cpass" value="${cpass}" id="pass" placeholder="Your Password" required="required" maxlength="16"/>
                            </div>
                            <s:fielderror cssStyle="color:red" fieldName="repeatCpassField"/>
                            <div class="form-group">                             
                                <label for="recpass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="recpass" value="${recpass}" id="re_pass" placeholder="Repeat your password" required="required" maxlength="16"/>
                            </div>
                            <div class="form-group">
                                <label for="cname"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="cname" value="${cname}" id="name" placeholder="Your Name" required="required" maxlength="16"/>
                            </div>
                            <div class="form-group">
                                <i class="zmdi zmdi-male-female"></i>&nbsp;&nbsp;Gender: &nbsp;&nbsp;&nbsp;&nbsp;
                                <select name="cgender" style="padding:5px; padding-right: 20px">
                                    <option value="Male" selected="${cgender=='Male'?true:false}">Male</option>
                                    <option value="Female" selected="${cgender=='Female'?true:false}">Female</option>
                                </select>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </s:form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="${pageContext.request.contextPath}/template/admin/img/signup-image.jpg" alt="Sign up image"></figure>
                        <a href="login.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- JS -->
        <script src="${pageContext.request.contextPath}/template/admin/login/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/template/admin/login/js/main.js"></script>
    </body>
</html>
