<%-- 
    Document   : profileheader
    Created on : 5 Dec, 2021, 5:03:19 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String pass = (String) session.getAttribute("session_pass");
    String gender = (String) session.getAttribute("session_gender");
    String fields = (String) session.getAttribute("session_field");
    String city = (String) session.getAttribute("session_city");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title> Welcome : <jsp:expression> name </jsp:expression> </title>
    </head>
    <body>
        <div class="row header_bg">
            <div class="col-md-4">
                <a href="index.jsp">
                    <img alt="Logo Image" src="images/job_portal_logo2.jpg" height="50" style="border-radius: 30%;" >
                    <span class="logo_text_design">Job Portal</span>
                </a>
            </div>
            <div class="col-md-7">
                <strong style="font-size: 25px; color: white; text-align: center;"> Welcome : </strong> <a href="profile.jsp" class="another_hyperlink"> <span style="font-size: 25px; color: white;"> <jsp:expression> name</jsp:expression> </span> </a>
            </div>
            <div class="col-md-1">
                <a href="Logout" class="hyperlinks_design" style="font-size: 18px;">Logout </a> 
            </div>		
        </div>
    </body>
</html>
