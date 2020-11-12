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
    <title>Customer</title>
    <!-- Css Styles -->
    <jsp:include page="/common/css.jsp"/>
</head>
<body style='display:none' onload="checkLoginAdmin()">
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
                                <h4 class="card-title" style="color:white">LIST CUSTOMERS</h4>
                            </div>
                            <div class="card-body table-full-width table-responsive" id="list-customers">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th></th>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="cus" items="${allCustomers}">
                                        <tr>
                                            <td> ${cus.cno} </td>
                                            <td> ${cus.cname} </td>
                                            <c:choose>
                                                <c:when test="${cus.cgender}">
                                                    <td>Male</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Female</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td> ${cus.cphone} </td>
                                            <td> ${cus.caddress} </td>
                                            <td>
                                                <form action="editCustomer-page-admin" id="editCusForm${cus.cno}"
                                                      method="post">
                                                    <input type="hidden" name="cno" value="${cus.cno}">
                                                    <input type="hidden" name="cname" value="${cus.cname}">
                                                    <input type="hidden" name="cgender" value="${cus.cgender}">
                                                    <input type="hidden" name="cphone" value="${cus.cphone}">
                                                    <input type="hidden" name="caddress" value="${cus.caddress}">
                                                </form>
                                                <input type="submit" class="btn btn-success"
                                                       form="editCusForm${cus.cno}" value="Edit"/>
                                                <input type="button" class="btn btn-success"
                                                       onclick="removeCustomer('${cus.cno}')" value="Remove"/>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <div class="row" style="margin:0 auto; width: max-content">
                                    <a href="addCustomer-page-admin"><input type="button" class="btn btn-success"
                                                                            value="Add New Customer"/></a>
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
</div>
<style>
    .header__menu ul li.customerNav a {
        color: #7fad39;
    }
</style>

<!-- footer page -->
<jsp:include page="/common/footer.jsp"/>

<!-- JS plugins -->
<jsp:include page="/common/js.jsp"/>

<!-- check admin login -->
<jsp:include page="/common/checkLoginAdmin.jsp"/>

<%--<script src="${pageContext.request.contextPath}/template/jquery/jquery-3.5.1.min.js" type="text/javascript"></script>--%>

<%-- Export to excel Jquery --%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/template/admin/js/jquery.tableToExcel.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/template/admin/js/exportExcel.js" type="text/javascript"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
    function removeCustomer(cno) {
        swal({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Delete'
        }).then((result) => {
            if (result.value) {
                var url = 'remove-customer?cno=' + cno
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
                            'This customer has been removed.',
                            'success'
                        )
                        document.getElementById('list-customers').outerHTML = result;
                    },
                    error: function (error) {
                        console.log(error);
                        swal(
                            'Oops!',
                            'Something error',
                            'error'
                        )
                    }
                });
            }
        })
    }
</script>

</body>
</html>
