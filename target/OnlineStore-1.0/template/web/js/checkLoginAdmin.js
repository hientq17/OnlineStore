function checkLoginAdmin(){
    var x = document.getElementById('checkLoginCno').value;
    if (x == null || x == "") {
        location.replace("warning.jsp");
    } else {
        var cadmin = document.getElementById('checkLoginCadmin').value;
        if (cadmin == "false") {
            location.replace("warningAdmin.jsp");
        } else {
            var tagBody = document.getElementsByTagName('body');
            tagBody[0].style.display = 'block';
        }
    }
}