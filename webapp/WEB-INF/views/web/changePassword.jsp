<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <title>Change Password</title>

    <!-- Css Styles -->
    <jsp:include page="/common/css.jsp"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/template/admin/css/registrationForm.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/template/admin/css/dialog-overlay.css" rel="stylesheet" type="text/css"/>
</head>
<body style="display:none" onload="init('${currentPassword}')">

<!-- header page -->
<jsp:include page="/common/header.jsp"/>

<div class="signup-form" id='changePasswordForm' style="display:none">
    <s:form action="change-password" id='changePassFormId' method="post">
        <h2>Change Password</h2>
        <p class="hint-text">Change customer password</p>
        <div class="form-group">
            <input type="text" class="form-control" name="cno" placeholder="Customer ID"
                   value='<%= request.getParameter("cno") %>' required="required" readonly="true">
        </div>
        <div class="form-group">
            <s:fielderror cssStyle="color:red" fieldName="cpassField"/>
            <input type="password" class="form-control" id="cpass" name="cpass" placeholder="Enter new password"
                   required="true" maxlength="16">
        </div>
        <div class="form-group">
            <s:fielderror cssStyle="color:red" fieldName="recpassField"/>
            <input type="password" class="form-control" id="recpass" name="recpass"
                   placeholder="Enter password again" required="true">
        </div>
        <div class="form-group">
            <button onclick="changePassword()" class="btn btn-success btn-lg btn-block">Change</button>
        </div>
    </s:form>
    <div class="form-group">
        <a href="home-page" style="text-decoration: none">
            <button class="btn btn-success btn-lg btn-block">Return</button>
        </a>
    </div>
</div>

<div class='dialog-ovelay' id='checkPasswordForm'>
    <div class='dialog'>
        <header>
            <h3>WARNING!!!</h3>
        </header>
        <div class='dialog-msg'>
            <p>Please enter your password to continue</p>
            <input type="password" id="checkPassword"/>
            <p id="notMatch" style="color:red"></p>
        </div>
        <footer>
            <div class='controls'>
                <button class='button button-danger' onclick="javascript:history.go(-1)">Cancel</button>
                <button class='button button-default' onclick="checkPassword('${currentPassword}')">OK</button>
            </div>
        </footer>
    </div>
</div>

<!-- footer page -->
<jsp:include page="/common/footer.jsp"/>

<style>
    .header__menu ul li.customerNav a {
        color: #7fad39;
    }
</style>

<!-- check login page -->
<jsp:include page="/common/checkLogin.jsp"/>

<!-- Js Plugins -->
<jsp:include page="/common/js.jsp"/>

<script>

    function init(pass){
        checkLogin();
        if(pass.length==0){
            document.getElementById('checkPasswordForm').style.display = 'none';
            document.getElementById('changePasswordForm').style.display = 'block';
        }
    }
    function checkPassword(cpass) {
        var checkPassword = document.getElementById('checkPassword').value;
        if (checkPassword == cpass) {
            document.getElementById('checkPasswordForm').style.display = 'none';
            document.getElementById('changePasswordForm').style.display = 'block';
        } else {
            document.getElementById('notMatch').innerHTML = 'Incorrect password';
        }
    }

</script>
</body>
</html>
