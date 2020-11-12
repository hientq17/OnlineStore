<%@include file="/common/taglib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

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