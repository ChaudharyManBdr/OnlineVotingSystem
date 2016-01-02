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
                              
                <table width="900" height="210" border="0">
                    <form id="form1" name="form1" method="post" action="NoticeUpload">
                        <tr>
                            <td height="58" align="center">Notice Title : <label for="textfield"></label>
                                <input type="text" name="title" size="40" placeholder=""style="font-size:14pt;height:28px" required="" />
                            </td>
                        </tr>
                        <tr>
                            <td width="900" height="23">
                                <label for="textarea"></label>
                                <textarea name="news" id="textarea" cols="85" rows="17"placeholder="Type Full Notice Here !"style="font-size:14pt;" required=""></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <input  class ="btn btn-success"type="submit" name="submit"value="Update Notice"/>  
                            </td>
                        </tr> </form>
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
