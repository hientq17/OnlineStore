<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>

<div id="list-categories">
    <div class="row">
        <c:set var="varCount" scope="request" value="0"/>
        <c:forEach items="${listItems}" var="item">
            <c:set var="varCount" scope="request" value="${varCount+1}"/>
            <div class="col-lg-4 col-md-6 col-sm-6 jsItem" id="jsItem${varCount}" style="display:none">
                <div class="product__item" id="category${item.ino}">
                    <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resource/ProductImages/${item.url}">
                        <ul class="product__item__pic__hover">
                            <li><a href="javascript:void()"
                                   onclick="addCart('${cnoLogin}','${item.ino}',1)">
                                <i style="z-index:99" class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                        <img src="${pageContext.request.contextPath}/resource/ProductImages/${item.url}" width="270px" height="270px"/>
                    </div>
                    <div class="product__item__text">
                        <form action="item-page?ino=${item.ino}" method="POST">
                            <input type="submit" style="opacity: 0; position:absolute; left: 0px; top: 0px; width:270px; height: 270px; transition-duration: 0.4s;
                                                            cursor: pointer; border: none;"/>
                            <input type="submit" style="background-color: white; border:none; transition-duration: 0.4s;
                                                            cursor: pointer; border: none;" value="${item.iname}"/>
                        </form>
                        <h5>${item.unitPrice} ₫</h5>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <ul class="pagination justify-content-center">
        <li class="page-item">
            <button id="jsPageNo1" onclick="displayItem(1); return false;" class="page-link"
                    style="color:white; background-color: gray">1
            </button>
        </li>
        <c:forEach var="pageNo" begin="2" end="${paginationNo}">
            <li class="page-item">
                <button id="jsPageNo${pageNo}" onclick="displayItem(${pageNo}); return false;"
                        class="page-link">${pageNo}</button>
            </li>
        </c:forEach>
    </ul>
</div>