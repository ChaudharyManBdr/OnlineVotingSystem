<%-- 
    Document   : index
    Created on : Jun 24, 2014, 3:50:50 PM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h3>Download Voter ID</h3><br/>
                <table width="572" height="270" border="0">
                    <form action="VoterId" method="post">
                        <tr>
                            <td width="137" height="99">CitizenShip No. :</td>
                            <td width="304"> <input type="text" name="citizen_no"   size="25" required="" style="font-size:14pt;height:25px"/></td>
                            <td width="117">&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="66">Date Of Birth :</td>
                            <td><p>                             
                                yyyy-mm-dd</p>
                              <p> 
                               <input type="text" name="dob"   size="25" required="" style="font-size:14pt;height:25px"/>
                             (A.D.)</p>
                              <p>&nbsp;</p></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><button type="submit" name="submit"  class="btn btn-primary"/>Submit</button></td>
                            <td><button type="reset" name="clear"  class="btn btn-default" />Cancel</button></td>
                        </tr>
                    </form>
                    <div class="form_registration_p">  <%=request.getAttribute("Message")%></div>
                </table></br></br>
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
