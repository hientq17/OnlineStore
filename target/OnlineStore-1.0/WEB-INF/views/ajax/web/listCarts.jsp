<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>

<tbody id="list-carts">
<input type="hidden" id="total-cart-value" value="${totalCart}"/>
<c:forEach items="${listCarts}" var="cart">
    <tr>
        <td class="shoping__cart__item">
            <img src="${pageContext.request.contextPath}/resource/ProductImages/${cart.url}" alt="" width="105px" height="105px">
            <form action="item-page" method="GET" style="display: inline">
                <input type="hidden" name="ino" value="${cart.ino}"/>
                <input type="submit" style="background-color: white; transition-duration: 0.4s;
                                                        cursor: pointer; border: none; font-weight: bold;"
                       value="${cart.iname}"/>
            </form>
        </td>
        <td class="shoping__cart__price">
                ${cart.unitPrice} ₫
        </td>
        <td class="shoping__cart__quantity">
            <input style="width: 70px" name="quantity" type="number"
                   value="${cart.quantity}" id="jsQuantity${cart.ino}"
                   min="1" max="${cart.availableAmount}" step="1"
                   onchange="editCart('${cnoLogin}','${cart.ino}',${cart.quantity},${cart.availableAmount},${cart.unitPrice})"/>
        </td>
        <td class="shoping__cart__total">
                ${cart.unitPrice*cart.quantity} ₫
        </td>
        <td class="shoping__cart__item__close">
            <button type="submit" value="submit"
                    style="background-color: white; border: none"
                    onclick="deleteCart('${cnoLogin}','${cart.ino}')">
                <span class="icon_close"></span></button>
        </td>
    </tr>
</c:forEach>
</tbody>
