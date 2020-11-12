<%@include file="/common/taglib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

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