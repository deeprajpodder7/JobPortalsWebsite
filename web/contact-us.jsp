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
        <title> Job Portal - Contact Us </title>
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
        
        <script>

            function val(v)
            {
                document.getElementById(v).innerHTML = "";
            }

            function validation()
            {
                var flag = true;

                var name2 = document.contactusform.name1.value;
                var email2 = document.contactusform.email1.value;
                var subject2 = document.contactusform.subject1.value;
                var message2 = document.contactusform.message1.value;

                /*
                 * @type RegEx Validation using JavaScript
                 */
                var name_pattern = /^[a-zA-Z-0-9 ]{3,30}$/;
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var subject_pattern = /^[a-zA-Z-0-9 ]{3,100}$/;
                var message_pattern = /^[a-zA-Z-0-9 . , / ]{3,2500}$/;


                // --------------------- Validation Start -------------------------

                if (!name2.match(name_pattern))
                {
                    document.getElementById('name_error').innerHTML = "NAME IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (name2 === "")
                {
                    document.getElementById('name_error').innerHTML = "NAME CANNOT BE EMPTY";
                    flag = false;
                }

                if (!email2.match(email_pattern))
                {
                    document.getElementById('email_error').innerHTML = "EMAIL IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (email2 === "")
                {
                    document.getElementById('email_error').innerHTML = "EMAIL CANNOT BE EMPTY";
                    flag = false;
                }

                if (!subject2.match(subject_pattern))
                {
                    document.getElementById('subject_error').innerHTML = "SUBJECT IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (subject2 === "")
                {
                    document.getElementById('subject_error').innerHTML = "SUBJECT CANNOT BE EMPTY";
                    flag = false;
                }

                if (!message2.match(message_pattern))
                {
                    document.getElementById('message_error').innerHTML = "MESSAGE IS NOT PROPERLY FORMATED";
                    flag = false;
                }
                if (message2 === "")
                {
                    document.getElementById('message_error').innerHTML = "MESSAGE CANNOT BE EMPTY";
                    flag = false;
                }

                return flag;
            }

        </script>
        
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
                    <img alt="Contact Us" src="images/contact_us_img.png" height="500" />
                </div>
                
                <div class="row">
                    <div class="col-md-2" id="mynavbar">
                        
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
                                        <form method="POST" action="ContactUs" name="contactusform" onsubmit="return validation()">
                                            <strong style="font-size: 30px; margin-left: 70px;"> Contact Us </strong> <br><br>
                                            
                                            <jsp:scriptlet>
                                                if( ( name == null || name.equals("null") ) || ( email == null || email.equals("null")))
                                                {
                                            </jsp:scriptlet>
                                            
                                                    <input type="text" placeholder="Enter Name" name="name1" class="reglog_tf_design" onkeyup="val('name_error')" /> <br> <span id="name_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                                    <input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design" onkeyup="val('email_error')" /> <br> <span id="email_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                                    <input type="text" placeholder="Enter Subject" name="subject1" class="reglog_tf_design" onkeyup="val('subject_error')" /> <br> <span id="subject_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br> 
                                                    <textarea class="reglog_ta_design" placeholder="Enter Message" name="message1" onkeyup="val('message_error')"></textarea> <br> <span id="message_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                                    <input type="submit" value="Send" class="btn btn-primary search_btn" /> <br><br>
                                                    
                                            <jsp:scriptlet>
                                                }
                                                else
                                                {
                                            </jsp:scriptlet>
                                                    
                                                    <input type="text" placeholder="Enter Name" name="name1" class="reglog_tf_design" value="<jsp:expression>name</jsp:expression>" readonly="readonly" onkeyup="val('name_error')"/> <br> <span id="name_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br> <br>
                                                    <input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design" value="<jsp:expression>email</jsp:expression>" readonly="readonly" onkeyup="val('email_error')"/> <br> <span id="email_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br> <br>
                                                    <input type="text" placeholder="Enter Subject" name="subject1" class="reglog_tf_design" onkeyup="val('subject_error')" /> <br> <span id="subject_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br> <br>
                                                    <textarea class="reglog_ta_design" placeholder="Enter Message" name="message1" onkeyup="val('message_error')" ></textarea> <br> <span id="message_error" style="font-size: 12px; font-weight: bold; color: #ff0000;"> </span> <br><br>
                                                    <input type="submit" value="Send" class="btn btn-primary search_btn" /> <br><br>
                                                    
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
                  
            <br><br><br>    
                
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>