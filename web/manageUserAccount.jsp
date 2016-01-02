<%-- 
    Document   : notice_upload
    Created on : Jul 6, 2014, 8:31:41 PM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <h2> Manage User Account !</h2></br></br>
                <div align="center">
                <form method="post" action="ManageUserAccount">
                    <input type="submit" value="Show List Of Users" class="btn btn-success">
                </form></div>
                </br>

                <table width="960" height="275" border="1">
                    <tr>
                        <th width="220" scope="col">Name</th>
                        <th width="130" scope="col">Address</th>
                        <th width="200" scope="col">E-mail</th>
                        <th width="110" scope="col">Username</th>
                        <th width="110" scope="col">Password</th>
                        <th width="77" scope="col">Edit</th>
                        <th width="75" scope="col">Delete</th>
                    </tr>
                    <c:forEach var="userInfo" items="${value}">
                    <tr>
                        <td>${userInfo.name}</td>
                        <td>${userInfo.address}</td>
                        <td>${userInfo.email}</td>
                        <td align="center">${userInfo.username}</td>
                        <td align="center">${userInfo.password}</td>
                        <td align="center"><a href="editUserPass.jsp?email_id=${userInfo.email}"><button class="btn btn-warning">Edit</button></a></td>
                        <td align="center"><a href="deleteUserPass.jsp?email_id=${userInfo.email}"><button class="btn btn-danger">Delete</button></a></td>
                    </tr>
                      </c:forEach>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
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
