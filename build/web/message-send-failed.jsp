<%-- 
    Document   : registerSuccess
    Created on : 5 Dec, 2021, 9:32:31 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>  </title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <jsp:scriptlet>
            String message = (String) request.getAttribute("failed_message");
        </jsp:scriptlet>
        <div class="alert alert-danger alert-dismissible show" style="text-align: center;" role="alert">
            <strong> ERROR : </strong> <jsp:expression> message </jsp:expression>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </body>
</html>

