<%-- 
    Document   : editUserPass
    Created on : Aug 5, 2014, 9:39:28 PM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <%
            if (session.getAttribute("loginAs") == null) {

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
                        <li><a href="logout.jsp">Logout </a></li>


                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Nav end --> 

            <!-- maincontent Starts -->
            <div class="form_registration">
                <div align="center">
                    <h2> Change Username and Password !</h2><div class="form_registration_p">  <%=request.getAttribute("Message")%></div></br>
                    <% String Email = request.getParameter("email_id");%>
                    

                    <table width="503" height="374" border="0">
                        <form method="post" action="ChangeUserPass">
                            <input type="hidden" name="email" value=<%=Email%>>
                            <tr>
                                <td width="207" height="69" align="right"> Fill New Username </td>
                                <td width="280">&nbsp; And Password</td>
                            </tr>
                            <tr>
                                <td height="75" align="right">New Username :&nbsp;</td>
                                <td align="center">
                                    <input type="text" name="username" size="30" required="required" style="font-size:12pt;height:25px" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td height="73" align="right">New Password :&nbsp;</td>
                                <td align="center"><input type="password" name="password1" size="30" required="required" style="font-size:12pt;height:25px" /></td>
                            </tr>
                            <tr>
                                <td height="67" align="right">Confirm Password :&nbsp;</td>
                                <td align="center"><input type="password" name="password2"  size="30" required="required" style="font-size:12pt;height:25px" /></td>
                            </tr>
                            <tr>
                                <td height="78" align="right"><button type="submit" class="btn btn-primary" >Submit</button></td>
                                <td align="center"><button type="reset" class="btn btn-default" >Cancel</button></td>
                            </tr>
                        </form>
                    </table>
                </div> 


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
