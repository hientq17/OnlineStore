<%-- 
    Document   : shopping_cart
    Created on : Jun 15, 2020, 9:43:26 PM
    Author     : MrEnd
--%>
<%@include file="/common/taglib.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Shopping Cart</title>
    <!-- Css Styles -->
    <jsp:include page="/common/css.jsp"/>
</head>
<body>
<!-- header page -->
<jsp:include page="/common/header.jsp"/>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
         data-setbg="${pageContext.request.contextPath}/template/web/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Shopping Cart</h2>
                    <div class="breadcrumb__option">
                        <a href="home-page">Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                        </thead>
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
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="home-page" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="shoping__checkout">
                    <h5>Cart Total</h5>
                    <ul>
                        <li>Total <span id="total-cart"> ${totalCart} ₫</span></li>
                    </ul>
                    <c:choose>
                        <c:when test="${cnoLogin!=null}">
                            <a style="margin: 0 auto" type="submit" href="checkout-page"
                                    class="primary-btn">PROCEED TO CHECKOUT
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="login-page" class="primary-btn">LOGIN TO CHECKOUT</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->


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
                            <div class="card-body table-full-width table-responsive">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <th>Date Sale</th>
                                    <th>Total Payment</th>
                                    <th>Payment Status</th>
                                    <th></th>
                                    </thead>
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
                                </table>
                                <div class="row">
                                    <c:if test="${varCountInvoice>=5}">
                                        <button style="margin: 0 auto" class="primary-btn" id="showAllBtn"
                                                onclick="showAllInvoices()">Show All
                                        </button>
                                        <button style="margin: 0 auto; display: none" class="primary-btn"
                                                id="showLessBtn" onclick="showLessInvoices()">Show Less
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- footer page -->
<jsp:include page="/common/footer.jsp"/>

<style>
    .header__menu ul li.cartNav a {
        color: #7fad39;
    }
</style>

<!-- Js Plugins -->
<jsp:include page="/common/js.jsp"/>

<script>
    function editCart(cno, ino, quantity, amount, unitPrice) {
        var x = document.getElementById("jsQuantity" + ino).value;
        if (x < 1) {
            alert("Please select at least one");
            document.getElementById("jsQuantity" + ino).value = quantity;
            return false;
        } else if (x > amount + quantity) {
            alert("Please select under " + (amount + quantity));
            document.getElementById("jsQuantity" + ino).value = quantity;
            return false;
        } else {
            var url = 'update-cart?cno=' + cno
                    + '&ino=' + ino
                    + '&quantity=' + x
            $.ajax({
                url: url,
                type: 'POST',
                contentType: "application/json; charset=utf-8",
                dataType: 'html',
                allowOutsideClick: false,
                closeOnClickOutside: false,
                success: function (result) {
                    document.getElementById('list-carts').outerHTML = result;
                    document.getElementById('total-cart').innerHTML = document.getElementById('total-cart-value').value;
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
    }

    function deleteCart(cno, ino) {
        var url = 'delete-cart?cno=' + cno
            + '&ino=' + ino
        $.ajax({
            url: url,
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            dataType: 'html',
            allowOutsideClick: false,
            closeOnClickOutside: false,
            success: function (result) {
                swal(
                    'Success!',
                    'This item has been deleted.',
                    'success'
                )
                document.getElementById('list-carts').outerHTML = result;
                document.getElementById('total-cart').innerHTML = document.getElementById('total-cart-value').value;
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

    function showAllInvoices() {
        var invoices = document.getElementsByClassName('invoice-extend');
        for (var i = 0; i < invoices.length; i++) {
            invoices[i].style.display = 'table-row';
        }
        document.getElementById('showAllBtn').style.display = 'none';
        document.getElementById('showLessBtn').style.display = 'block';
    }

    function showLessInvoices() {
        var invoices = document.getElementsByClassName('invoice-extend');
        for (var i = 0; i < invoices.length; i++) {
            invoices[i].style.display = 'none';
        }
        document.getElementById('showAllBtn').style.display = 'block';
        document.getElementById('showLessBtn').style.display = 'none';
    }

    function cancelInvoice(inno) {
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
                var url = 'cancel-invoice?inno=' + inno
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
                            'This invoice has been canceled.',
                            'success'
                        )
                        document.getElementById('list-invoices').outerHTML = result;
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
