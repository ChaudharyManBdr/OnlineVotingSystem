<%-- 
    Document   : seeResult
    Created on : Aug 7, 2014, 6:39:13 PM
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
                <h3>Obtain result from here !</h3><br/><br/>

                <form id="form1" name="form1" method="post" action="SeeResult">
                    <p>Enter District :
                        <label for="district"></label>
                        <input name="district" type="text"  size="30" maxlength="50"  required="" style="font-size:12pt;height:25px"/>	
                        <button type="submit" class="btn btn-primary" >Submit</button>
                    </p>
                </form><br/>
                <form method="post" action="SeeResult">
                    <p>Enter District : 
                        <label for="const"></label>
                        <input type="text" name="district"  required="" style="font-size:12pt;height:25px" /> 
                        &nbsp;&nbsp;&nbsp;&nbsp;Enter Party : &nbsp;

                        <label for="party"></label>
                        <input name="party" type="text"  size="30" maxlength="60"  required="" style="font-size:12pt;height:25px"/>
                        <button type="submit" class="btn btn-primary" >Submit</button>
                    </p>
                </form><br/>
                <form method="post" action="SeeResult">
                    <p>Enter Party : &nbsp;
                        <label for="party"></label>
                        <input name="party" type="text"  size="30" maxlength="60"  required="" style="font-size:12pt;height:25px"/>
                        <button type="submit" class="btn btn-primary" >Submit</button>
                    </p>
                </form>
                </br><br/>

                <a href="seeWinnerList.jsp"><button type="submit" class="btn btn-success" >List Of Winner Click Here !</button></a>

                </br><br/><br/>

                <table width="965" height="258" border="1">
                    <tr>
                        <th width="149" scope="col">District</th>
                        <th width="125" scope="col">Constituency No.</th>
                        <th width="275" scope="col">Name Of Candidate</th>
                        <th width="224" scope="col">Name Of Party</th>
                        <th width="158" scope="col">Number Of Votes </th>
                    </tr>
                      <c:forEach var="result" items="${value}">
                    <tr>
                        <td>${result.district}</td>
                        <td>${result.constituency}</td>
                        <td>${result.candidate}</td>
                        <td>${result.party}</td>
                        <td>${result.vote}</td>
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
               
                </table>

                <div class="clear"></div>

            </div>
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

