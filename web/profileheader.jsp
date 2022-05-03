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
    String profile_pic = (String) session.getAttribute("session_profilepic");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title> Job Portal - Welcome : <jsp:expression> name </jsp:expression> </title>
    </head>
    <body>
        <div class="row header_bg">
            <div class="col-md-4">
                <a href="index.jsp" title="Go To Home Page">
                    <img alt="Logo Image" src="images/job_portal_logo.jpg" width="65" height="65" class="logo_img_design" >
                </a>
                <a href="index.jsp" title="Go To Home Page" class="logo_name_design">Job Portal</a>
            </div>
            <div class="col-md-6">
                <strong style="font-size: 24px; color: #ffffff; font-weight: 800;"> Welcome : </strong> <strong style="font-size: 24px; color: #ffffff;"> <a title="Click Here Then Go To My Profile" class="user-name-after-login" href="profile.jsp" style="color: #ffffff; text-decoration: none;"> <img alt="" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="60" width="60" style="border: 0px solid #cccccc; border-radius: 50%; image-resolution: normal;" /> <jsp:expression>name</jsp:expression> </a> </strong>
            </div>
            <div class="col-md-2">
                
                <a href="Logout"> <button class="menubar_design menubar_design_button"> <span class="glyphicon glyphicon-log-out"></span> Logout </button> </a> 
                
            </div>		
        </div>
    </body>
</html>
