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
    String profile_pic = (String) session.getAttribute("session_profilepic");
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
        <title> Edit Profile Page </title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />

    </head>
    <body>
        <div class="container-fluid">

            <jsp:include page="profileheader.jsp" ></jsp:include>
            <jsp:include page="menubar.jsp" ></jsp:include>

                <div class="row">
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-8">
                        <div class="row">
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
                                            <b> <jsp:expression> gender </jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong style="color: #999999"> Fields : </strong> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression> fields </jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> City : </b> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression> city </jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">

                            </div>
                            <div class="col-md-9">
                                <table>
                                    <tr>
                                        <td>
                                            <h5> Education Details <span style="font-size: 12px;"> </h5> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Skills : <br><br>
                                        </td>
                                        <td>
                                            <input class="reglog_tf_design" type="text" value="" /> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            College : <br><br>
                                        </td>
                                        <td>
                                            <input class="reglog_tf_design" type="text" value="" /> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Passing Year : <br><br>
                                        </td>
                                        <td>
                                            <input class="reglog_tf_design" type="text" value="" /> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            School : <br><br>
                                        </td>
                                        <td>
                                            <input class="reglog_tf_design" type="text" value="" /> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Year : <br><br>
                                        </td>
                                        <td>
                                            <input class="reglog_tf_design" type="text" value="" /> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Experience : <br><br>
                                        </td>
                                        <td>
                                            <input class="reglog_tf_design" type="text" value="" /> <br><br>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7">

                            </div>
                            <div class="col-md-3">
                                <input type="submit" value="UPDATE" class="btn btn-primary search_btn" />
                            </div>
                            <div class="col-md-2">

                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">

                    </div>
                </div>                

            <jsp:include page="footer.jsp" ></jsp:include>

        </div>
    </body>
</html>
