<input type="hidden" id="checkLoginCno" value="${sessionScope.cnoLogin}"/>
<script>
    function checkLogin(){
        var x = document.getElementById('checkLoginCno').value;
        if(x==null || x==""){
            location.replace("warning-page");
        } else{
            var tagBody = document.getElementsByTagName('body');
            tagBody[0].style.display = 'block';
        }
    }
</script>
