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

<jsp:declaration>

    String company = "" , location = "" , start_month = "" , start_year = "" , end_month = "" , end_year = "" , employement_type = "" , description = "" ;

</jsp:declaration>

<%
    
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String gender = (String) session.getAttribute("session_gender");
    String fields = (String) session.getAttribute("session_field");
    String city = (String) session.getAttribute("session_city");
    String profile_pic = (String) session.getAttribute("session_profilepic");
    
    //<!--  "edit-experience-details.jsp?id1=id1"  , Here "id1" = id1 -->
    String id1 = request.getParameter("id1");
    
    try(
            
            Connection con = DBConnection.getConnect();
            
            PreparedStatement ps = con.prepareStatement("SELECT * FROM experience WHERE id='"+id1+"'");
            ResultSet rs = ps.executeQuery();
        )
    {
        
        while( rs.next() )
        {
            company = rs.getString("company");
            location = rs.getString("location");
            start_month = rs.getString("start_month");
            start_year = rs.getString("start_year");
            end_month = rs.getString("end_month");
            end_year = rs.getString("end_year");
            employement_type = rs.getString("employement_type");
            description = rs.getString("description");
        }
    }
    catch(Exception e)
    {
        out.print(e);
    }
    
%>

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
        <title> Job Portal - Edit Experience </title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/style1.css" />
        <link rel="stylesheet" type="text/css" href="css/style2.css" />
        
        <script>
            
            function submitFunction(val)
            {
                if( val === 'update' )
                {
                    document.editexpform.action="EditExperienceDetails";
                    document.editexpform.submit();
                }
                if( val === 'delete' )
                {
                    document.editexpform.action="DeleteExperienceDetails";
                    document.editexpform.submit();
                }
            }
            
        </script>
        
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
                                <img alt="Image Not Found" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="200" style="border: 1px solid cyan; border-radius: 50%; color: red;" />
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
                                            <b> <jsp:expression> email</jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Gender : </b> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression> gender</jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong style="color: #999999"> Fields : </strong> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression> fields</jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> City : </b> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression> city</jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <br> <br>                
                        <div class="row" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                            <div class="col-md-2">

                            </div>
                            <div class="col-md-9">
                                <form method="POST" name="editexpform">
                                    <input type="hidden" value="<jsp:expression>id1</jsp:expression>" name="id1" />
                                    <table>
                                        <tr>
                                            <td>

                                            </td>
                                            <td>
                                                <h3> Edit Experience Details <span style="margin-left: 60px;"> </h3> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Company : </b> <br><br>
                                            </td>
                                            <td>
                                                <input class="reglog_tf_design" name="company1" type="text" value="<jsp:expression>company</jsp:expression>" placeholder="Ex. XYZ Company" /> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Location : </b> <br><br>
                                            </td>
                                            <td>
                                                <input class="reglog_tf_design" name="location1" type="text" value="<jsp:expression>location</jsp:expression>" placeholder="Ex. Bangalore" /> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Start Year : </b> <br><br>
                                            </td>
                                            <td>
                                                <select name="startmonth1" class="reglog_tf_design" style="width: 245px; height: 45px;">
                                                    <option> <jsp:expression>start_month</jsp:expression> </option>
                                                    <option value="January"> January </option>
                                                    <option value="February"> February </option>
                                                    <option value="March"> March </option>
                                                    <option value="April"> April </option>
                                                    <option value="May"> May </option>
                                                    <option value="June"> June </option>
                                                    <option value="July"> July </option>
                                                    <option value="August"> August </option>
                                                    <option value="September"> September </option>
                                                    <option value="October"> October </option>
                                                    <option value="November"> November </option>
                                                    <option value="December"> December </option>
                                                </select>

                                                <select name="startyear1" class="reglog_tf_design" style="width: 245px; height: 45px;">
                                                    <option> <jsp:expression>start_year</jsp:expression> </option>
                                                    <option value="2030"> 2030 </option>
                                                    <option value="2029"> 2029 </option>
                                                    <option value="2028"> 2028 </option>
                                                    <option value="2027"> 2027 </option>
                                                    <option value="2026"> 2026 </option>
                                                    <option value="2025"> 2025 </option>
                                                    <option value="2024"> 2024 </option>
                                                    <option value="2023"> 2023 </option>
                                                    <option value="2022"> 2022 </option>
                                                    <option value="2021"> 2021 </option>
                                                    <option value="2020"> 2020 </option>
                                                    <option value="2019"> 2019 </option>
                                                    <option value="2018"> 2018 </option>
                                                    <option value="2017"> 2017 </option>
                                                    <option value="2016"> 2016 </option>
                                                    <option value="2015"> 2015 </option>
                                                    <option value="2014"> 2014 </option>
                                                    <option value="2013"> 2013 </option>
                                                    <option value="2012"> 2012 </option>
                                                    <option value="2011"> 2011 </option>
                                                    <option value="2010"> 2010 </option>
                                                    <option value="2009"> 2009 </option>
                                                    <option value="2008"> 2008 </option>
                                                    <option value="2007"> 2007 </option>
                                                    <option value="2006"> 2006 </option>
                                                    <option value="2005"> 2005 </option>
                                                    <option value="2004"> 2004 </option>
                                                    <option value="2003"> 2003 </option>
                                                    <option value="2007"> 2002 </option>
                                                    <option value="2002"> 2001 </option>
                                                    <option value="2000"> 2000 </option>
                                                    <option value="1999"> 1999 </option>
                                                    <option value="1998"> 1998 </option>
                                                    <option value="1997"> 1997 </option>
                                                    <option value="1996"> 1996 </option>
                                                    <option value="1995"> 1995 </option>
                                                    <option value="1994"> 1994 </option>
                                                    <option value="1993"> 1993 </option>
                                                    <option value="1992"> 1992 </option>
                                                    <option value="1991"> 1991 </option>
                                                    <option value="1990"> 1990 </option>
                                                    <option value="1989"> 1989 </option>
                                                    <option value="1988"> 1988 </option>
                                                    <option value="1987"> 1987 </option>
                                                    <option value="1986"> 1986 </option>
                                                    <option value="1985"> 1985 </option>
                                                    <option value="1984"> 1984 </option>
                                                    <option value="1983"> 1983 </option>
                                                    <option value="1982"> 1982 </option>
                                                    <option value="1981"> 1981 </option>
                                                    <option value="1980"> 1980 </option>
                                                    <option value="1979"> 1979 </option>
                                                    <option value="1978"> 1978 </option>
                                                </select> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> End Year : </b> <br><br>
                                            </td>
                                            <td>
                                                <select name="endmonth1" class="reglog_tf_design" style="width: 245px; height: 45px;">
                                                    <option> <jsp:expression>end_month</jsp:expression> </option>
                                                    <option value="January"> January </option>
                                                    <option value="February"> February </option>
                                                    <option value="March"> March </option>
                                                    <option value="April"> April </option>
                                                    <option value="May"> May </option>
                                                    <option value="June"> June </option>
                                                    <option value="July"> July </option>
                                                    <option value="August"> August </option>
                                                    <option value="September"> September </option>
                                                    <option value="October"> October </option>
                                                    <option value="November"> November </option>
                                                    <option value="December"> December </option>
                                                </select>

                                                <select name="endyear1" class="reglog_tf_design" style="width: 245px; height: 45px;">
                                                    <option> <jsp:expression>end_year</jsp:expression> </option>
                                                    <option value="2030"> 2030 </option>
                                                    <option value="2029"> 2029 </option>
                                                    <option value="2028"> 2028 </option>
                                                    <option value="2027"> 2027 </option>
                                                    <option value="2026"> 2026 </option>
                                                    <option value="2025"> 2025 </option>
                                                    <option value="2024"> 2024 </option>
                                                    <option value="2023"> 2023 </option>
                                                    <option value="2022"> 2022 </option>
                                                    <option value="2021"> 2021 </option>
                                                    <option value="2020"> 2020 </option>
                                                    <option value="2019"> 2019 </option>
                                                    <option value="2018"> 2018 </option>
                                                    <option value="2017"> 2017 </option>
                                                    <option value="2016"> 2016 </option>
                                                    <option value="2015"> 2015 </option>
                                                    <option value="2014"> 2014 </option>
                                                    <option value="2013"> 2013 </option>
                                                    <option value="2012"> 2012 </option>
                                                    <option value="2011"> 2011 </option>
                                                    <option value="2010"> 2010 </option>
                                                    <option value="2009"> 2009 </option>
                                                    <option value="2008"> 2008 </option>
                                                    <option value="2007"> 2007 </option>
                                                    <option value="2006"> 2006 </option>
                                                    <option value="2005"> 2005 </option>
                                                    <option value="2004"> 2004 </option>
                                                    <option value="2003"> 2003 </option>
                                                    <option value="2007"> 2002 </option>
                                                    <option value="2002"> 2001 </option>
                                                    <option value="2000"> 2000 </option>
                                                    <option value="1999"> 1999 </option>
                                                    <option value="1998"> 1998 </option>
                                                    <option value="1997"> 1997 </option>
                                                    <option value="1996"> 1996 </option>
                                                    <option value="1995"> 1995 </option>
                                                    <option value="1994"> 1994 </option>
                                                    <option value="1993"> 1993 </option>
                                                    <option value="1992"> 1992 </option>
                                                    <option value="1991"> 1991 </option>
                                                    <option value="1990"> 1990 </option>
                                                    <option value="1989"> 1989 </option>
                                                    <option value="1988"> 1988 </option>
                                                    <option value="1987"> 1987 </option>
                                                    <option value="1986"> 1986 </option>
                                                    <option value="1985"> 1985 </option>
                                                    <option value="1984"> 1984 </option>
                                                    <option value="1983"> 1983 </option>
                                                    <option value="1982"> 1982 </option>
                                                    <option value="1981"> 1981 </option>
                                                    <option value="1980"> 1980 </option>
                                                    <option value="1979"> 1979 </option>
                                                    <option value="1978"> 1978 </option>
                                                </select> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Employment Type  : </b> <br><br>
                                            </td>
                                            <td>
                                                <select name="employmenttype1" class="reglog_tf_design" style="width: 490px; height: 45px;">
                                                    <option> <jsp:expression>employement_type</jsp:expression> </option>
                                                    <option value="Full Time"> Full Time </option>
                                                    <option value="Part Time"> Part Time </option>
                                                    <option value="Self Employed"> Self Employed </option>
                                                    <option value="Freelance"> Freelance </option>
                                                    <option value="Internship"> Internship </option>
                                                    <option value="Trainee"> Trainee </option>
                                                </select> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b> Description : </b> <br><br>
                                            </td>
                                            <td>
                                                <textarea class="reglog_ta_design" name="description1" placeholder="Ex. Your Project Description" type="text" value="" ><jsp:expression>description</jsp:expression></textarea> <br><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>

                                            </td>
                                            <td>
                                                <input type="submit" value="UPDATE EXPERIENCE" class="btn btn-primary ud_btn" onclick="submitFunction('update')" /> 
                                                <input type="submit" value="DELETE EXPERIENCE" class="btn btn-danger ud_btn" onclick="submitFunction('delete')" /> <br>
                                                <b style="margin-left: 236px;"> OR </b> <br>
                                                <b> <a href="profile.jsp" style="color: red; font-size: 15px; margin-left: 180px" class="another_hyperlink"> < Back To Profile Page </a> </b>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
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
