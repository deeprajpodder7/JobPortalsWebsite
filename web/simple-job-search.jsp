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
        <title> Job Portal - Search Jobs </title>
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

                <div class="row" style="background-color: #fff3ff;">
                    <div class="col-md-3" id="mynavbar">
                        
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            
                            <span id="respgenerated" style="font-size: 20px; color: black;"> No Result Found </span>
                            
                        </div>
                    </div>
                    <div class="col-md-3" id="mynavbar">
                         
                    </div>
                </div>

            <br><br><br>
                
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>