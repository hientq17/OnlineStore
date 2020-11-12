<%--
    Document   : home
    Created on : Jun 15, 2020, 8:40:38 PM
    Author     : MrEnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Invoice Detail</title>

    <!-- Css Styles -->
    <jsp:include page="/common/css.jsp"/>

</head>
<body style="display:none" onload="checkLoginAdmin()">

<!-- header admin page -->
<jsp:include page="/common/headerAdmin.jsp"/>

<div class="wrapper">
    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card strpied-tabled-with-hover">
                            <div class="card-header" style="text-align:center; background-color:#1e7e34">
                                <h4 class="card-title" style="color:white">LIST INVOICE DETAIL</h4>
                            </div>
                            <div class="card-body table-full-width table-responsive">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <th>Invoice ID</th>
                                    <th>Item name</th>
                                    <th>Item amount</th>
                                    <th>Total price</th>
                                    <th></th>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="invoiceDetail" items="${invoiceDetailList}">
                                        <tr>
                                            <td> ${invoiceDetail.inno} </td>
                                            <td> ${invoiceDetail.iname} </td>
                                            <td> ${invoiceDetail.itemAmount} </td>
                                            <td> ${invoiceDetail.totalPrice} </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="form-group">
                                    <a href="invoice-page-admin" style="text-decoration: none">
                                        <button class="btn btn-success btn-lg btn-block">Return to Invoice</button>
                                    </a>
                                </div>
                                <button onclick="$('table').tblToExcel();" class="btn btn-success">Export Table Data To
                                    Excel File
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    .header__menu ul li.invoiceNav a {
        color: #7fad39;
    }
</style>

<!-- footer page -->
<jsp:include page="/common/footer.jsp"/>

<!-- Js Plugins -->
<jsp:include page="/common/js.jsp"/>

<!-- check login admin -->
<jsp:include page="/common/checkLoginAdmin.jsp"/>

<%-- Export to excel Jquery --%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/template/admin/js/jquery.tableToExcel.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/template/admin/js/exportExcel.js" type="text/javascript"></script>

<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-36251023-1']);
    _gaq.push(['_setDomainName', 'jqueryscript.net']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();
</script>

</body>
</html>
