<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <title>Customer</title>

    <!-- Css Styles -->
    <jsp:include page="/common/css.jsp"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/template/admin/css/registrationForm.css" rel="stylesheet" type="text/css"/>

</head>
<body style="display:none" onload="checkLoginAdmin()">

<!-- header page admin -->
<jsp:include page="/common/headerAdmin.jsp"/>

<div class="signup-form">
    <s:form action="edit-customer" method="post">
        <h2>Edit Customer</h2>
        <p class="hint-text">Edit customer in database</p>
        <div class="form-group">
            <input type="text" class="form-control" name="cno" placeholder="Customer ID"
                   value='<%= request.getParameter("cno") %>' required="required" readonly="true">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="cname" placeholder="Customer name"
                   value='<%= request.getParameter("cname") %>' required="required" maxlength="50">
        </div>
        <div class="form-group" style="color:darkslategray">
            <div class="row">
                <div class="col">Gender:</div>
                <c:set var="cgenderTest" value='<%= request.getParameter("cgender") %>'/>
                <c:choose>
                    <c:when test="${cgenderTest}">
                        <div class="col">Male &nbsp; &nbsp;<input type="radio" name="cgender" value="true" checked>
                        </div>
                        <div class="col">Female &nbsp; &nbsp;<input type="radio" name="cgender" value="false"></div>
                    </c:when>
                    <c:otherwise>
                        <div class="col">Male &nbsp; &nbsp;<input type="radio" name="cgender" value="true"></div>
                        <div class="col">Female &nbsp; &nbsp;<input type="radio" name="cgender" value="false" checked>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="form-group">
            <s:fielderror cssStyle="color:red" fieldName="cphoneField"/>
            <input type="text" class="form-control" name="cphone" placeholder="Customer phone"
                   value='<%= request.getParameter("cphone") %>' maxlength="11">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="caddress" placeholder="Customer address"
                   value='<%= request.getParameter("caddress") %>' maxlength="50">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Edit Customer</button>
        </div>
    </s:form>
    <div class="form-group">
        <a href="customer-page-admin" style="text-decoration: none">
            <button class="btn btn-success btn-lg btn-block">Return to Customer</button>
        </a>
    </div>
</div>

<!-- footer page -->
<jsp:include page="/common/footer.jsp"/>

<style>
    .header__menu ul li.customerNav a {
        color: #7fad39;
    }
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- check login admin page -->
<jsp:include page="/common/checkLoginAdmin.jsp"/>

<!-- JS Plugins -->
<jsp:include page="/common/js.jsp"/>

</body>
</html>
