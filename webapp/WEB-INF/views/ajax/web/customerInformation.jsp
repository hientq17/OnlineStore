<%@include file="/common/taglib.jsp"%>
<c:set var="cus" value="${customer}"/>
<!--popup form-->
<div class="form-popup" id="myForm">
    <form action="/action_page.php" class="form-container">
        <button class="close-form-button" onclick="closeForm(); return false"><span class="icon_close"></span></button>
        <h4>User information</h4>
        <p>ID: ${cus.cno}</p>
        <p>Name: ${cus.cname}</p>
        <p>Gender: ${cus.cgender?'Male':'Female'}</p>
        <p>Phone: ${cus.cphone}</p>
        <p>Address: ${cus.caddress}</p>
        <a href="change-information-page" class="btn">Change information</a>
        <a href="change-password-page" class="btn">Change password</a>
    </form>
</div>