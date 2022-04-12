<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.julias.dbconnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
    String name = (String) session.getAttribute("session_name");
</jsp:scriptlet>


<html>
    <head>
        <meta charset="ISO-8859-1">
        <title> Contact Us </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/style1.css" />
        <link rel="stylesheet" type="text/css" href="css/style2.css" />
        
    </head>
    <body>
        <div class="container-fluid">
            <jsp:scriptlet>
                if( email == null ? email == null : email.trim().equals("null") )
                {
            </jsp:scriptlet>
                <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
                }
                else
                {
            </jsp:scriptlet>
                <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
            
            <jsp:include page="menubar.jsp"></jsp:include>

                <div class="row">
                    <img alt="Contact Us" src="images/contact_us_img.png" height="250" />
                </div>
                
                <div class="row">
                    <div class="col-md-2" id="mynavbar">
<!--                        <ul>
                            <li> <a href="https://learning.tcsionhub.in/hub/national-qualifier-test/"> <img alt="TCS" src="images/tcs.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.wipro.com/careers-home/jobs"> <img alt="Wipro" src="images/wipro.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://dxc.com/us/en/careers"> <img alt="DXC" src="images/dxc.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.infosys.com/careers/apply.html"> <img alt="Infosys" src="images/infosys.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.apple.com/careers/us/"> <img alt="Apple" src="images/apple.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Disney" src="images/disney.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="MasterCard" src="images/mastercard.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Nike" src="images/nike.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Puma" src="images/puma.jpg" height="100px" width="100px"> </a> </li> 
                        </ul>-->
                    </div>
                    <div class="col-md-8">
                        <br>
                        <div class="row">
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px #33ccff; border-radius: 10px;">
                                <div class="row">
                                    <div class="col-md-4" style="margin-top: 100px;">
                                        <span style="color: black; font-size: 16px;"> <i class="glyphicon glyphicon-home"> </i> &nbsp;&nbsp; Newtown , Industrial Area </span> <br>
                                        <p style="color: #cccccc;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kolkata , West Bengal , 700135 </p>
                                        <br>
                                        
                                        <span style="color: black; font-size: 16px;"> <i class="glyphicon glyphicon-earphone"> </i> &nbsp;&nbsp; +91 6294160823 </span> <br>
                                        <p style="color: #cccccc;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mon to Sat - 9am to 8 pm </p>
                                        <br>
                                        <span style="color: black; font-size: 16px;"> <i class="glyphicon glyphicon-envelope"> </i> &nbsp;&nbsp; juliasbiswas0001@gmail.com </span> <br>
                                        <p style="color: #cccccc;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Send us your query anytime! </p>
                                        <br>
                                    </div>
                                    <div class="col-md-8">
                                        <form method="POST" action="ContactUs">
                                            <strong style="font-size: 30px; margin-left: 70px;"> Contact Us </strong> <br><br>
                                            
                                            <jsp:scriptlet>
                                                if( ( name == null || name.equals("null") ) || ( email == null || email.equals("null")))
                                                {
                                            </jsp:scriptlet>
                                                    <input type="text" placeholder="Enter Name" name="name1" class="reglog_tf_design" value="" />  <br> <br>
                                                    <input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design" value="" />  <br> <br>
                                                    <input type="text" placeholder="Enter Subject" name="subject1" class="reglog_tf_design" />  <br> <br>
                                                    <textarea class="reglog_ta_design" placeholder="Enter Message" name="message1"></textarea> <br><br>
                                                    <input type="submit" value="Send" class="btn btn-primary search_btn" style="margin-left: 180px;" /> <br><br>
                                            <jsp:scriptlet>
                                                }
                                                else
                                                {
                                            </jsp:scriptlet>
                                                    <input type="text" placeholder="Enter Name" name="name1" class="reglog_tf_design" value="<jsp:expression>name</jsp:expression>" readonly="" />  <br> <br>
                                                    <input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design" value="<jsp:expression>email</jsp:expression>" readonly="" />  <br> <br>
                                                    <input type="text" placeholder="Enter Subject" name="subject1" class="reglog_tf_design" />  <br> <br>
                                                    <textarea class="reglog_ta_design" placeholder="Enter Message" name="message1"></textarea> <br><br>
                                                    <input type="submit" value="Send" class="btn btn-primary search_btn" style="margin-left: 180px;" /> <br><br>
                                            <jsp:scriptlet>
                                                }
                                            </jsp:scriptlet>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>
                                    
                    <div class="col-md-2" id="mynavbar">
<!--                        <ul>
                            <li> <a href="https://careers.google.com/"> <img alt="Google" src="images/google.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.microsoft.com/us/en"> <img alt="Microsoft" src="images/microsoft.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.cognizant.com/in/en"> <img alt="Cognizant" src="images/cognizant.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.capgemini.com/in-en/careers/"> <img alt="Capgemini" src="images/capgemini.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://jobs.hp.com/"> <img alt="HP" src="images/hp.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://careers.nokia.com/"> <img alt="Nokia" src="images/nokia.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.ibm.com/in-en/employment/"> <img alt="IBM" src="images/ibm.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.bmwgroup.com/en/careers.html"> <img alt="BMW" src="images/bmw.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.mercedes-benz.co.in/passengercars/the-brand/career.html"> <img alt="Mercedes" src="images/mercedes.jpg" height="100px" width="100px" > </a> </li>
                        </ul>-->
                    </div>
                </div>
                                    
                <div class="row">
                    <div class="col-md-2">
                        
                    </div>
                    <div class="col-md-8">
                        <div >
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d117881.97795578027!2d88.42276055496542!3d22.586140768952912!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a0275350398a5b9%3A0x75e165b244323425!2sNewtown%2C%20Kolkata%2C%20West%20Bengal!5e0!3m2!1sen!2sin!4v1639499130856!5m2!1sen!2sin" width="100%" height="400" style="border:0; border-radius: 15px;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>
                    <div class="col-md-2">
                        
                    </div>
                </div>
                <br>                     
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>