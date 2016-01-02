<%-- 
    Document   : newjsp1
    Created on : Jul 8, 2014, 3:06:50 PM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
                        <li><a href="voting.jsp">Voting </a></li>
                        <li><a href="contactUs.jsp">Contact us </a></li>

                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Nav end --> 

            <!-- maincontent Starts -->
            <div class="download-style">
                <h1 align="center">Find from here !</h1></br>
                <div align="center"><table width="604" height="354" border="0">
                        <tr>
                            <td scope="col"> <ul type ="disc">
                                    <li>
                                        <a href="voterId.jsp"> <button class="btn btn-block" >    Voter ID</button></a></br>
                                    </li>
                                    <li>
                                        <a href="seeVoterList.jsp"> <button class="btn btn-block" > Voter List</button></a></br>

                                    </li>
                                    <li>
                                        <a href="seeCandidateList.jsp">  <button class="btn btn-block" > Candidate List </button></a></br>

                                    </li>
                                    <li>
                                        <a href="seeResult.jsp">  <button class="btn btn-block" >  Results </button></a></br>

                                    </li>

                                </ul></td>
                        </tr>
                    </table>

                </div>

            </div>

            <div class="clear"></div>
        </div>
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
