<!%-- 
Document   : voter_reg
Created on : Jul 6, 2014, 8:30:28 PM
Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="temp.controller.*;"%>
<%@page import="temp.model.*;" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    
           <%
                if((session.getAttribute("username")==null))
                {
                
                response.sendRedirect("error.jsp");
                }
            
                
            %>
   
    <body>
        <!-- wrapper starts -->
        <div class="wrapper"> 

            <!-- Header Starts -->
            <div class="header">
                <div class="header-container">
                    <div class="logo"> <a href="#"><b>Online Voting System</b></a> </div>
                    <div class="toll-free">

                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Header ends --> 

            <!-- Nav start -->
            <div class="nav">
                <div class="nav-in">

                    <div class="clear"></div>
                </div>
            </div>
            <!-- Nav end --> 

            <!-- maincontent Starts -->
            <div class="form_registration">
                <h1>Validation for the voter Registration!</h1> <br/><br/>

                <form id="form1" name="form1" method="post" action="VoterInfo">
                    Enter District : 
                    <label for="district"></label>
                    <input name="district" type="text" id="district" size="30" maxlength="50"  required="" style="font-size:12pt;height:25px" />
                    Constituency No. : 
                    <label for="constituency"></label>
                    <input name="constituency" type="text" id="district" size="15" maxlength="10"  required="" style="font-size:12pt;height:25px"/>	
                    <button type="submit" class="btn btn-primary" >Submit</button>
                </form>
                </br><br/>
                <table width="955" height="273" border="1">
                    <tr>
                        <th width="214" scope="col">CitizenShip No.</th>
                        <th width="353" scope="col">Name</th>
                        <th width="216" scope="col">Address</th>
                        <th width="169" scope="col">Action</th>
                    </tr>

                    <c:forEach var="voterInfo" items="${value}">
                        <tr>
                            <td height="45">${voterInfo.citizenNo}</td>
                            <td>${voterInfo.fname}  ${voterInfo.mname} ${voterInfo.lname}</td>
                            <td>${voterInfo.district}</td>
                            <td><a href="voter_reg_verification.jsp?citizen_no=${voterInfo.citizenNo}"><button class="btn btn-warning">Verify</button></a></td>

                      </tr>
                         </c:forEach>
                        <tr>
                          <td height="45">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="45">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="45">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="45">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="45">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="45">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="45">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="45">&nbsp;</td>
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
