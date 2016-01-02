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
        <%
                if((session.getAttribute("username")==null)&&(session.getAttribute("password")==null))
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
                <h3>Candidate Registration Form</h3><br/>

                <table width="790" height="408" border="0">
                    <form action="CandidateRegistration" method="get" enctype="multipart/form-data">
                        <tr>
                            <td width="127">CitizenShip No. :</td>
                            <td width="218"><label for="citizen_no"></label>
                                <input type="text" name="cit_no" id="citizen_no"  size="20"  required="" style="font-size:12pt;height:25px"/></td>
                            <td width="238">&nbsp;</td>
                            <td width="189">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Name :</td>
                            <td><label for="viterid"></label>
                               
                                <input type="text" name="name" id="fname" size="30"  required="" style="font-size:12pt;height:25px"/></td>
                           
                        </tr>
                        <tr>
                            <td>Election District :</td>
                            <td><label for="district"></label>
                                <label for="district"></label>
                                <input type="text" name="district" id="district"  size="25"  required="" style="font-size:12pt;height:25px"/></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Constituency No. </td>
                            <td><label for="consti"></label>
                                <input type="text" name="constituency" size="10" required="" style="font-size:12pt;height:25px"/></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Party :</td>
                            <td><label for="party"></label>
                                <input type="text" name="party" id="party"  size="35"  required="" style="font-size:12pt;height:25px"/></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center"><button type="submit" class="btn btn-primary" >Submit</button></td>
                            <td><button type="reset" class="btn btn-default" >Cancel</button></td>
                            <td>&nbsp;</td>
                        </tr>
                    </form>
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
