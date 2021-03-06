<%-- 
    Document   : winnerList
    Created on : Jul 6, 2014, 8:31:25 PM
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
                if(session.getAttribute("loginAs")==null)
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
                        <li><a href="logout.jsp">Logout </a></li>


                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Nav end --> 

            <!-- maincontent Starts -->
            <div class="form_registration">
                <div align="center">
                <h3>Final Result Of The Winners here !</h3><br/><br/>

                <form id="form1" name="form1" method="post" action="WinnerResultShow">
                    <p>Enter District :
                        <label for="district"></label>
                        <input name="district" type="text" id="district" size="25" maxlength="50" required="" style="font-size:14pt;height:25px" />	
                        <button type="submit" class="btn btn-primary" >Submit</button>
                    </p>
                </form><br/>
                
                <form method="post" action="WinnerResultShow">
                    <p>Enter Party : 
                        <label for="party"></label>
                        <input name="party" type="text" id="party" size="25" maxlength="60" required="" style="font-size:14pt;height:25px"/>
                        <button type="submit" class="btn btn-primary" >Submit</button>
                    </p>
                </form>        </br>  
              </div>
                </br>              
 
                <table width="965" height="258" border="1">
                    <tr>
                        <th  width="150" scope="col">District</th>
                        <th width="120" scope="col">Constituency No.</th>
                        <th width="275" scope="col">Name</th>
                        <th width="224" scope="col">Party</th>
                        <th width="100" scope="col">Vote </th>
                    </tr>
                      <c:forEach var="result" items="${value}">
                    <tr>
                        <td>${result.district}</td>
                        <td align =center>${result.constituency}</td>
                        <td>${result.candidate}</td>
                        <td>${result.party}</td>
                        <td align="center">${result.vote}</td>
                    </tr>
                    </c:forEach>
                    <tr>
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
                    </tr>
                    <tr>
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
                    </tr>
                    <tr>
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
