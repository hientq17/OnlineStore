<%@include file="/common/taglib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

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