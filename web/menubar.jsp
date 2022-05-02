<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:scriptlet>
    
    String email = (String) session.getAttribute("session_email");
    
</jsp:scriptlet>

<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>  </title>
    </head>
    <body>
        <div class="row menubardiv" >
            <div class="col-md-6" id="mynavbar">
                <ul>
                    <li> <a href="simple-job-search.jsp" class="menubar_div_design_hyperlink"> Search Job </a> </li>
                    <li> <a href="companies.jsp" class="menubar_div_design_hyperlink"> Companies </a> </li>
                    <jsp:scriptlet>
                        if( email == null ? email == null : email.trim().equals("null") )
                        {
                    </jsp:scriptlet>
                        <!--    Nothing to print -->
                    <jsp:scriptlet>
                        }
                        else
                        {
                    </jsp:scriptlet>
                        <li> <a href="my-applied-jobs.jsp" class="menubar_div_design_hyperlink"> My Applied Jobs </a> </li>
                    <jsp:scriptlet>
                        }
                    </jsp:scriptlet>
                </ul>
            </div>
            <div class="col-md-6" id="mynavbar" >
                <ul>
                    <li> <a href="index.jsp" class="menubar_div_design_hyperlink"> Home </a> </li>
                    <li> <a href="about-us.jsp" class="menubar_div_design_hyperlink"> About Us </a> </li>
                    <li> <a href="our_teams.jsp" class="menubar_div_design_hyperlink"> Our Teams </a> </li>
                    <li> <a href="contact-us.jsp" class="menubar_div_design_hyperlink"> Contact Us </a> </li>
                </ul>
            </div>
        </div>
    </body>
</html>