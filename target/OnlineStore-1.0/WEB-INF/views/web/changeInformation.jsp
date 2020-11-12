<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <title>Change Information</title>

    <!-- Css Styles -->
    <jsp:include page="/common/css.jsp"/>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/template/admin/css/registrationForm.css" rel="stylesheet"
          type="text/css"/>

</head>
<body onload="checkLogin()">

<!-- header page -->
<jsp:include page="/common/header.jsp"/>

<c:set var="customer" value="${customer}"/>

<div class="signup-form">
    <s:form action="change-information" method="post">
        <h2>Change Information</h2>
        <p class="hint-text">Change customer information</p>
        <div class="form-group">
            <input type="text" class="form-control" name="cno" placeholder="Customer ID"
                   value='${customer.getCno()}' required="required" readonly="true">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="cname" placeholder="Customer name"
                   value='${customer.getCname()}'  required="required" maxlength="50">
        </div>
        <div class="form-group" style="color:darkslategray">
            <div class="row">
                <div class="col">Gender:</div>
                <c:set var="cgenderValue" value='${customer.isCgender()}' />
                <c:choose>
                    <c:when test="${cgenderValue}">
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
                   value='${customer.getCphone()}'  required="required" maxlength="11">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="caddress" placeholder="Customer address"
                   value='${customer.getCaddress()}'  required="required" maxlength="50">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Change</button>
        </div>
    </s:form>
    <div class="form-group">
        <a href="home.jsp" style="text-decoration: none">
            <button class="btn btn-success btn-lg btn-block">Return</button>
        </a>
    </div>
</div>

<!-- footer page -->
<jsp:include page="/common/footer.jsp"/>

<!-- check login page -->
<jsp:include page="/common/checkLogin.jsp"/>

<!-- Js Plugins -->
<jsp:include page="/common/js.jsp"/>

</body>
</html>
