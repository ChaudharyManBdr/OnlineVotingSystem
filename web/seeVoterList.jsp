<%-- 
    Document   : seeVoterList
    Created on : Aug 7, 2014, 6:38:48 PM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Voting</title>

        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

    </head>
    <body>
        <!-- wrapper starts -->
        <div class="wrapper"> 

            <!-- Header Starts -->
            <div class="header">
                <div class="header-container">
                    <div class="logo"> <a href="#"><b>Online Voting System</b></a> </div>
                    <div class="toll-free">
                        <p>Call us at : 9841483963</p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Header ends --> 

            <!-- Nav start -->
            <div class="nav">
                <div class="nav-in">
                    <ul>
                        <li class="last"><a href="index.jsp">Home </a></li>
                        <li><a href="registration.jsp">Registration </a></li>
                         <li><a href="voterId.jsp"> Voter-ID</a></li>
                        <li><a href="voting.jsp">Voting</a></li>
                        <li><a href="contactUs.jsp">Contact us </a></li>

                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Nav end --> 

            <!-- maincontent Starts -->
            <div class="form_registration">
                <h1>See voter list from here!</h1><br/><br/>
                
                <form id="form1" name="form1" method="post" action="SeeVoterList">
                    Enter District :
                        <label for="district"></label>
                        <input name="district" type="text" id="district" size="25" maxlength="50"  required="" style="font-size:12pt;height:25px"/>	
                   
                    Constituency No. : 
                        <label for="const"></label>
                        <input type="text" name="constituency" id="const" size="10"  required="" style="font-size:12pt;height:25px"/>
                   
                   VDC/Municipality : 
                        <label for="vdc"></label>
                        <input name="vdc" type="text" id="vdc" size="20"  required="" style="font-size:12pt;height:25px"/>
                 
                  
                    <button type="submit" class="btn btn-primary" >Submit</button>                                 
                   
                </form></br></br>
                
                </br><br/>
               
                <table width="900" height="50" border="1">
                    <tr>
                      
                        <th width="300" scope="col">Name</th>
                        <th width="216" scope="col" >Address</th>
                        <th width="169" scope="col">Age</th>
                    </tr>
                    <tr> <c:forEach var="voterInfo" items="${value}">
                       
                        <td>${voterInfo.fname}  ${voterInfo.mname} ${voterInfo.lname}</td>
                        <td align="center"> ${voterInfo.vdc} - ${voterInfo.ward} ,${voterInfo.district}</td>
                        <td align='center'>${voterInfo.age}</td>
                        
                    </tr>
                    
                       </c:forEach>
                    
                </table>


               

            
             <div class="clear"></div>
            </div></br></br></br>
            <!-- aincontent ends --> 



            <!-- footer starts -->
            <div class="footer">
                <div class="footer-in">
                    <div class="social-icons">
                        <ul>
                            <li><a href="#"><img src="images/face-book.png" width="16" height="16" alt="img" /></a></li>
                            <li><a href="#"><img src="images/twitter.png" width="16" height="16" alt="img" /></a></li>
                            <li class="last"><a href="#"><img src="images/google.png" width="16" height="16" alt="img" /></a></li>
                        </ul>
                        <div class="clear"></div>
                    </div>
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

