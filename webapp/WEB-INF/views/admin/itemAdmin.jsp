<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Item</title>

    <!-- Css Styles -->
    <jsp:include page="/common/css.jsp"/>

</head>
<body style="display:none" onload="checkLoginAdmin()">

<!-- header page -->
<jsp:include page="/common/headerAdmin.jsp"/>

<div class="wrapper">
    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card strpied-tabled-with-hover">
                            <div class="card-header" style="text-align:center; background-color:#1e7e34">
                                <h4 class="card-title" style="color:white">LIST ITEMS</h4>
                            </div>
                            <div>
                                <select name="sortITno" id="sortITno" onchange="sortItems()">
                                    <option value="${null}" selected="true" onclick="sortItems()">All Department</option>
                                    <c:forEach items="${allItemTypes}" var="itemType">
                                        <option value="${itemType.itno}" onclick="sortItems()">${itemType.itname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="card-body table-full-width table-responsive">
                                <table class="table table-hover table-striped" id="list-items">
                                    <thead>
                                    <th>Image</th>
                                    <th>ID</th>
                                    <th>Type</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Date Import</th>
                                    <th>Date Expired</th>
                                    <th>Available Amount</th>
                                    <th></th>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${listItems}">
                                        <tr>
                                            <td><img src="${pageContext.request.contextPath}/resource/ProductImages/${item.url}" alt="Image" height="70px" width="70px">
                                            </td>
                                            <td>${item.ino}</td>
                                            <td>${item.itno}</td>
                                            <td>${item.iname}</td>
                                            <td>${item.unitPrice} ₫</td>
                                            <td>${item.dateImport}</td>
                                            <td>${item.dateExpired}</td>
                                            <td>${item.availableAmount}</td>
                                            <td>
                                                <form action="editItem-page-admin" method="post">
                                                    <input type="hidden" name="ino" value="${item.ino}">
                                                    <input type="hidden" name="itno" value="${item.itno}">
                                                    <input type="hidden" name="iname" value="${item.iname}">
                                                    <input type="hidden" name="unitPrice"
                                                           value="${item.unitPrice}">
                                                    <input type="hidden" name="dateImport"
                                                           value="${item.dateImport}">
                                                    <input type="hidden" name="dateExpired"
                                                           value="${item.dateExpired}">
                                                    <input type="hidden" name="avaiAmount"
                                                           value="${item.availableAmount}">
                                                    <input type="hidden" name="avaiAmount"
                                                           value="${item.availableAmount}">
                                                    <input type="hidden" name="imageUrl"
                                                           value="${item.url}">
                                                    <input type="submit" class="btn btn-success"
                                                           style="width:80px; margin-bottom:5px" value="Edit"/>
                                                </form>
                                                 <input type="button" class="btn btn-success"
                                                           style="width:80px" onclick="removeItem('${item.ino}')" value="Remove"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="row" style="margin:0 auto; width: max-content">
                                    <a href="addItem-page-admin"><input class="btn btn-success" type="button"
                                                                        value="Add New Item"/></a>
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
    .header__menu ul li.itemNav a {
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
    function removeItem(ino) {
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
                var itno = document.getElementById("sortITno").value;
                var url = 'remove-item?ino=' + ino
                        + '&itno=' + itno
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
                            'This item has been removed.',
                            'success'
                        )
                        document.getElementById('list-items').outerHTML = result;
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

<script>
    function sortItems() {
        var itno = document.getElementById("sortITno").value;
        var url = 'sort-items?itno=' + itno
        $.ajax({
            url: url,
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: 'html',
            allowOutsideClick: false,
            closeOnClickOutside: false,
            success: function (result) {
                document.getElementById('list-items').outerHTML = result;
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
