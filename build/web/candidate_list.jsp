<%-- 
    Document   : candidate_list
    Created on : Jul 6, 2014, 8:31:03 PM
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
                if((session.getAttribute("username")==null)&&(session.getAttribute("password")==null))
                {
                
                response.sendRedirect("error.jsp");
                }
            
                
            %>

    </head>

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



            <!-- maincontent Starts -->
            <div class="form_registration">
                <h1>Manage candidate list from here!</h1><br/>

                <form id="form1" name="form1" method="post" action="CandidateListShow">
                    <p>Enter District :
                        <label for="district"></label>
                        <input name="district" type="text" id="district" size="25" maxlength="50"  required="" style="font-size:12pt;height:25px" />	
                       <button type="submit" class="btn btn-primary" >Submit</button>
                    </p></form><br/>
                    <form method="post" action="CandidateListShow"  > 
                        <p>Enter District. : 
                        <label for="const"></label>
                        <input type="text" name="district"  required="" style="font-size:12pt;height:25px" /> 
                        Enter Party : 

                        <label for="party"></label>
                        <input name="party" type="text"  size="30" maxlength="60" required="" style="font-size:12pt;height:25px" />
                        <button type="submit" class="btn btn-primary" >Submit</button>
                    </p></form>  <br/>
                    <form method="post" action="CandidateListShow">
                    <p>Enter Party : 
                        <label for="party"></label>
                        <input name="party" type="text" id="party" size="30" maxlength="60" required="" style="font-size:12pt;height:25px" />
                        <button type="submit" class="btn btn-primary" >Submit</button>
                    </p>
                   
                </form>
                </br><br/>
           <table width="970" height="127" border="1">
                    <tr>
                        <th  scope="col">District</th>
                        <th  scope="col">Constituency No.</th>
                        <th  scope="col">Party</th>
                        <th  scope="col">Name</th>
                         <th  scope="col">CitizenShip No.</th>
                         
                    </tr>
                    <c:forEach var="candidateInfo" items="${value}">
                    <tr>
                        
                        <td>${candidateInfo.district}</td>
                        <td align="center">${candidateInfo.constituency}</td>
                        <td>${candidateInfo.party}</td>
                        <td>${candidateInfo.name}</td>
                        <td align="center">${candidateInfo.citizenNo}</td>
                        <td align="center"><a href="editCandidate.jsp?citizen_no=${candidateInfo.citizenNo}"><button class="btn btn-warning">Edit</button></a></td>
                        <td align="center"><a href="deleteCandidate.jsp?citizen_no=${candidateInfo.citizenNo}"><button class="btn btn-danger">Delete</button></a></td>
                    </tr>
                         </c:forEach>
                   
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
