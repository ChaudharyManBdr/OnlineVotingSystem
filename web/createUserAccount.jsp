<%-- 
    Document   : notice_upload
    Created on : Jul 6, 2014, 8:31:41 PM
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
                <h2> Create New User Account !</h2> <div class="form_registration_p">  <%=request.getAttribute("Message")%></div> </br>

                <table width="888" height="433" border="1">
                    <form action="UserAccount" method="post" >
                    <tr>
                        <td width="401"><table width="382" height="425" border="0">
                                
                                    <tr>
                                        <td width="103" align="center">Role As :</td>
                                        <td width="269">
                                            <input type="radio" name="role" value="admin" />                                               
                                            Administrator
                                            <input type="radio" name="role"  value="officer" />
                                            <label>Officer</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">Name :</td>
                                        <td>

                                            <input type="text" name="name"  size="30"required="required" style="font-size:12pt;height:25px" />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center"> Address :</td>
                                        <td>

                                            <input type="text" name="address"  size="30" required="required" style="font-size:12pt;height:25px" />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">E-mail :</td>
                                        <td>

                                            <input type="text" name="email"  size="30" required="required" placeholder="please enter valid email-id !"style="font-size:12pt;height:25px" /></td>
                                    </tr>
                                    <tr>
                                        <td align="center">Phone :</td>
                                        <td><input type="text" name="phone"  size="30" required="required" style="font-size:12pt;height:25px" /></td>
                                    </tr>
                              
                            </table></td>
                        <td width="538"><table width="481" height="357" border="0">

                                <tr>
                                    <td width="263" align="right">Create Your Username </td>
                                    <td width="317">&nbsp;And Password</td>
                                </tr>
                                <tr>
                                    <td align="right">Username :&nbsp;</td>
                                    <td>
                                        <input type="text" name="username"  size="30" required="required" style="font-size:12pt;height:25px" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Password :&nbsp;</td>
                                    <td><input type="password" name="password"  size="30" required="required" style="font-size:12pt;height:25px" /></td>
                                </tr>
                                <tr>
                                    <td height="63" align="right">Confirm Password :&nbsp;</td>
                                    <td><input type="password" name="password2"  size="30" required="required" style="font-size:12pt;height:25px" /></td>
                                </tr>
                                <tr>
                                    <td height="57" align="right"><input type="submit" class="btn btn-primary" value="Submit"></td>
                                    <td align="center"><input type="reset" class="btn btn-default"  value="Cancel"></td>
                                </tr>
                               
                            </table></td>
                    </tr>
                    </form>
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
