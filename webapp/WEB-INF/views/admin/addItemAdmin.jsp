<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <title>Item</title>
    <!-- Css Styles -->
    <jsp:include page="/common/css.jsp"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/template/admin/css/registrationForm.css" rel="stylesheet"
          type="text/css"/>

</head>
<body style="display:none" onload="checkLoginAdmin()">

<!-- header page admin -->
<jsp:include page="/common/headerAdmin.jsp"/>

<div class="signup-form">
    <s:form action="add-item" method="post" enctype="multipart/form-data">
        <h2>Add New Item</h2>
        <p class="hint-text">Add new item to database</p>
        <div class="form-group" style="color: darkslategray">
            <div class="row">
                <div class="col-3" style="margin: 10px">Item type:</div>
                <div class="col">
                    <select name="itno" id="selectItemType" onchange="changeItemType()">
                        <c:forEach items="${allItemTypes}" var="itemType">
                            <option value="${itemType.itno}">${itemType.itname}</option>
                        </c:forEach>
                        <option value="Manage">Customize item type ...</option>
                    </select> <br>
                </div>
            </div>
        </div>

        <div class="form-group">
            <input type="text" class="form-control" name="iname" value="${iname}" placeholder="Item name"
                   required="required">
        </div>
        <div class="form-group">
            <s:fielderror cssStyle="color:red" fieldName="unitPriceField"/>
            <input type="number" class="form-control" name="unitPrice" value="${unitPrice}" placeholder="Unit price"
                   required="required">
        </div>
        <div class="form-group">
            <s:fielderror cssStyle="color:red" fieldName="dateImportField"/>
            <input type="date" class="form-control" name="dateImport" placeholder="Date import" required="required">
        </div>
        <div class="form-group">
            <s:fielderror cssStyle="color:red" fieldName="dateExpiredField"/>
            <input type="date" class="form-control" name="dateExpired" placeholder="Date expired" value="${null}">
        </div>
        <div class="form-group">
            <s:fielderror cssStyle="color:red" fieldName="avaiAmountField"/>
            <input type="number" class="form-control" name="avaiAmount" value="${avaiAmount}"
                   placeholder="Available amount" required="required"/>
        </div>
        <div class="form-group">
            <label for="itemImage">Select image:</label>
            <input type="file" class="form-control" name="itemImage" accept="image/*" required="required">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Add Item</button>
        </div>
    </s:form>
    <div class="form-group">
        <a href="item-page-admin" style="text-decoration: none">
            <button class="btn btn-success btn-lg btn-block">Return to Item</button>
        </a>
    </div>
</div>

<!-- footer page -->
<jsp:include page="/common/footer.jsp"/>

<style>
    .header__menu ul li.itemNav a {
        color: #7fad39;
    }
</style>
<script>
    function changeItemType() {
        var selectBox = document.getElementById("selectItemType");
        var selectedValue = selectBox.options[selectBox.selectedIndex].value;
        if (selectedValue == "Manage") {
            location.replace("itemType-page-admin");
        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- check login admin page -->
<jsp:include page="/common/checkLoginAdmin.jsp"/>

<!-- JS Plugins -->
<jsp:include page="/common/js.jsp"/>

</body>
</html>
