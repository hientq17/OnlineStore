<%@include file="/common/taglib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<tbody id="list-invoices">
<c:set var="varCountInvoice" scope="request" value="0"/>
<c:forEach var="invoice" items="${invoiceList}">
    <c:choose>
        <c:when test="${varCountInvoice>=5}">
            <tr class="invoice-extend" style="display:none">
                <td> ${invoice.dateSale} </td>
                <td> ${invoice.totalPayment} ₫</td>
                <c:choose>
                    <c:when test="${invoice.paymentStatus}">
                        <td>Confirmed</td>
                    </c:when>
                    <c:otherwise>
                        <td>Unconfirmed</td>
                    </c:otherwise>
                </c:choose>
                <td>
                    <form action="invoiceDetail-page" method="GET">
                        <input type="hidden" name="inno" value="${invoice.inno}"/>
                        <input type="submit" class="btn btn-success"
                               value="Detail"/>
                    </form>
                </td>
            </tr>
        </c:when>
        <c:otherwise>
            <tr>
                <td> ${invoice.dateSale} </td>
                <td> ${invoice.totalPayment} ₫</td>
                <c:choose>
                    <c:when test="${invoice.paymentStatus}">
                        <td style="color:green">Confirmed</td>
                        <td>
                            <form action="invoiceDetail-page" method="GET">
                                <input type="hidden" name="inno" value="${invoice.inno}"/>
                                <input type="submit" class="btn btn-success"
                                       value="Detail"/>
                            </form>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td style="color:red">Unconfirmed</td>
                        <td>
                            <form action="invoiceDetail-page" method="GET">
                                <input type="hidden" name="inno" value="${invoice.inno}"/>
                                <input type="submit" class="btn btn-success"
                                       value="Detail"/>
                                <input type="button" onclick="cancelInvoice('${invoice.inno}')"
                                       class="btn btn-danger" value="Cancel"/>
                            </form>
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:otherwise>
    </c:choose>
    <c:set var="varCountInvoice" scope="request" value="${varCountInvoice+1}"/>
</c:forEach>
</tbody>
</tbody>