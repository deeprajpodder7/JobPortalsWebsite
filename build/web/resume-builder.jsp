<%-- 
    Document   : profile
    Created on : 4 Dec, 2021, 8:50:37 PM
    Author     : julia
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.julias.dbconnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String gender = (String) session.getAttribute("session_gender");
    String fields = (String) session.getAttribute("session_field");
    String city = (String) session.getAttribute("session_city");
    String profile_pic = (String) session.getAttribute("session_profilepic");
</jsp:scriptlet>

<jsp:scriptlet>
    if (name == null || name.equals("")) 
    {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Job Portal - Make Your Resume </title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/style1.css" />

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
                                <img alt="Image Not Found" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="200" style="border: 0px solid cyan; border-radius: 50%; color: red;" />
                            </div>
                            <div class="col-md-9">
                                <table>
                                    <tr>
                                        <td>

                                        </td>
                                        <td>
                                            <h3 style="color: blue;"> <jsp:expression> name.toUpperCase()</jsp:expression> </h3> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Email : </b> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression>email</jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Gender : </b> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression>gender</jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong style="color: #999999"> Fields : </strong> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression>fields</jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> City : </b> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression>city</jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>    
                        <br><br>
                        <div class="row" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                            <div class="col-md-12">
                                <form method="POST" action="ResumeBuilder">
                                    <table>
                                        <tr>
                                            <td>
                                                
                                            </td>
                                            <td>
                                                <h3> Resume Builder Details  </h3> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Name :  </b> <br><br>
                                            </td>
                                            <td>
                                                <input type="text" name="name1" class="reglog_tf_design" style="color: blue;" value="<jsp:expression>name</jsp:expression>" disabled="" /> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Email :  </b> <br><br>
                                            </td>
                                            <td>
                                                <input type="text" name="email1" class="reglog_tf_design" style="color: blue;" value="<jsp:expression>email</jsp:expression>" disabled="" /> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Career Objective :  </b> <br><br>
                                            </td>
                                            <td>
                                                <textarea name="career1" placeholder="Career Objective" class="reglog_ta_design" style="color: blue;" ></textarea> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Education History :  </b> <br><br> 
                                            </td>
                                            <td>
                                                <jsp:scriptlet>

                                                    String school_college = "" , degree = "" , field_of_study = "" , start_month = "" , start_year = "" , end_month = "" , end_year = "" , grade = "" ;

                                                    try
                                                    {
                                                        Connection con = DBConnection.getConnect();
                                                        PreparedStatement ps = con.prepareStatement("SELECT * FROM education WHERE email=?");

                                                        ps.setString(1, email);

                                                        ResultSet rs = ps.executeQuery();

                                                        while( rs.next() )
                                                        {
                                                            school_college = rs.getString("school_college");
                                                            degree = rs.getString("degree");
                                                            field_of_study = rs.getString("field_of_study");
                                                            start_month = rs.getString("start_month");
                                                            start_year = rs.getString("start_year");
                                                            end_month = rs.getString("end_month");
                                                            end_year = rs.getString("end_year");
                                                            grade = rs.getString("grade");

                                                            </jsp:scriptlet>


                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>school_college</jsp:expression>" disabled="" />
                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>degree</jsp:expression>" disabled="" />
                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>field_of_study</jsp:expression>" disabled="" />
                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>start_month</jsp:expression> &nbsp;&nbsp;&nbsp; <jsp:expression>start_year</jsp:expression>" disabled="" />
                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>end_month</jsp:expression> &nbsp;&nbsp;&nbsp; <jsp:expression>end_year</jsp:expression>" disabled="" />
                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>grade</jsp:expression>" disabled="" />  <br><br>

                                                            <jsp:scriptlet>

                                                        }
                                                    }
                                                    catch(Exception e)
                                                    {
                                                        out.print(e);
                                                    }

                                                </jsp:scriptlet>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Experience :  </b> <br><br>
                                            </td>
                                            <td>
                                                <jsp:scriptlet>

                                                    String company = "" , location = "" , start_month1 = "" , start_year1 = "" , end_month1 = "" , end_year1 = "" , employement_type = "" ;

                                                    try
                                                    {
                                                        Connection con = DBConnection.getConnect();
                                                        PreparedStatement ps = con.prepareStatement("SELECT * FROM experience WHERE email=?");

                                                        ps.setString(1, email);

                                                        ResultSet rs = ps.executeQuery();

                                                        while( rs.next() )
                                                        {
                                                            company = rs.getString("company");
                                                            location = rs.getString("location");
                                                            start_month1 = rs.getString("start_month");
                                                            start_year1 = rs.getString("start_year");
                                                            end_month1 = rs.getString("end_month");
                                                            end_year1 = rs.getString("end_year");
                                                            employement_type = rs.getString("employement_type");

                                                            </jsp:scriptlet>


                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>company</jsp:expression>" disabled="" />
                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>location</jsp:expression>" disabled="" />
                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>start_month1</jsp:expression> &nbsp;&nbsp;&nbsp; <jsp:expression>start_year1</jsp:expression>" disabled="" />
                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>end_month1</jsp:expression> &nbsp;&nbsp;&nbsp; <jsp:expression>end_year1</jsp:expression>" disabled="" />
                                                    <input type="text" style="font-size: 12px; color: blue; width: 110px; height: 35px;" value="<jsp:expression>employement_type</jsp:expression>" disabled="" />  <br><br>

                                                            <jsp:scriptlet>

                                                        }
                                                    }
                                                    catch(Exception e)
                                                    {
                                                        out.print(e);
                                                    }

                                                </jsp:scriptlet>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Hobbies :  </b> <br><br>
                                            </td>
                                            <td>
                                                <textarea name="hobbies1" placeholder="Enter Your Hobbies" class="reglog_ta_design" style="color: blue;"></textarea> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Date Of Birth : </b> <br><br> 
                                            </td>
                                            <td>
                                                <input name="dateofbirth1" type="date" placeholder="Date Of Birth" class="textfield_design" style="color: blue;" /> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Marital Status : </b> <br><br> 
                                            </td>
                                            <td>
                                                <input name="marital1" type="text" placeholder="Gender/Marital Status " class="reglog_tf_design" style="color: blue;" /> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Language : </b> <br><br>  
                                            </td>
                                            <td>
                                                <input name="language1" type="text" placeholder="Language Proficiency" class="reglog_tf_design" style="color: blue;" /> <br> <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Address : </b> <br><br>
                                            </td>
                                            <td>
                                                <textarea name="address1" placeholder="Enter Your Address " class="reglog_ta_design" style="color: blue;" ></textarea> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                
                                            </td>
                                            <td>
                                                <input type="submit" value="Build My Resume" class="btn btn-success search_btn" style="margin-left: 200px;" /> <br>
                                                <b style="margin-left: 250px;"> OR </b> <br>
                                                <b> <a href="profile.jsp" style="color: red; font-size: 15px; margin-left: 200px" class="another_hyperlink"> < Back To Profile Page </a> </b>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
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
