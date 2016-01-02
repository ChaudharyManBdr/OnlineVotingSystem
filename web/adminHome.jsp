

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Voting</title>

        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

        <%
           if((session.getAttribute("loginAs")==null))
           {
           
           response.sendRedirect("error.jsp");
           }
       
           
        %>

    </head>
    <body>
        <!-- wrapper starts -->
        <div class="wrapper"> 

            <!-- Header Starts -->
            <div class="header-adminPage">
                <div class="header-container">
                    <div class="logo"> <a href="#"><b>System Administrator</b></a> </div>
                    <div class="toll-free">
                        <p><b><a href="adminHome.jsp" class="btn btn-primary" role="button">Admin Home</a>
                                <a href="logout.jsp" class="btn btn-danger" role="button">Logout</a></b></p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Header ends --> 

            <!-- Nav start -->
            <div class="nav-adminPage">
                <div class="nav-in">
                    <ul>

                        <li><a href="voter_reg.jsp">Voter Reg </a></li>
                        <li><a href="voter_list.jsp">Voter List </a></li>
                        <li><a href="candidate_reg.jsp"> Candidate Reg</a></li>
                        <li><a href="candidate_list.jsp">Candidate List </a></li>
                        <li><a href="adminResultUpload.jsp">Result </a></li>
                        <li><a href="adminNoticeUpload.jsp">Notice </a></li>
                        <li><a href="logout.jsp">Logout</a></li>



                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Nav end --> 

            <!-- maincontent Starts -->
            <div class="form_registration">
               <h1>Admin</h1><br/>           

                <div class="admin_action">
                    <div class="admin_action-img"> <img src="images/a2.jpg"></div>
                    <h3> <a href="createUserAccount.jsp">Create User Account </a></h3>
                </div>

                <div class="admin_action">
                    <div class="admin_action-img"><img src="images/a3.jpg"></div>
                    <h3> <a href="changeUsernamePassword.jsp"> Username & Password </a></h3>
                </div>

                <!--   <div class="admin_action">
                       <div class="admin_action-img"><img src="images/a1.jpg"></div>
                       <h3><a href="#">Create New Officer Account </a></h3>
                  </div>
                -->
                <div class="admin_action">
                    <div class="admin_action-img"><img src="images/a4.jpg"></div>
                    <h3> <a href="manageUserAccount.jsp">Manage Officer Account </a></h3>
                </div>
                <table width="823" height="250" border="0">


                </table>

                <div class="clear"></div>

            </div>
            <!-- aincontent ends --> 



            <!-- footer starts -->
            <div class="footer">
                <div class="footer-in">

                    <div class="copy">
                        <p>Copyright © 2014 On-line Voting System. All rights reserved. Designed by <a href="#" >Er. Man Bdr. Chaudhary</a></p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- footer ends --> 

        </div>
        <!-- wrapper ends -->
    </body>
</html>
