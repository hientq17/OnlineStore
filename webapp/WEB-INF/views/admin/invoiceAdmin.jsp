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
    <title>Invoice</title>

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
                                <h4 class="card-title" style="color:white">LIST INVOICES</h4>
                            </div>
                            <br>
                            <form id="invoiceAdminForm">
                                <input type="hidden" name="varConfirm" value="OFF"/>
                                <div class="row" style="margin: 0 3%">
                                    From:
                                    <div class="col-lg-2 ol-md-12">
                                        <input type="date" class="form-control" name="dateFrom" id="dateFrom"/>
                                    </div>
                                    To:
                                    <div class="col-lg-2 col-md-12">
                                        <input type="date" class="form-control" name="dateTo" id="dateTo"/>
                                    </div>
                                    <div class="col-lg-1 col-md-12">
                                        <input type="button" class="btn btn-success" onclick="reloadListInvoices('search')" value="Search"/>
                                    </div>
                                    <div class="col-lg-1 col-md-12">
                                        <input type="button" class="btn btn-success" onclick="reloadListInvoices('clear')" value="Clear"/>
                                    </div>
                                </div>
                            </form>
                            <div style="float:right">
                                <div style="float: right; margin: 0 50px">
                                    <label for="varConfirmCheck">Select Unconfirmed invoices</label>
                                    <input type="checkbox" id="varConfirmCheck" name="varConfirm" onclick="reloadListInvoices('search')"/>
                                </div>
                                <div class="card-body table-full-width table-responsive" id="list-invoices">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <th>ID</th>
                                        <th>ID Customer</th>
                                        <th>Date Sale</th>
                                        <th>Total Payment</th>
                                        <th>Payment Status</th>
                                        <th></th>
                                        </thead>
                                        <tbody>
                                        <c:set var="revenue" scope="request" value="0"/>
                                        <c:set var="totalUnconfirmed" scope="request" value="0"/>
                                        <c:forEach var="invoice" items="${listInvoices}">
                                            <tr>
                                                <td> ${invoice.inno} </td>
                                                <td> ${invoice.cno} </td>
                                                <td> ${invoice.dateSale} </td>
                                                <td> ${invoice.totalPayment} ₫</td>
                                                <c:choose>
                                                    <c:when test="${invoice.paymentStatus}">
                                                        <c:set var="revenue" scope="request"
                                                               value="${revenue+invoice.totalPayment}"/>
                                                        <td>Confirmed</td>
                                                        <td>
                                                            <form action="invoiceDetail-page-admin" method="POST">
                                                                <input type="hidden" name="inno"
                                                                       value="${invoice.inno}"/>
                                                                <input type="submit" class="btn btn-success"
                                                                       value="Detail"/>
                                                            </form>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var="totalUnconfirmed" scope="request"
                                                               value="${totalUnconfirmed+invoice.totalPayment}"/>
                                                        <td>Unconfirmed</td>
                                                        <td>
                                                            <form action="invoiceDetail-page-admin" method="POST" style="display: inline">
                                                                <input type="hidden" name="inno" value="${invoice.inno}"/>
                                                                <input type="submit" class="btn btn-success" value="Detail"/>
                                                            </form>
                                                            <input type="button" onclick="confirmInvoice('${invoice.inno}')" class="btn btn-success"
                                                                   value="Confirm"/>
                                                        </td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <c:choose>
                                        <c:when test='${varConfirm=="ON"}'>
                                            <div class="totalInvoice" style="width:20%  ">
                                                <p class="total" style="float:right">Total: ${totalUnconfirmed} ₫</p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="totalInvoice">
                                                <p class="subtotal">Revenue: ${revenue} ₫</p>
                                                <p class="subtotal">Total unconfirmed invoice: ${totalUnconfirmed} ₫</p>
                                                <p class="total">Total: ${revenue+totalUnconfirmed} ₫</p>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <a onclick="$('table').tblToExcel();" class="btn btn-success" style="color:white">Export
                                    Table Data To Excel File</a>
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

        .totalInvoice {
            float: right;
            border-style: solid;
            width: 30%;
            border-radius: 10px;
            margin-right: 3%
        }

        .totalInvoice .subtotal {
            margin: 3% 5%;
            color: #003300;
            font-weight: bold
        }

        .totalInvoice .total {
            margin: 5%;
            color: #003300;
            font-size: 1.15em;
            font-weight: bold
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script>
        function reloadListInvoices(status) {
            var varConfirmCheck, dateFrom, dateTo;
            if(document.getElementById('varConfirmCheck').checked){
                varConfirmCheck = 'ON';
            } else {
                varConfirmCheck = 'OFF';
            }
            if(status=='search'){
                dateFrom = document.getElementById('dateFrom').value;
                dateTo = document.getElementById('dateTo').value;
            } else {
                document.getElementById('dateFrom').value = null;
                document.getElementById('dateTo').value = null;
            }
            var url = 'list-invoice-admin?varConfirm=' + varConfirmCheck
                    + '&dateFrom=' + dateFrom
                    + '&dateTo=' + dateTo
            $.ajax({
                url: url,
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                dataType : 'html',
                allowOutsideClick: false,
                closeOnClickOutside: false,
                success: function (result) {
                    document.getElementById('list-invoices').outerHTML = result;
                },
                error: function (error) {
                    swal(
                        'Oops!',
                        'Something error.',
                        'error'
                    )
                    console.log(error);
                }
            });
        }
        function confirmInvoice(inno) {
            var varConfirmCheck, dateFrom, dateTo;
            if(document.getElementById('varConfirmCheck').checked){
                varConfirmCheck = 'ON';
            } else {
                varConfirmCheck = 'OFF';
            }
            dateFrom = document.getElementById('dateFrom').value;
            dateTo = document.getElementById('dateTo').value;
            var url = 'confirm-invoice?varConfirm=' + varConfirmCheck
                + '&dateFrom=' + dateFrom
                + '&dateTo=' + dateTo
                + '&inno=' + inno
            $.ajax({
                url: url,
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                dataType : 'html',
                allowOutsideClick: false,
                closeOnClickOutside: false,
                success: function (result) {
                    swal(
                        'Success!',
                        'This invoice has been confirmed',
                        'success'
                    )
                    document.getElementById('list-invoices').outerHTML = result;
                },
                error: function (error) {
                    swal(
                        'Oops!',
                        'Something error.',
                        'error'
                    )
                    console.log(error);
                }
            });
        }
    </script>

</body>
</html>
