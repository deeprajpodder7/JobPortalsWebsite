<%-- 
    Document   : profile
    Created on : 4 Dec, 2021, 8:50:37 PM
    Author     : julia
--%>

<%@page import="com.julias.backend.PathDetails"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.julias.dbconnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:declaration>Connection con=null;</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String pass = (String) session.getAttribute("session_pass");
    String gender = (String) session.getAttribute("session_gender");
    String fields = (String) session.getAttribute("session_field");
    String profile_pic = (String) session.getAttribute("session_profilepic");
    if (fields == null || fields.equals("")) {
        fields = "--- Not Available ---";
    }
    String city = (String) session.getAttribute("session_city");
    String title = (String) session.getAttribute("session_title");
    if (title == null || title.equals("")) {
        title = "--- Not Available ---";
    }
    String skills = (String) session.getAttribute("session_skills");
    if (skills == null || skills.equals("")) {
        skills = "--- Not Available ---";
    }
</jsp:scriptlet>

<jsp:scriptlet>
    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Job Portal - Welcome : <jsp:expression> name</jsp:expression> </title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

            <link rel="stylesheet" type="text/css" href="css/style.css" />

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

            <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
            
        </head>
        <body>
            <div class="container-fluid">

            <jsp:include page="profileheader.jsp" ></jsp:include>
            <jsp:include page="menubar.jsp" ></jsp:include>

                <div class="row">
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-8">
                        <div class="row" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                            <div class="col-md-3">
                                <a href="edit-profile-pic.jsp"> <span style="font-size: 15px;  color: blue; float: right;" class="glyphicon glyphicon-pencil"> </span> </a>
                                <img alt="Image Not Found" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="200" style="border: 1px solid cyan; border-radius: 50%; color: red;" />
                            </div>
                            <div class="col-md-8">
                                <h3 style="color: blue;"> <jsp:expression> name.toUpperCase()</jsp:expression> </h3>

                                <b style="color: #cc0066"> <jsp:expression> title</jsp:expression> </b> <br> <br>
                            <b style="color: #999999"> Skills : </b> <span style="color: #cc0066"> <jsp:expression> skills</jsp:expression> </span> <br> <br>

                                <b style="color: #999999"> Email : </b> <jsp:expression> email</jsp:expression> <br> 
                            <b style="color: #999999"> Gender : </b> <jsp:expression> gender</jsp:expression> <br> 
                            <b style="color: #999999"> Fields : </b> <jsp:expression> fields</jsp:expression> <br> 
                            <b style="color: #999999"> City : </b> <jsp:expression> city</jsp:expression> <br> 
                            </div>
                            <div class="col-md-1">
                                <br> <a href="edit-profile-about.jsp"> <span style="font-size: 20px;  color: blue;" class="glyphicon glyphicon-pencil"> </span> </a>
                            </div>
                        </div>
                        <br><br>
                        <!--  Education Details  -->
                        <div class="row" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                            <div class="col-md-1">

                            </div>
                            <div class="col-md-10">
                                <h3> Education Details </h3>
                            <jsp:scriptlet>

                                String school = "", degree = "", field_of_study = "", start_month = "", start_year = "", end_month = "", end_year = "", grade = "", description = "", id = "";
                                String email2 = (String) session.getAttribute("session_email");
                                
                                try 
                                {
                                    con = DBConnection.getConnect();
                                    
                                    PreparedStatement ps = con.prepareStatement("SELECT * FROM education WHERE email='"+email2+"'");
                                    ResultSet rs = ps.executeQuery();
                                    
                                    while (rs.next())
                                    {
                                        id = rs.getString("id");
                                        school = rs.getString("school_college");
                                        degree = rs.getString("degree");
                                        field_of_study = rs.getString("field_of_study");
                                        start_month = rs.getString("start_month");
                                        start_year = rs.getString("start_year");
                                        end_month = rs.getString("end_month");
                                        end_year = rs.getString("end_year");
                                        grade = rs.getString("grade");
                                        description = rs.getString("description");
                            </jsp:scriptlet>

                            <div class="row" style="background-color: #ccffff">
                                <div class="col-md-3">
                                    <img alt="Education" src="images/education_icon.jpg" height="100" style="border-radius: 50%; margin-top: 50%; border: 1px solid #ffffcc;" />
                                </div>
                                <div class="col-md-8">
                                    <b style="color: #000099"> School/College : </b> &nbsp;&nbsp; <jsp:expression> school</jsp:expression> <br><br>
                                    <b style="color: #000099"> Degree's : </b> &nbsp;&nbsp; <jsp:expression> degree</jsp:expression> <br> <br>
                                    <b style="color: #000099"> Field of Study : </b> &nbsp;&nbsp; <jsp:expression> field_of_study</jsp:expression> <br> <br>
                                    <b style="color: #000099"> Start Month : </b> &nbsp;&nbsp; <jsp:expression> start_month</jsp:expression> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <b style="color: #000099"> Start Year : </b> &nbsp;&nbsp; <jsp:expression> start_year</jsp:expression> <br> <br>
                                    <b style="color: #000099"> End Month : </b> &nbsp;&nbsp; <jsp:expression> end_month</jsp:expression> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <b style="color: #000099"> End Year : </b> &nbsp;&nbsp; <jsp:expression> end_year</jsp:expression> <br> <br>
                                    <b style="color: #000099"> Grade : </b> &nbsp;&nbsp; <jsp:expression> grade</jsp:expression> <br> <br>
                                    <b style="color: #000099"> Description : </b> &nbsp;&nbsp; <jsp:expression> description</jsp:expression> <br> <br>
                                    </div>
                                    <div class="col-md-1">
                                        <!--  "edit-experience-details.jsp?id=id"  -->
                                        <a href="edit-profile-education.jsp?id=<jsp:expression>id</jsp:expression>"> <span style="font-size: 20px;  color: blue;" class="glyphicon glyphicon-pencil"> </span> </a>
                                    </div>
                                </div>
                                <br><br>

                            <jsp:scriptlet>
                                    }
                                }
                                catch (Exception e) 
                                {
                                    out.print(e);
                                }
                                finally
                                {
                                    try
                                    {
                                        con.close();
                                    }
                                    catch(Exception eee)
                                    {
                                        out.print(eee);
                                    }
                                }
                            </jsp:scriptlet>
                        </div>
                        <div class="col-md-1">
                            <a href="add-profile-education.jsp"> <span style="font-size: 20px;  color: blue;" class="glyphicon glyphicon-plus"> </span> </a>
                        </div>
                    </div>
                    <br><br>
                    <!--  Experience Details  -->
                    <div class="row" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                        <div class="col-md-1">

                        </div>
                        <div class="col-md-10">
                            <h3> Experience Details </h3>
                            <jsp:scriptlet>

                                String company1 = "", location1 = "" , start_month1 = "", start_year1 = "", end_month1 = "", end_year1 = "", employement_type1 = "", description1 = "", id1 = "";
                                
                                try 
                                {
                                    
                                    con = DBConnection.getConnect();
                                    
                                    PreparedStatement ps = con.prepareStatement("SELECT * FROM experience WHERE email='"+email+"'");
                                    ResultSet rs = ps.executeQuery();
                                    
                                    while (rs.next())
                                    {
                                        id1 = rs.getString("id");
                                        company1 = rs.getString("company");
                                        location1 = rs.getString("location");
                                        start_month1 = rs.getString("start_month");
                                        start_year1 = rs.getString("start_year");
                                        end_month1 = rs.getString("end_month");
                                        end_year1 = rs.getString("end_year");
                                        employement_type1 = rs.getString("employement_type");
                                        description1 = rs.getString("description");
                            </jsp:scriptlet>

                            <div class="row" style="background-color: #ccffff">
                                <div class="col-md-3">
                                    <img alt="Experience" src="images/work_experience.png" height="100" style="border-radius: 50%; margin-top: 50%; border: 1px solid #ccffcc;" />
                                </div>
                                <div class="col-md-8">
                                    <b style="color: #000099"> Company : </b> &nbsp;&nbsp; <jsp:expression> company1</jsp:expression> <br><br>
                                    <b style="color: #000099"> Location : </b> &nbsp;&nbsp; <jsp:expression> location1</jsp:expression> <br> <br>
                                    <b style="color: #000099"> Start Month : </b> &nbsp;&nbsp; <jsp:expression> start_month1</jsp:expression> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <b style="color: #000099"> Start Year : </b> &nbsp;&nbsp; <jsp:expression> start_year1</jsp:expression> <br> <br>
                                    <b style="color: #000099"> End Month : </b> &nbsp;&nbsp; <jsp:expression> end_month1</jsp:expression> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <b style="color: #000099"> End Year : </b> &nbsp;&nbsp; <jsp:expression> end_year1</jsp:expression> <br> <br>
                                    <b style="color: #000099"> Employment Type : </b> &nbsp;&nbsp; <jsp:expression> employement_type1</jsp:expression> <br> <br>
                                    <b style="color: #000099"> Description : </b> &nbsp;&nbsp; <jsp:expression> description1</jsp:expression> <br> <br>
                                    </div>
                                    <div class="col-md-1">
                                        <!--  "edit-experience-details.jsp?id1=id1"  -->
                                        <a href="edit-experience-details.jsp?id1=<jsp:expression>id1</jsp:expression>"> <span style="font-size: 20px;  color: blue;" class="glyphicon glyphicon-pencil"> </span> </a>
                                    </div>
                                </div>
                                <br><br>

                            <jsp:scriptlet>
                                    }
                                } 
                                catch (Exception e)
                                {
                                    out.print(e);
                                }
                                finally
                                {
                                    try
                                    {
                                        con.close();
                                    }
                                    catch(Exception eee)
                                    {
                                        out.print(eee);
                                    }
                                }
                            </jsp:scriptlet>
                        </div>
                        <div class="col-md-1">
                            <a href="add-experience-details.jsp"> <span style="font-size: 20px;  color: blue;" class="glyphicon glyphicon-plus"> </span> </a>
                        </div>
                    </div>
                    <br><br>
                    
                    <div class="row"style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                        
                        <div class="col-md-1">
                            
                        </div>
                        <div class="col-md-10">
                            <h3> Resume Details </h3>
                            <div class="row" style="background-color: #ccffff;">
                                <div class="col-md-11">
                                    <a href="upload-resume.jsp" > <span style="font-size: 15px;  color: blue;" class="glyphicon glyphicon-plus"> </span> Upload Resume </a>
                                    
                                    <jsp:scriptlet>
                                    
                                        String file_name = null ;
                                    
                                        try
                                        {
                                            Connection con = DBConnection.getConnect();
                                            
                                            PreparedStatement ps = con.prepareStatement("SELECT * FROM resume WHERE email=?");
                                            
                                            ps.setString(1, email);
                                            
                                            ResultSet rs = ps.executeQuery();
                                            
                                            if( rs.next() )
                                            {
                                                file_name = rs.getString("path");
                                                
                                                </jsp:scriptlet>
                                                
                                    <a href="DownloadResume?fn=<jsp:expression>file_name</jsp:expression>" style="float: right;"> <b style='font-size:15px'> Download Resume <i class='fas fa-arrow-alt-circle-down'></i></b> </a>
                                            
                                    <jsp:scriptlet>
                                            }
                                        }
                                        catch(Exception e)
                                        {
                                            out.print(e);
                                        }
                                    </jsp:scriptlet>
                                    
                                </div>
                                <div class="col-md-1">
                                    
                                </div>
                            </div>
                            <br><br>
                            <div class="row" style="background-color: #ccffff;">
                                <div class="col-md-11">
                                    <a href="resume-builder.jsp" > <span style="font-size: 15px;  color: blue;" class="glyphicon glyphicon-pencil"> </span> Resume Builder </a>
                                <jsp:scriptlet>
                                
                                File f = new File(PathDetails.RESUME_BUILDER_PATH+email+".pdf");
                                if( f.exists() )
                                {
                                    </jsp:scriptlet>
                                    <a href="DownloadResumeBuilder?fn=<jsp:expression>email+".pdf"</jsp:expression>" style="float: right;"> <b style='font-size:15px'> Download Resume <i class='fas fa-arrow-alt-circle-down'></i></b> </a>
                                <jsp:scriptlet>
                                }
                                
                                </jsp:scriptlet>
                                    
                                </div>
                                <div class="col-md-1">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <a href="build-resume.jsp">  </a>
                        </div>
                    </div>
                    <br><br>

                    <div class="row" style="background-color: #f5f3f3">
                        <div class="col-md-3">

                        </div>
                        <div class="col-md-8">
                            <input type="submit" value="Follow" class="btn btn-outline-primary" style="border: 1px solid lightblue;" />
                        </div>
                        <div class="col-md-1">

                        </div>
                    </div>
                </div>
                <div class="col-md-2">

                </div>
            </div>   
                           
            <br><br><br>                    
                                
            <jsp:include page="footer.jsp" ></jsp:include>

        </div>
    </body>
</html>
