<%@include file="/common/taglib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


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