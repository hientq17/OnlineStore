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
    <title>Item Type</title>
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
                    <div class="col-md-6" style="margin: 0 auto">
                        <div class="card strpied-tabled-with-hover">
                            <div class="card-header" style="text-align:center; background-color:#1e7e34">
                                <h4 class="card-title" style="color:white">LIST ITEM TYPES</h4>
                            </div>
                            <div class="card-body table-full-width table-responsive">
                                <table class="table table-hover table-striped" id="list-itemTypes">
                                    <thead>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th></th>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="itemType" items="${allItemTypes}">
                                        <tr>
                                            <td>${itemType.itno}</td>
                                            <td>${itemType.itname}</td>
                                            <td>
                                                <form action="editItemType-page-admin"
                                                      id="editItemTypeForm${itemType.itno}" method="post">
                                                    <input type="hidden" name="itno" value="${itemType.itno}">
                                                    <input type="hidden" name="itname" value="${itemType.itname}">
                                                    <input type="button" class="btn btn-success" style="float:right; margin: 0 10px"
                                                           onclick="removeItemType('${itemType.itno}')" value="Remove"/>
                                                    <input type="submit" class="btn btn-success"
                                                           style="float:right; margin: 0 10px" value="Edit"/>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="row" style="margin:0 auto; width: max-content">
                                    <a href="addItemType-page-admin"><input class="btn btn-success" type="button"
                                                                          value="Add New Item Type"/></a>
                                </div>
                                <br>
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

<%--Active navigation tag--%>
<style>
    .header__menu ul li.itemTypeNav a {
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
    function removeItemType(itno) {
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
                var url = 'remove-itemType?itno=' + itno
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
                            'This item type has been removed.',
                            'success'
                        )
                        document.getElementById('list-itemTypes').outerHTML = result;
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
</body>
</html>
