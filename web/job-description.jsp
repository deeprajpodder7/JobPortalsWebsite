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
        <title> Job Portal - Job Description </title>
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

            <div class="row" style="background-color: #fff3ff;">
                    <div class="col-md-3" id="mynavbar">
                        <ul>
                            
                        </ul>
                    </div>
                    <div class="col-md-6">
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
                                <b style="font-size: 25px; color: blue;"> <jsp:expression>job_profile</jsp:expression> </b> <span style="color: #6cd1fb; float: right; font-size: 18px;"> (<jsp:expression>date1</jsp:expression> &&nbsp;<jsp:expression>time1</jsp:expression>) </span>  <br>
                                <span style="font-size: 20px; color: black;"> <i class='fas fa-building'></i> <jsp:expression>company</jsp:expression> </span> <br>
                                <span style="font-size: 20px; color: black;"> <i class="glyphicon glyphicon-briefcase"></i> <jsp:expression>experience</jsp:expression> </span> <br>
                                <span style="font-size: 20px; color: black;"> <i class="fa fa-inr"></i> <jsp:expression>salary</jsp:expression> </span> <br>
                                <span style="font-size: 20px; color: black;"> <i class="glyphicon glyphicon-map-marker"></i> <jsp:expression>job_location</jsp:expression> </span><br>
                                <span style="font-size: 20px; color: black;"> <span style="color: #999999;"> No Of Openings : </span> <jsp:expression>no_of_openings</jsp:expression>  </span> <br>
                                
                                <jsp:scriptlet>
                                    if( email == null ? email == null : email.trim().equals("null") )
                                    {
                                </jsp:scriptlet>
                                    <a href="login.jsp"> <input type="submit" value="Login to Apply" class="btn btn-primary" style="float: right; font-size: 22px;" /> </a>
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
                                                        <input type="submit" value="Withdraw This Job" class="btn btn-danger" style="float: right; font-size: 22px;" />
                                                    </form>
                                    
                                                <jsp:scriptlet>
                                            }
                                            else
                                            {
                                                </jsp:scriptlet>
                                                    
                                                    <form action="ApplyForJob" method="POST">
                                                        <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jid" />
                                                        <input type="submit" value="Apply This Job" class="btn btn-primary" style="float: right; font-size: 22px;" />
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
                                <b style="font-size: 25px; color: #0099ff;"> Job Description </b> <br>
                                <span style="font-size: 20px; color: black;"> <jsp:expression>description</jsp:expression> </span> <br>
                                <span style="font-size: 20px; color: black;"> Job Role : <jsp:expression>job_profile</jsp:expression> </span> <br>
                                <span style="font-size: 20px; color: black;"> Job Location : <jsp:expression>job_location</jsp:expression> </span> <br>
                                <span style="font-size: 20px; color: black;"> Job Experience : <jsp:expression>experience</jsp:expression> </span> <br>
                                <span style="font-size: 20px; color: black;"> Salary : <jsp:expression>salary</jsp:expression> </span> <br>
                                <span style="font-size: 20px; color: black;"> Skills Required : <jsp:expression>skills</jsp:expression> </span> <br>
                                <span style="font-size: 20px; color: black;"> Call Us : <jsp:expression>c_phone_no</jsp:expression> </span><br>
                                
                                <br><br>
                                
                                <span style="font-size: 20px;"> <span style="color: #999999;"> Role : </span> <jsp:expression>role</jsp:expression> </span><br>
                                <span style="font-size: 20px;"> <span style="color: #999999;"> Industry Type : </span> <jsp:expression>industry_type</jsp:expression> </span><br>
                                <span style="font-size: 20px;"> <span style="color: #999999;"> Functional Area : </span> <jsp:expression>functional_area</jsp:expression> </span><br>
                                <span style="font-size: 20px;"> <span style="color: #999999;"> Employment Type : </span> <jsp:expression>employment_type</jsp:expression> </span><br>
                                <span style="font-size: 20px;"> <span style="color: #999999;"> Role Category : </span> <jsp:expression>role</jsp:expression> </span><br>
                                
                                <br>
                                <b style="font-size: 20px;"> Education </b> <br>
                                <span style="font-size: 20px;"> <span style="color: #999999;"> UG : </span> <jsp:expression>education</jsp:expression> </span><br>
                                
                                <br>
                                <b style="font-size: 20px;"> Key Skills </b> <br>
                                <span style="font-size: 20px;"> <jsp:expression>skills</jsp:expression> </span>
                                
                            </div>
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                <b style="font-size: 20px; color: #0099ff;"> Contact Us </b> <br>
                                <span style="font-size: 20px; color: black;"> Location :  <jsp:expression>time_venue</jsp:expression> </span><br>
                                <span style="font-size: 20px; color: black;"> Name : <jsp:expression>c_person_name</jsp:expression> (<jsp:expression>c_person_profile</jsp:expression>) </span><br>
                                <span style="font-size: 20px; color: black;"> Email : <jsp:expression>c_email</jsp:expression> </span><br>
                                <span style="font-size: 20px; color: black;"> Call Us : <jsp:expression>c_phone_no</jsp:expression> </span><br>   
                            </div>
                            
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                <b style="font-size: 20px; color: #0099ff;"> About Company </b> <br>
                                <span style="font-size: 20px; color: black;"> &nbsp;<jsp:expression>industry_type</jsp:expression> </span>
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
                            
                        </ul>
                    </div>
                </div>

            <br><br><br>                
                            
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>