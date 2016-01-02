<%-- 
    Document   : showVoterId
    Created on : Jul 18, 2014, 12:55:28 PM
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
    </head>
    <body>

        <div class="wrapper"> 

            <!-- Header Starts -->
            <div class="header">
                <div class="header-container">
                    <div class="logo"> <a href="#"><b>Online Voting System</b></a> </div>

                    <div class="clear"></div>
                </div>
            </div>
            <!-- Header ends --> 
           
                </br></br</br></br>
                <div class="form_registration">
                     <c:forEach var="voterInfo" items="${value}">
                         <h1><div class="form_registration_k"> ${voterInfo.fname}  ${voterInfo.mname} ${voterInfo.lname}</div></h1> <br/><br/>
                    <table width="650" height="350" border="0">
                        
                        <tr>
                            <td width="185">Voter ID :</td>
                            <td width="455">${voterInfo.voter_id}</td>
                        </tr>
                        <tr>
                            <td>CitizenShip No. :</td>
                              <td>${voterInfo.citizenNo}</td>
                        </tr>
                        <tr>
                            <td>Name :</td>
                           <td>${voterInfo.fname}  ${voterInfo.mname} ${voterInfo.lname}</td>
                        </tr>
                        <tr>
                            <td>Sex :</td>
                           <td>${voterInfo.gender}</td>
                        </tr>
                        <tr>
                            <td>Date Of Birth. :</td>
                            <td>${voterInfo.dob}</td>
                        </tr>
                        <tr>
                            <td>Address :</td>
                            <td> ${voterInfo.vdc} - ${voterInfo.ward} , ${voterInfo.district}</td>
                        </tr>
                        <tr>
                            <td>Constituency No. :</td>
                            <td>${voterInfo.constituency}</td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td align="center">
                              <a href="index.jsp" <button  class="btn btn-success" > Back To Home</button></a>
                         </td>
                        </tr>
                         </c:forEach>
                    </table>
                         
             <div class="clear"></div>

        </div>
        <!-- footer starts -->
        <div class="footer">
            <div class="footer-in">

                <div class="copy">
                     <p>Copyright © 2014 On-line Voting System. All rights reserved. Developed by <a href="#" >Minor Project Group 2068/BCT 'A' HCOE </a></p>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!-- footer ends --> 

    </div>
    <!-- wrapper ends -->
</body>
</html>
