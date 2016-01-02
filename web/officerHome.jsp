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
            <div class="header-officerPage">
                <div class="header-container">
                    <div class="logo"> <a href="#"><b>Wel-Come Officer</b></a> </div>
                    <div class="toll-free">
                      <p><b><a href="logout.jsp" class="btn btn-danger" role="button">Logout</a></b></p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Header ends --> 

            <!-- Nav start -->
            <div class="nav-officerPage">
                <div class="nav-in">
                    <ul>
                     
                        <li><a href="voter_reg.jsp">Voter Registration </a></li>
                        <li><a href="voter_list.jsp">Voter List </a></li>
                        <li><a href="candidate_reg.jsp"> Candidate Registration</a></li>
                        <li><a href="candidate_list.jsp">Candidate List </a></li>
                        <li><a href="logout.jsp">Logout </a></li>
                        
                        
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Nav end --> 

            <!-- maincontent Starts -->
            <div class="form_registration">
                <h3>Wel Come  <div class="form_registration_k">
                <h1><%=request.getAttribute("Message")%></h1>
                </div></h3><br/><br/>
				
			
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
