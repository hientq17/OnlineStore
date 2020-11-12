<%--
    Document   : home
    Created on : Jun 15, 2020, 8:40:38 PM
    Author     : MrEnd
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <title>Item Type</title>

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
    <s:form action="add-itemType" method="post" enctype="multipart/form-data">
        <h2>Add New Item Type</h2>
        <p class="hint-text">Add new item type to database</p>
        <div class="form-group">
            <input type="text" class="form-control" name="itname" placeholder="Item Type Name" required="required">
        </div>
        <div class="form-group">
            <label for="itemTypeImage">Select image:</label>
            <input type="file" class="form-control" name="itemTypeImage" accept="image/*" required="required">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Add Item Type</button>
        </div>
    </s:form>
    <div class="form-group">
        <a href="itemType-page-admin" style="text-decoration: none">
            <button class="btn btn-success btn-lg btn-block">Return to Item Type</button>
        </a>
    </div>
</div>
<!-- footer page -->
<jsp:include page="/common/footer.jsp"/>

<style>
    .header__menu ul li.itemTypeNav a {
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
