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
        <title>Job Portal Website </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        
        <script>
            
            // Search with Technology
            function val(tech)
            {
                //alert(tech);
                
                var obj ;
                
                // 1. create an XMLHttpRequest object
                if( window.XMLHttpRequest )
                {
                    // For latest browser
                    obj = new XMLHttpRequest();        
                }
                else
                {
                    // For old IE browser like IE5 , IE6 etc
                    obj = new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                // 2. Specifies the request
                obj.open("POST" , "SimpleJobSearch?technology="+tech , true);
                
                // 3. send the request to the server
                obj.send();
                
                // 4. onreadystatechange - Defines a function to be called when the readystate property changes
                obj.onreadystatechange = function()
                {
                    if( obj.readyState === 4 && obj.status === 200 )
                    {
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
                
            }
            
            // Search with Location
            function searchJobByLocation(location)
            {
                var obj ;
                
                // 1. create an XMLHttpRequest object
                if( window.XMLHttpRequest )
                {
                    // For latest browser
                    obj = new XMLHttpRequest();        
                }
                else
                {
                    // For old IE browser like IE5 , IE6 etc
                    obj = new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                // 2. Specifies the request
                obj.open("POST" , "SimpleJobSearchWithLocation?location="+location , true);
                
                // 3. send the request to the server
                obj.send();
                
                // 4. onreadystatechange - Defines a function to be called when the readystate property changes
                obj.onreadystatechange = function()
                {
                    if( obj.readyState === 4 && obj.status === 200 )
                    {
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
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

                <!-- Search Job division Starts -->
                <div class="row">
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-8 job_search_div">
                        <strong style="font-size: 22px;"> Find A Job at India's No.1 Job Site... </strong> <br> <br>
                        <input type="text" placeholder="Search with Technology..." class="textfield_design" style="width: 450px;" onkeyup="val(this.value)" /> <br> <br>
                        <b style="font-size: 25px; color: #626222; "> OR </b> <br><br>
                        <input type="text" placeholder="Search with Location..." class="textfield_design" style="width: 450px;" onkeyup="searchJobByLocation(this.value)" /> <br>
                    </div>
                    <div class="col-md-2">

                    </div>
                </div>
                <!-- Search Job division Ends -->

                <div class="row">
                    <div class="col-md-3" id="mynavbar">
                        <ul>
                            <li> <a href="https://learning.tcsionhub.in/hub/national-qualifier-test/"> <img alt="TCS" src="images/tcs.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.wipro.com/careers-home/jobs"> <img alt="Wipro" src="images/wipro.jpg" height="100px" width="100px"> </a> </li> 
<!--                            <li> <a href="https://dxc.com/us/en/careers"> <img alt="DXC" src="images/dxc.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.infosys.com/careers/apply.html"> <img alt="Infosys" src="images/infosys.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.apple.com/careers/us/"> <img alt="Apple" src="images/apple.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Disney" src="images/disney.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="MasterCard" src="images/mastercard.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Nike" src="images/nike.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Puma" src="images/puma.jpg" height="100px" width="100px"> </a> </li> 
                        </ul>-->
                    </div>
                    <div class="col-md-6" style="background-color: #e6ffff;">
                        <div class="row">
                            
                            <span id="respgenerated"> No Result Found </span>
                            
                        </div>
                    </div>
                    <div class="col-md-3" id="mynavbar">
                        <ul>
                            <li> <a href="https://careers.google.com/"> <img alt="Google" src="images/google.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.microsoft.com/us/en"> <img alt="Microsoft" src="images/microsoft.jpg" height="100px" width="100px"> </a> </li> 
<!--                            <li> <a href="https://careers.cognizant.com/in/en"> <img alt="Cognizant" src="images/cognizant.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.capgemini.com/in-en/careers/"> <img alt="Capgemini" src="images/capgemini.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://jobs.hp.com/"> <img alt="HP" src="images/hp.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://careers.nokia.com/"> <img alt="Nokia" src="images/nokia.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.ibm.com/in-en/employment/"> <img alt="IBM" src="images/ibm.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.bmwgroup.com/en/careers.html"> <img alt="BMW" src="images/bmw.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.mercedes-benz.co.in/passengercars/the-brand/career.html"> <img alt="Mercedes" src="images/mercedes.jpg" height="100px" width="100px" > </a> </li>
                        </ul>-->
                    </div>
                </div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>