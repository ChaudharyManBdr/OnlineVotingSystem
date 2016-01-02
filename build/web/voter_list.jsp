<%-- 
    Document   : voter_list
    Created on : Jul 6, 2014, 8:30:47 PM
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
                <h1>Manage voter list from here!</h1><br/><br/>
                
                <form id="form1" name="form1" method="post" action="VoterListShow">
                    Enter District :
                        <label for="district"></label>
                        <input name="district" type="text" id="district" size="25" maxlength="50"  required="" style="font-size:12pt;height:25px"/>	
                   
                    Constituency No. : 
                        <label for="const"></label>
                        <input type="text" name="constituency" id="const" size="10"  required="" style="font-size:12pt;height:25px"/>
                   
                   VDC/Municipality : 
                        <label for="vdc"></label>
                        <input name="vdc" type="text" id="vdc" size="20"  required="" style="font-size:12pt;height:25px"/>
                 
                  
                    <button type="submit" class="btn btn-primary" >Voter List</button>                                 
                   
                </form></br></br>
                 <form id="form1" name="form1" method="post" action="PendingListShow">
                    Enter District :
                        <label for="district"></label>
                        <input name="district" type="text" id="district" size="25" maxlength="50" required="" style="font-size:12pt;height:25px" />	
                   
                    Constituency No. : 
                        <label for="const"></label>
                        <input type="text" name="constituency" id="const" size="10"  required="" style="font-size:12pt;height:25px"/>
                   
                   VDC/Municipality : 
                        <label for="vdc"></label>
                        <input name="vdc" type="text" id="vdc" size="20" required="" style="font-size:12pt;height:25px" />
                 
                  
                                                    
                    <button type="submit" class="btn btn-primary" >Pending List</button>   
                </form>
                </br><br/>
               
                <table width="960" height="50" border="1">
                    <tr>
                        <th width="" scope="col">CitizenShip No.</th>
                        <th width="300" scope="col">Name</th>
                        <th width="216" scope="col" >Address</th>
                        <th width="169" scope="col">Date Of Birth</th>
                    </tr>
                    <tr> <c:forEach var="voterInfo" items="${value}">
                        <td align="center">${voterInfo.citizenNo}</td>
                        <td>${voterInfo.fname}  ${voterInfo.mname} ${voterInfo.lname}</td>
                        <td align="center"> ${voterInfo.vdc} - ${voterInfo.ward} ,${voterInfo.district}</td>
                        <td>${voterInfo.dob}</td>
                        <td align="center"><a href="deleteVoter.jsp?citizen_no=${voterInfo.citizenNo}"><button class="btn btn-warning">Delete</button></a></td>
                    </tr>
                    
                       </c:forEach>
                    
                </table>


               

            </div>
             <div class="clear"></div>
            <!-- aincontent ends --> 



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
