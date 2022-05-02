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
        <title> Job Portal - Term & Conditions </title>
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

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-1">

                            </div>
                            <div class="col-md-10 term-condition-box-color-div-design">
                                <div class="row">
                                    <div class="col-md-3">

                                    </div>
                                    <div class="col-md-6">
                                        <center> <strong  style="font-size: 35px; color: #009900; padding: 15px; text-decoration: underline;"> Terms & Conditions </strong> </center>
                                    </div>
                                    <div class="col-md-3">

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10">
                                        <p class="paragraph_one_div_design">
                                            <a href="index.jsp"> JobPortal.com </a> , (hereinafter referred to as '<a href="index.jsp">JobPortal.com</a>'), 
                                            committed to protecting our customer's personal information, we value your trust & respect your privacy.
                                            We have created this Privacy Policy to help you understand how we collect, use and protect your 
                                            information when you visit our web, <a href="index.jsp">JobPortal.com</a> WAP sites and use our 
                                            services. If you do not agree to the terms of the policy, please do not use or access 
                                            <a href="index.jsp">JobPortal.com</a> website, WAP site or mobile applications.
                                        </p>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-1">

                                    </div>
                                    <div class="col-md-10">
                                        <b class="bold-text-color-div-design">
                                            As per laws and regulations applicable in India,
                                            this policy is just for your information and is 
                                            not intended to limit or exclude your rights.
                                        </b> <br><br>
                                        <b class="bold-text-color-div-design">
                                            1. One Email ID One Registration Allowed. <br><br>
                                            
                                            2. You can't apply any jobs without Registration and Login. <br><br>
                                            
                                            3. User must be upload their Profile Picture, Title, Education. <br><br>

                                            4. If User have Resume then he can upload her resume in our website, otherwise if User have not
                                               Resume, then User make a Resume from Our website. <br><br>
                                            
                                            5. If User have any years of experience then he/she can upload their experience, 
                                               otherwise he/she is fresher.  <br><br>   
                                               
                                            6. One User can be apply more than one jobs. <br><br>

                                            7. If You already apply one job then you can't re-apply this job. <br><br>

                                            8. If User already apply one job then he/she want to withdraw this job, it is
                                               easy to withdraw. <br><br>

                                            9. User can searching jobs according to their Technology or Location. <br><br>

                                            10. Multiple User can be access our website at a time. <br>
                                        </b> <br>
                                        <span> *You can't apply any jobs without Registration. </span>
                                    </div>
                                    <div class="col-md-1">

                                    </div>
                                </div>
                                
                                <br><br>
                                
                                <div class="row">
                                    <div class="col-md-1">
                                        
                                    </div>
                                    <div class="col-md-10">
                                        <strong class="strong-text-div-design"> Note :  </strong> <br>
                                        <p class="note-text-div-design">
                                            We recommend that customer sends us a query/grievance by login in his
                                            JobPortal.com account and using the 'Help and Support' section. It is 
                                            also recommended that the customer writes his complaint reference number
                                            provided by our customer care team in all further communication with us 
                                            regarding a particular issue. This enables us to get more details about
                                            the customer and the query quickly and helps to resolve the query faster. 
                                        </p>
                                    </div>
                                    <div class="col-md-1">
                                        
                                    </div>
                                </div>
                                
                            </div>
                            <div class="col-md-1">

                            </div>
                        </div>
                    </div>
                </div>

                <br><br><br>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>