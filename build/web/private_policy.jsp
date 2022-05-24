<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.julias.dbconnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
</jsp:scriptlet>


<html>
    <head>
        <meta charset="ISO-8859-1">
        <title> Job Portal - Privacy Policy </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <div class="container-fluid">
            <jsp:scriptlet>
                if (email == null ? email == null : email.trim().equals("null")) {
            </jsp:scriptlet>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
            } else {
            </jsp:scriptlet>
            <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>

            <jsp:include page="menubar.jsp"></jsp:include>

                <!-- Search Job division Starts -->
                <div class="row">
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-8 job_search_div">
                        <div class="row">
                            <div class="col-md-6">
                                <img alt="Our Teams" src="images/private_policy.png" height="250" width="400" style="background-color: #ffffff; border-radius: 10px;" />
                            </div>
                            <div class="col-md-6">
                                <img alt="Our Teams Members" src="images/private_policys.jpg" height="300" width="400" style="background-color: #ffffff; border-radius: 10px;" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">

                    </div>
                </div>
                <!-- Search Job division Ends -->

                <div class="row">
                    <div class="col-md-2 col-sm-2">
                        
                    </div>
                    <div class="col-md-8 col-sm-8 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;" >
                        
                        <center> <b style="font-size: 38px; color: #339900; text-decoration: underline;"> Privacy Policy </b> </center>
                        
                        <br><br>
                        
                        <p class="note-text-div-design">
                            Job Portal (<a href="index.jsp">www.JobPortal.com</a>) is safe website for every user who are freshers and experience persons.
                            We cannot share user personal data with any third party side. Here user
                            can create their account easily and searching many jobs according to their
                            skills and easy to apply. If user are not interested with any jobs then user
                            can withdraw this jobs easily. We don't have any money to create an account
                            or apply for any jobs.
                            We recommend that customer sends us a query/grievance by login in his
                            JobPortal.com account and using the 'Help and Support' section. It is 
                            also recommended that the customer writes his complaint reference number
                            provided by our customer care team in all further communication with us 
                            regarding a particular issue. This enables us to get more details about
                            the customer and the query quickly and helps to resolve the query faster.
                            THANK YOU <span style="font-size: 18px;"> &#128591; </span>
                        </p>
                        
                    </div>
                    <div class="col-md-2 col-sm-2">
                        
                    </div>
                </div>
                
                <br><br><br>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>