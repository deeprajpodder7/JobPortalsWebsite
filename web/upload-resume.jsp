<%-- 
    Document   : profile
    Created on : 4 Dec, 2021, 8:50:37 PM
    Author     : julia
--%>

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
    if( name == null || name.equals("") )
    {
        response.sendRedirect("login.jsp");
    }
    
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Upload Your Resume </title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/style1.css" />

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
                            <img alt="Resume Not Found" src="resumes/default_image.png" height="180" style="border: 1px solid cyan; border-radius: 15px; color: red;" /><br><br>
                        </div>
                        <div class="col-md-9">
                            <h2> Upload Your Resume </h2> <br>
                            <form action="UpdateResume" method="POST" enctype="multipart/form-data">
                                <table>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Name : </b> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression> name </jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b style="color: #999999"> Email : </b> <br><br>
                                        </td>
                                        <td>
                                            <b> <jsp:expression> email </jsp:expression> </b> <br><br>
                                        </td>
                                    </tr>
                                                                        
                                    <tr>
                                        <td>
                                            
                                        </td>
                                        <td>
                                            <input type="file" name="uploadresume" /> 
                                            <br><br>
                                            <input type="submit" value="UPLOAD RESUME" class="btn btn-primary search_btn " /> <br>
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

            
            <jsp:include page="footer.jsp" ></jsp:include>

        </div>
    </body>
</html>
