<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.julias.dbconnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:declaration>

 String jobid;

</jsp:declaration>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
    
    jobid = request.getParameter("id");
    
</jsp:scriptlet>


<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Job Description </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        
        <link rel="stylesheet" type="text/css" href="css/style.css" />
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
                    <div class="col-md-3" id="mynavbar">
                        <ul>
                            <!-- <li> <a href="https://learning.tcsionhub.in/hub/national-qualifier-test/"> <img alt="TCS" src="images/tcs.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.wipro.com/careers-home/jobs"> <img alt="Wipro" src="images/wipro.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://dxc.com/us/en/careers"> <img alt="DXC" src="images/dxc.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.infosys.com/careers/apply.html"> <img alt="Infosys" src="images/infosys.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.apple.com/careers/us/"> <img alt="Apple" src="images/apple.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Disney" src="images/disney.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="MasterCard" src="images/mastercard.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Nike" src="images/nike.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Puma" src="images/puma.jpg" height="100px" width="100px"> </a> </li> -->
                        </ul>
                    </div>
                    <div class="col-md-6" style="background-color: #e6ffff;">
                        <div class="row">
                        <jsp:scriptlet>
                        
                            String job_profile = "" , company = "" , experience = "" , salary = "" , job_location = "" , description = "" , date1 = "" , time1 = "" , no_of_openings = "" , time_venue = "" , c_email = "" , c_person_name = "" , c_person_profile = "" , c_phone_no = "" , skills = "" , role = "" , industry_type = "" , functional_area = "" , employment_type = "" , education = "" ;
                        
                            Connection con = null ;
                            
                            try
                            {
                                con = DBConnection.getConnect();
                                
                                PreparedStatement ps = con.prepareStatement("SELECT * FROM jobs WHERE id=?");
                                
                                ps.setString(1, jobid);
                                
                                ResultSet rs = ps.executeQuery();
                                
                                if( rs.next() )
                                {
                                    job_profile = rs.getString("job_profile");
                                    company = rs.getString("company");
                                    experience = rs.getString("experience");
                                    salary = rs.getString("salary");
                                    job_location = rs.getString("job_location");
                                    description = rs.getString("description");
                                    no_of_openings = rs.getString("no_of_openings");
                                    time_venue = rs.getString("time_venue");
                                    c_email = rs.getString("c_email");
                                    c_person_name = rs.getString("c_person_name");
                                    c_person_profile = rs.getString("c_person_profile");
                                    c_phone_no = rs.getString("c_phone_no");
                                    date1 = rs.getString("date1");
                                    time1 = rs.getString("time1");
                                    skills = rs.getString("skills");
                                    role = rs.getString("role");
                                    industry_type = rs.getString("industry_type");
                                    functional_area = rs.getString("functional_area");
                                    employment_type = rs.getString("employment_type");
                                    education = rs.getString("education");
                                    
                        </jsp:scriptlet>
                            
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                <b style="font-size: 20px; color: blue;"> <jsp:expression>job_profile</jsp:expression> </b> <span style="color: #6cd1fb; float: right;"> (<jsp:expression>date1</jsp:expression> &&nbsp;<jsp:expression>time1</jsp:expression>) </span>  <br>
                                <span> <i class='fas fa-building'></i> <jsp:expression>company</jsp:expression> </span> <br>
                                <span> <i class="glyphicon glyphicon-briefcase"></i> <jsp:expression>experience</jsp:expression> </span> <br>
                                <span> <i class="fa fa-inr"></i> <jsp:expression>salary</jsp:expression> </span> <br>
                                <span> <i class="glyphicon glyphicon-map-marker"></i> <jsp:expression>job_location</jsp:expression> </span><br>
                                <span> <span style="color: #999999;"> No Of Openings : </span> <jsp:expression>no_of_openings</jsp:expression>  </span> <br>
                                
                                <jsp:scriptlet>
                                    if( email == null ? email == null : email.trim().equals("null") )
                                    {
                                </jsp:scriptlet>
                                    <a href="login.jsp"> <input type="submit" value="Login to Apply" class="btn btn-primary" style="float: right;" /> </a>
                                <jsp:scriptlet>
                                    }
                                    else
                                    {
                                        Connection con1 = null ;
                                        
                                        try
                                        {
                                            con1 = DBConnection.getConnect();
                                            
                                            PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM applied_jobs WHERE email=? AND jobid=?");
                                            
                                            ps1.setString(1, email);
                                            ps1.setString(2, jobid);
                                            
                                            ResultSet rs1 = ps1.executeQuery();
                                            
                                            if( rs1.next() )
                                            {
                                                </jsp:scriptlet>
                                                    
                                                    <strong class="" style="float: right; color: #339900; border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 5px; padding: 5px;"> Already Applied To This Job </strong>
                                                    
                                                    <br><br>
                                                    
                                                    <form action="DeleteMyJobApplication" method="POST">
                                                        <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid" />
                                                        <input type="submit" value="Delete Applied This Jobs" class="btn btn-danger" style="float: right;" />
                                                    </form>
                                    
                                                <jsp:scriptlet>
                                            }
                                            else
                                            {
                                                </jsp:scriptlet>
                                                    
                                                    <form action="ApplyForJob" method="POST">
                                                        <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jid" />
                                                        <input type="submit" value="Apply" class="btn btn-primary" style="float: right;" />
                                                    </form>
                                                    
                                                <jsp:scriptlet>
                                            }
                                            
                                        }
                                        catch(Exception e)
                                        {
                                            out.print(e);
                                        }
                                        finally
                                        {
                                            try
                                            {
                                                con1.close();
                                            }
                                            catch(Exception ee)
                                            {
                                                out.print(ee);
                                            }
                                        }
                                </jsp:scriptlet>
                                    
                                    
                                    
                                <jsp:scriptlet>
                                    }
                                </jsp:scriptlet>
                                
                            </div>
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                <b style="font-size: 20px; color: #0099ff;"> Job Description </b> <br>
                                <span> <jsp:expression>description</jsp:expression> </span> <br>
                                <span> Job Role : <jsp:expression>job_profile</jsp:expression> </span> <br>
                                <span> Job Location : <jsp:expression>job_location</jsp:expression> </span> <br>
                                <span> Job Experience : <jsp:expression>experience</jsp:expression> </span> <br>
                                <span> Salary : <jsp:expression>salary</jsp:expression> </span> <br>
                                <span> Skills Required : <jsp:expression>skills</jsp:expression> </span> <br>
                                <span> Call Us : <jsp:expression>c_phone_no</jsp:expression> </span><br>
                                
                                <br><br>
                                
                                <span> <span style="color: #999999;"> Role : </span> <jsp:expression>role</jsp:expression> </span><br>
                                <span> <span style="color: #999999;"> Industry Type : </span> <jsp:expression>industry_type</jsp:expression> </span><br>
                                <span> <span style="color: #999999;"> Functional Area : </span> <jsp:expression>functional_area</jsp:expression> </span><br>
                                <span> <span style="color: #999999;"> Employment Type : </span> <jsp:expression>employment_type</jsp:expression> </span><br>
                                <span> <span style="color: #999999;"> Role Category : </span> <jsp:expression>role</jsp:expression> </span><br>
                                
                                <br>
                                <b> Education </b> <br>
                                <span> <span style="color: #999999;"> UG : </span> <jsp:expression>education</jsp:expression> </span><br>
                                
                                <br>
                                <b> Key Skills </b> <br>
                                <jsp:expression>skills</jsp:expression>
                                
                            </div>
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                <b style="font-size: 20px; color: #0099ff;"> Contact Us </b> <br>
                                <span> Location :  <jsp:expression>time_venue</jsp:expression> </span><br>
                                <span> Name : <jsp:expression>c_person_name</jsp:expression> (<jsp:expression>c_person_profile</jsp:expression>) </span><br>
                                <span> Email : <jsp:expression>c_email</jsp:expression> </span><br>
                                <span> Call Us : <jsp:expression>c_phone_no</jsp:expression> </span><br>   
                            </div>
                            
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                <b style="font-size: 20px; color: #0099ff;"> About Company </b> <br>
                                &nbsp;<jsp:expression>industry_type</jsp:expression>
                            </div>
                            
                        <jsp:scriptlet>
                                }
                                
                            }
                            catch(Exception e)
                            {
                                out.print(e);
                            }
                            finally
                            {
                                try
                                {
                                    con.close();
                                }
                                catch(Exception ee)
                                {
                                    out.print(ee);
                                }
                            }
                        </jsp:scriptlet>
                        </div>
                    </div>
                    <div class="col-md-3" id="mynavbar">
                        <ul>
                            <!-- <li> <a href="https://careers.google.com/"> <img alt="Google" src="images/google.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.microsoft.com/us/en"> <img alt="Microsoft" src="images/microsoft.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.cognizant.com/in/en"> <img alt="Cognizant" src="images/cognizant.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.capgemini.com/in-en/careers/"> <img alt="Capgemini" src="images/capgemini.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://jobs.hp.com/"> <img alt="HP" src="images/hp.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://careers.nokia.com/"> <img alt="Nokia" src="images/nokia.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.ibm.com/in-en/employment/"> <img alt="IBM" src="images/ibm.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.bmwgroup.com/en/careers.html"> <img alt="BMW" src="images/bmw.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.mercedes-benz.co.in/passengercars/the-brand/career.html"> <img alt="Mercedes" src="images/mercedes.jpg" height="100px" width="100px" > </a> </li> -->
                        </ul>
                    </div>
                </div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>