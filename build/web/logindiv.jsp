<%-- 
    Document   : logindiv
    Created on : 4 Dec, 2021, 9:09:45 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Login Page </title>
    </head>
    <body>
        <br><br>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-8 reg_div_design">
                <form method="POST" action="login">

                    <strong style="font-size: 30px; font-style: italic;"> Login Here </strong> <br><br>

                    <input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design" />  <br> <br>
                    <input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design" />  <br> <br>
                    <input type="checkbox" value="rememberme" name="rememberme1" /> Remember Me <br><br>
                    <input type="submit" value="Login" class="btn btn-primary search_btn" /> <br>				

                    <strong> OR </strong><br>

                    <strong> New User <a href="register.jsp" style="font-size: 15px; text-decoration: none;"> Register Now</a> </strong>
                </form>
            </div>
            <div class="col-md-2">
                
            </div>
        </div>
        <br><br>
    </body>
</html>
