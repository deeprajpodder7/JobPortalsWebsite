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
        <title> About Us </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
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

                <!-- Search Job division Starts -->
                <div class="row">
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-8 job_search_div">
                        <div class="row">
                            <div class="col-md-6">
                                <img alt="About Us" src="images/company_about_us.png" height="250" width="350" />
                            </div>
                            <div class="col-md-6">
                                <img alt="About Us" src="images/about_us_men_1.png" height="200" width="350" style="background-color: #ffffff;" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">

                    </div>
                </div>
                <!-- Search Job division Ends -->

                <div class="row">
                    <div class="col-md-2" id="mynavbar">
<!--                        <ul>
                            <li> <a href="https://learning.tcsionhub.in/hub/national-qualifier-test/"> <img alt="TCS" src="images/tcs.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.wipro.com/careers-home/jobs"> <img alt="Wipro" src="images/wipro.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://dxc.com/us/en/careers"> <img alt="DXC" src="images/dxc.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.infosys.com/careers/apply.html"> <img alt="Infosys" src="images/infosys.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.apple.com/careers/us/"> <img alt="Apple" src="images/apple.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Disney" src="images/disney.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="MasterCard" src="images/mastercard.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Nike" src="images/nike.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href=""> <img alt="Puma" src="images/puma.jpg" height="100px" width="100px"> </a> </li> 
                        </ul>-->
                    </div>
                    <div class="col-md-8" style="background-color: #e6ffff;">
                        <div class="row">
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;" >
                                <b style="font-size: 25px; color: blue; margin-left: 30%;"> This is Job Portal Website </b> <br>
                            </div>
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;" >
                                <h3 style="color: #006666; margin-left: 40%; text-decoration: underline;"> Our Teams Members </h3>
                                <div class="row">
                                    <div class="col-md-3">
                                        <img alt="Julias Biswas" src="images/JULIAS_DP2.jpg" height="200" width="200" style="border: 1px solid black; border-radius: 50%;" />
                                    </div>
                                    <div class="col-md-9">
                                        <b style="color: #0000cc; font-size: 30px;"> Julias Biswas </b>
                                        <p>
                                            ( Java Developer , Frontend Developer )
                                        </p>
                                        <span> <b> <i class="glyphicon glyphicon-envelope"> </i> &nbsp;&nbsp; juliasbiswas0001@gmail.com </b> </span> <br>
                                        <span> <b> <i class="glyphicon glyphicon-earphone"> </i> &nbsp;&nbsp; 6294160823 </b> </span> <br>
                                        <span> <b> <i class="fa fa-linkedin-square"> </i> &nbsp;&nbsp;<a href="https://www.linkedin.com/in/julias-biswas-604953203/">LinkedIn Profile </a> </b> </span> <br>
                                        <span> <b> <i class="glyphicon glyphicon-user"> </i> &nbsp;&nbsp;<a href="https://www.hackerrank.com/juliasbiswas0001">HackerRank Profile</a> </b> </span> <br>
                                        <span> <b> <i class="fa fa-instagram"> </i> &nbsp;&nbsp;<a href="https://www.instagram.com/julias.biswas/">Instagram Profile</a> </b> </span> <br>
                                        <span> <b> <i class="fa fa-github"> </i> &nbsp;&nbsp;<a href="https://github.com/Julias-Biswas">GitHub Profile</a> </b> </span> <br>
                                    </div>
<!--                                    <hr>
                                    <div class="col-md-3">
                                        <img alt="Nayan Bhowmick" src="images/nayanbh.png" height="200" width="200" style="border: 1px solid black; border-radius: 50%;" />
                                    </div>
                                    <div class="col-md-9">
                                        <b style="color: #0000cc; font-size: 30px;"> Nayan Bhowmick </b>
                                        <p>
                                            ( Java Developer )
                                        </p>
                                        <span> <b> <i class="glyphicon glyphicon-envelope"> </i> &nbsp;&nbsp; nayanbhowmick49@gmail.com </b> </span> <br>
                                        <span> <b> <i class="glyphicon glyphicon-earphone"> </i> &nbsp;&nbsp; 6291895984 </b> </span> <br>
                                        <span> <b> <i class="fa fa-linkedin-square"> </i> &nbsp;&nbsp;<a href="https://www.linkedin.com/in/nayan-bhowmick-31ba551a4/">LinkedIn Profile </a> </b> </span> <br>
                                        <span> <b> <i class="glyphicon glyphicon-user"> </i> &nbsp;&nbsp;<a href="">HackerRank Profile</a> </b> </span> <br>
                                        <span> <b> <i class="fa fa-instagram"> </i> &nbsp;&nbsp;<a href="">Instagram Profile</a> </b> </span> <br>
                                        <span> <b> <i class="fa fa-github"> </i> &nbsp;&nbsp;<a href="">GitHub Profile</a> </b> </span> <br>
                                    </div>-->
                                </div>
                            </div>
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                
                                <h2 style="color: #000000; font-size: 30px;"> Our Mission </h2>
                                
                                <div class="row">
                                    <div class="col-md-4">
                                        <img alt="Our Mission" src="images/our-mission.jpg" width="300" height="200" />
                                    </div>
                                    <div class="col-md-8">
                                        <p style="color: #ff9900;"> Our central goal is to accomplish clients brilliance and maintainable focused edge. </p>
                                        <br>
                                        <p>
                                            Some have faith in the intensity of numbers; some put stock in the intensity of innovation; We have confidence in the intensity of individuals and the effect individuals can have on innovation. Our foundations developed from this conviction that individuals with assorted perspectives could meet up to manufacture an alternate sort of innovation organization. Our conviction of customers first drives our vision for tomorrow to manufacture innovation specialists who are centered around one objective: helping our customers succeed.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                
                                <h2> Overview </h2> <hr>
                                <p> Info Edge has an in-depth understanding of the Indian consumer internet domain. With years of experience in the domain, strong cash flow generation and a diversified business portfolio, it one of the very few profitable pure play internet companies in the country. </p>
                                
                                <br>
                                
                                <p> 
                                    The company was incorporated on May 1, 1995 under the Companies Act, 1956 as Info Edge (India) Private Limited and became a public limited company on April 27, 2006. 
                                    Starting with a classified recruitment online business, naukri.com, Info Edge has grown and diversified rapidly, setting benchmarks as a pioneer for others to follow.
                                </p> <br>
                                
                                <b style="color: #cccccc; font-size: 20px;"> Its business portfolio comprises: </b> <br> <br>
                                <p>
                                    Recruitment: Online recruitment classifieds, www.naukri.com, a clear market leader in the Indian e-recruitment space, www.naukrigulf.com, a job site focused at the Middle East market, offline executive search (www.quadranglesearch.com) and a fresher hiring site (www.firstnaukri.com). Additionally, Info Edge provides jobseekers value added services (Naukri Fast Forward) such as resume writing.
                                </p>
                                <br>
                                <p>
                                    <b> Matrimony: </b> Online matrimony classifieds, www.jeevansathi.com, is among the top three in India?s online matrimonial space, and has offline Jeevansathi Match Points and franchisees.
                                </p>
                                <br>
                                <p>
                                    <b> Real Estate: </b> Online real estate classifieds, www.99acres.com, is India?s largest property marketplace covering almost all the major cities and a large number of agents and developers.
                                </p>
                                <br>
                                <p>
                                    <b> Education: </b> Online education classifieds, www.shiksha.com, is the smartest gateway for students to achieve their goals.
                                </p>
                                <br><br>
                                
                                <p>
                                    The company's spirit of entrepreneurship has also been evident in the investments it has made in early stage companies/start-up ventures to tap into the growing and vibrant Indian internet market. Currently, the company has investments in Zomato Media Private Limited (www.zomato.com); Applect Learning Systems Private Limited (www.meritnation.com); Etechaces Marketing and Consulting Private Limited (www.policybazaar.com); Kinobeo Software Private Limited (www.mydala.com); Canvera Digital Technologies Private Limited (www.canvera.com); Happily Unmarried Marketing Private Limited (www.happilyunmarried.com); Goa-based Mint Bird Technologies Private Limited (www.vacationlabs.com); Mumbai based Green Leaves Consumer Services Private Limited (www.bigstylist.com); and Rare Media Company Private Limited (bluedolph.in).
                                </p>
                                <br>
                                <p>
                                    With a network of 62 offices located in 43 cities throughout India, Info Edge has 4,049 employees engaged in innovation, product development, integration with mobile and social media, technology and technology updation, research and development, quality assurance, sales, marketing and payment collection. It has also made forays abroad into the Gulf market with the website www.naukrigulf.com and currently has offices Dubai, Bahrain, Riyadh and Abu Dhabi.
                                </p>
                                <br><br>
                                <b> In terms of accounting standards, Info Edge has the following subsidiary companies: </b>
                                <ul>
                                    <li> Naukri Internet Services Private Limited and Jeevansathi Internet Services Private Limited, which own internet domain names and related trademarks; </li>
                                    <li> All check deals India Private Limited which provides brokerage services in the real estate sector in India; </li>
                                    <li> Info Edge (India) Mauritius Limited primarily to make overseas investments of the company (under liquidation); </li>
                                    <li> Applect Learning Systems Private Limited which is engaged in business of kindergarten to class12 (K-12) assignment and tuitions through its online portal Meritnation.com; </li>
                                    <li> Zomato Media Private Limited, which operates an online food guide portal zomato.com; and </li>
                                    <li> MakeSense Technologies Private Limited, owner of proprietary software for semantic search which augments search capabilities for both recruiters and job seekers, principally on naukri.com. </li>
                                    <li> Additionally investments made by Info Edge in other companies may have been routed through some of these subsidiaries. </li>
                                </ul>
                                <br><br>
                                <b> Learn More </b> <br>
                                <ul>
                                    <br>
                                    <li> Corporate Presentation </li> <br>
                                    <li> Datasheet </li> <br>
                                    <li> Summary Financials </li> <br>
                                    <li> Annual Reports </li> <br>
                                    <li> Financial Results - Consol & Subsidiary Companies </li> <br>
                                </ul>
                            </div>
                            <div class="col-md-12 display_job_div" style="border: 1px solid lightgray; box-shadow: 2px 2px 2px gray; border-radius: 10px;">
                                
                                <b style="color: #ff9900; font-size: 30px;"> Our Vision </b> <br><br>
                                
                                <p style="margin-left: 50px;">
                                    For a long time, we have lived by a lot of guiding principle that characterize our identity, shape our conduct, and set us apart from others in the business and now we have made a dream proclamation to express our motivation and concisely impart our vital way. We will be the undisputed pioneer in our business sectors, perceived for setting the specialized and execution norms in the majority of our organizations and for making client achievement. Our vision controls the means we take every day to guarantee our clients get an answer conveyed agreeable to them.
                                </p>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2" id="mynavbar">
<!--                        <ul>
                            <li> <a href="https://careers.google.com/"> <img alt="Google" src="images/google.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.microsoft.com/us/en"> <img alt="Microsoft" src="images/microsoft.jpg" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://careers.cognizant.com/in/en"> <img alt="Cognizant" src="images/cognizant.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://www.capgemini.com/in-en/careers/"> <img alt="Capgemini" src="images/capgemini.png" height="100px" width="100px"> </a> </li> 
                            <li> <a href="https://jobs.hp.com/"> <img alt="HP" src="images/hp.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://careers.nokia.com/"> <img alt="Nokia" src="images/nokia.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.ibm.com/in-en/employment/"> <img alt="IBM" src="images/ibm.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.bmwgroup.com/en/careers.html"> <img alt="BMW" src="images/bmw.jpg" height="100px" width="100px" > </a> </li>
                            <li> <a href="https://www.mercedes-benz.co.in/passengercars/the-brand/career.html"> <img alt="Mercedes" src="images/mercedes.jpg" height="100px" width="100px" > </a> </li>
                        </ul>-->
                    </div>
                </div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>