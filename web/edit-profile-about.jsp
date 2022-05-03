<%-- 
    Document   : profile
    Created on : 4 Dec, 2021, 8:50:37 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String pass = (String) session.getAttribute("session_pass");
    String gender = (String) session.getAttribute("session_gender");
    String fields = (String) session.getAttribute("session_field");
    String city = (String) session.getAttribute("session_city");
    
    String title = (String) session.getAttribute("session_title");
    String skills = (String) session.getAttribute("session_skills");
    String profile_pic = (String) session.getAttribute("session_profilepic");
    
    if( title == null || title.equals("") )
    {
        title = "";
    }
    
    if( skills == null || skills.equals("") )
    {
        skills = "";
    }
</jsp:scriptlet>

<jsp:scriptlet>
    if( name == null || name.equals("") )
    {
        response.sendRedirect("login.jsp");
    }
    
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Job Portal - Edit Profile </title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/style1.css" />

        <script>
            function val(v)
            {
                document.getElementById(v).innerHTML="";
            }
            function validation()
            {
                var flag = true;
                
                var name2 = document.regform.name1.value;
                var gender2 = document.regform.gender1.value;
                //var fields2 = document.regform.field1.value;
                var city2 = document.regform.city1.value;
                var title2 = document.regform.title1.value;
                var skill2 = document.regform.skill1.value;
                
                /* 
                 * @type RegExp validation 
                 */
                
                var name_pattern=/^[a-zA-Z-0-9 ]{3,30}$/;
                //var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                //var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                //var phone_pattern = /^[0-9]{10}$/;
                var title_pattern=/^[a-zA-Z-0-9 ,_+ ]{3,1000}$/;
                var skill_pattern=/^[a-zA-Z-0-9 ,_+  ]{3,3000}$/;
                
                 // ======================== VALIDATION FORM ======================== 
                 
                if(!name2.match(name_pattern))
                {
                    document.getElementById('name_error').innerHTML="NAME IS NOT PROPERLY FORMATED";
                    flag=false;
                } 
                if( name2 === "" )
                {
                    document.getElementById('name_error').innerHTML="NAME CANNOT BE EMPTY";
                    flag = false;
                }
                
                if( gender2 === "Select Gender" )
                {
                    document.getElementById('gender_error').innerHTML="PLEASE SELECT ANY GENDER";
                    flag = false;
                }
                else
                {
                    document.getElementById('gender_error').innerHTML="";
                    flag = true;
                }
                
//                if( fields2 === "" )
//                {
//                    document.getElementById('field_error').innerHTML="PLEASE SELECT ATLEAST ONE FIELD";
//                    flag = false;
//                }
//                else
//                {
//                    document.getElementById('field_error').innerHTML="";
//                    flag = true;
//                }
                
                if( city2 === "Select City" )
                {
                    document.getElementById('city_error').innerHTML="PLEASE SELECT ANY CITY";
                    flag = false;
                }
                else
                {
                    document.getElementById('city_error').innerHTML="";
                    flag = true;
                }
                
                if(!title2.match(title_pattern))
                {
                    document.getElementById('title_error').innerHTML="TITLE IS NOT PROPERLY FORMATED";
                    flag=false;
                } 
                if( title2 === "" )
                {
                    document.getElementById('title_error').innerHTML="TITLE CANNOT BE EMPTY";
                    flag = false;
                }
                
                if(!skill2.match(skill_pattern))
                {
                    document.getElementById('skill_error').innerHTML="SKILL IS NOT PROPERLY FORMATED";
                    flag=false;
                } 
                if( skill2 === "" )
                {
                    document.getElementById('skill_error').innerHTML="SKILL CANNOT BE EMPTY";
                    flag = false;
                }
                
                return flag;
                
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
                            <img alt="Image Not Found" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="200" style="border: 0px solid cyan; border-radius: 50%; color: red;" />
                        </div>
                        <div class="col-md-9">
                            <h2> Edit Personal Details </h2> <br>
                            <form action="EditProfileAbout" method="POST" onsubmit="return validation()" name="regform" >
                                <table>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Email : </b> <br><br>
                                        </td>
                                        <td>
                                            <input type="text" class="reglog_tf_design" style="color: #000000; font-style: normal;" disabled="" value="<jsp:expression> email </jsp:expression>" /> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Name : </b> <br><br><br>
                                        </td>
                                        <td>
                                            <input type="text" class="reglog_tf_design" onkeyup="val('name_error')" value="<jsp:expression> name </jsp:expression>" name="name1" /> <br> <span id="name_error" style="font-size: 15px; color: red;">  </span>  <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Gender : </b> <br><br><br>
                                        </td>
                                        <td>
                                            <select name="gender1" class="reglog_tf_design" style="width: 300px; height: 40px;"> 
                                                <option> <jsp:expression> gender </jsp:expression> </option>
                                                <option> Male </option>
                                                <option> Female </option>
                                            </select> <br> <span id="gender_error" style="font-size: 15px; color: red;">  </span> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Fields : </b> <br><br><br>
                                        </td>
                                        <td>
                                            <input name="field1" class="reglog_tf_design" type="text" value="<jsp:expression> fields</jsp:expression>" /> <br> <span id="field_error" style="font-size: 15px; color: red;">  </span> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> City : </b> <br><br><br>
                                        </td>
                                        <td>
                                            <select name="city1" class="reglog_tf_design" style="width: 300px; height: 40px;">
                                                <option> <jsp:expression> city </jsp:expression> </option>
                                                <option value="Assam"> Assam </option>
                                                <option value="Bangalore"> Bangalore </option>
                                                <option value="Chandigarh"> Chandigarh </option>
                                                <option value="Chennai"> Chennai </option>
                                                <option value="Deradun"> Deradun </option>
                                                <option value="Hydrabad"> Hydrabad </option>
                                                <option value="Kolkata"> Kolkata </option>
                                                <option value="Kota"> Kota </option>
                                                <option value="Mumbai"> Mumbai </option>
                                                <option value="Noida"> Noida </option>
                                                <option value="Pune"> Pune </option>
                                            </select> <br> <span id="city_error" style="font-size: 15px; color: red;">  </span> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Profile Title : </b> <br><br><br>
                                        </td>
                                        <td>
                                            <input name="title1" placeholder="Enter Title" onkeyup="val('title_error')" class="reglog_tf_design" type="text" value="<jsp:expression> title </jsp:expression>" /> <br> <span id="title_error" style="font-size: 15px; color: red;">  </span> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Skill : </b> <br><br><br>
                                        </td>
                                        <td>
                                            <textarea class="reglog_ta_design" onkeyup="val('skill_error')" placeholder="Enter Your Skill" name="skill1" ><jsp:expression>skills</jsp:expression></textarea> <br> <span id="skill_error" style="font-size: 15px; color: red;">  </span> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            
                                        </td>
                                        <td>
                                            <input type="submit" value="UPDATE" class="btn btn-primary search_btn" /> <br>
                                            <b style="margin-left: 80px;"> OR </b> <br>
                                            <b> <a href="profile.jsp" style="color: red; font-size: 15px; margin-left: 20px" class="another_hyperlink"> < Back To Profile Page </a> </b>
                                        </td>
                                    </tr>
                                </table>
                            </form>
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
