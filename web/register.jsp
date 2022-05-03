<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title> Job Portal - Register </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />

        <script>
            function val(v)
            {
                document.getElementById(v).innerHTML = "";
            }
            function validation()
            {
                var flag = true;

                var name2 = document.regform.name1.value;
                var email2 = document.regform.email1.value;
                var pass2 = document.regform.pass1.value;
                var gender2 = document.regform.gender1.value;
                //var fields2 = document.regform.field1.value;
                var city2 = document.regform.city1.value;

                /* 
                 * @type RegExp validation 
                 */

                var name_pattern = /^[a-zA-Z-0-9 ]{3,30}$/;
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                //var phone_pattern = /^[0-9]{10}$/;


                // ======================== VALIDATION FORM ======================== 

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

                if (!pass2.match(password_pattern))
                {
                    document.getElementById('pass_error').innerHTML = "PASSWORD IS NOT PROPERLY FORMATED (SHOULD CONTAIN 0-9 , SPECIAL CHARACTER & a TO z OR A TO Z)";
                    flag = false;
                }
                if (pass2 === "")
                {
                    document.getElementById('pass_error').innerHTML = "PASSWORD CANNOT BE EMPTY";
                    flag = false;
                }

                if (gender2 === "")
                {
                    document.getElementById('gender_error').innerHTML = "PLEASE SELECT ANY GENDER";
                    flag = false;
                }
                else
                {
                    document.getElementById('gender_error').innerHTML = "";
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

                if (city2 === "Select City")
                {
                    document.getElementById('city_error').innerHTML = "PLEASE SELECT ANY CITY";
                    flag = false;
                }
                else
                {
                    document.getElementById('city_error').innerHTML = "";
                    flag = true;
                }

                return flag;

            }
        </script>

    </head>
    <body>
        <div class="container-fluid">

            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="menubar.jsp"></jsp:include>
                <br><br>
                <div class="row">
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-8 reg_div_design" >

                        <form method="POST" name="regform" onsubmit="return validation()" action="reg">

                            <strong style="font-size: 35px; font-weight: 900; color: #009900;"> Sign Up </strong> <br><br>

                            <input type="text" placeholder="Enter Name" name="name1" class="reglog_tf_design" onkeyup="val('name_error')" /> <br> <span id="name_error" style="font-size: 15px; color: red;">  </span> <br> <br>
                            <input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design" onkeyup="val('email_error')" /> <br> <span id="email_error" style="font-size: 15px; color: red;">  </span> <br> <br>
                            <input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design" onkeyup="val('pass_error')" /> <br> <span id="pass_error" style="font-size: 15px; color: red;">  </span> <br> <br>

                            <strong style="font-size: 20px;"> Select Gender : </strong> 
                            <input type="radio" name="gender1" value="Male" />Male <input type="radio" name="gender1" value="Female" />Female <br> <span id="gender_error" style="font-size: 15px; color: red;">  </span>  <br> <br>

                            <strong style="font-size: 20px;"> Select Fields : </strong>
                            <input type="checkbox" name="field1" value="Information Technology" />  Information Technology 
                            <input type="checkbox" name="field1" value="Marketing" />  Marketing 
                            <input type="checkbox" name="field1" value="Finance" />  Finance <br> <span id="field_error" style="font-size: 15px; color: red;"></span> <br><br>

                            <strong style="font-size: 20px;"> Select City : </strong> 					
                            <select name="city1" class="reglog_tf_design" style="width: 380px; height: 45px;">
                                <option> Select State </option>
                                <option> Andhra Pradesh </option>
                                <option> Arunachal Pradesh </option>
                                <option> Assam </option>
                                <option> Bihar </option>
                                <option> Chhattisgarh </option>
                                <option> Goa </option>
                                <option> Gujarat </option>
                                <option> Haryana </option>
                                <option> Himachal Pradesh </option>
                                <option> Jharkhand </option>
                                <option> Karnataka </option>
                                <option> Kerala </option>
                                <option> Madhya Pradesh </option>
                                <option> Maharashtra </option>
                                <option> Manipur </option>
                                <option> Meghalaya </option>
                                <option> Mizoram </option>
                                <option> Nagaland </option>
                                <option> Odisha </option>
                                <option> Punjab </option>
                                <option> Rajasthan </option>
                                <option> Sikkim </option>
                                <option> Tamil Nadu </option>
                                <option> Telangana </option>
                                <option> Tripura </option>
                                <option> Uttar Pradesh </option>
                                <option> Uttarakhand </option>
                                <option> West Bengal </option>
                            </select> <br> <span id="city_error" style="font-size: 15px; color: red;">  </span>  <br><br>

                            <input type="checkbox" value="agree" name="term_and_condition1" /> I agree the <a href="term_and_conditions.jsp">term and condition</a> <br><br> 

                            <input type="submit" value="Sign Up" class="btn btn-primary search_btn" /> <br><br>				

                            <strong> OR </strong><br><br>

                            <strong> Already have an account? <a href="login.jsp" style="font-size: 15px; text-decoration: none;">Login</a> </strong>
                        </form>
                    </div>
                    <div class="col-md-2">

                    </div>
                </div>

                <br><br><br>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>