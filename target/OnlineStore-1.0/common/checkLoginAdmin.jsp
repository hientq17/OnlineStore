<input type="hidden" value="${sessionScope.cnoLogin}" id="checkLoginCno"/>
<input type="hidden" value="${sessionScope.cadminLogin}" id="checkLoginCadmin"/>
<script>
    function checkLoginAdmin(){
        var x = document.getElementById('checkLoginCno').value;
        if (x == null || x == "") {
            location.replace("warning-page");
        } else {
            var cadmin = document.getElementById('checkLoginCadmin').value;
            if (cadmin == "false") {
                location.replace("warning-page-admin");
            } else {
                var tagBody = document.getElementsByTagName('body');
                tagBody[0].style.display = 'block';
            }
        }
    }
</script>
