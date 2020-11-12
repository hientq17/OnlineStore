<%-- 
    Document   : warning
    Created on : Jul 19, 2020, 1:14:42 AM
    Author     : MrEnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Warning</title>
        <LINK REL="SHORTCUT ICON" HREF="${pageContext.request.contextPath}/template/admin//img/favicon.png">
        <link href="${pageContext.request.contextPath}/template/admin//css/dialog-overlay.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background-image: url('${pageContext.request.contextPath}/template/admin//img/warning.jpg'); background-size: auto;;">
        <div class='dialog-ovelay'>
            <div class='dialog'>
                <header>
                    <h3>WARNING!!!</h3>
                    
                </header>
                <div class='dialog-msg'>
                    <p>Please login to continue</p>
                </div>
                <footer>
                    <div class='controls'>            
                        <button class='button button-danger' onclick="javascript:history.go(-1)">Cancel</button>  
                        <a href="login-page" class='button button-default' style="text-decoration: none">OK</a>
                    </div>
                </footer>
            </div>
        </div>
    </body>
</html>
