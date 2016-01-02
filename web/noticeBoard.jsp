<%-- 
    Document   : index
    Created on : Jun 24, 2014, 3:50:50 PM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="temp.model.DB_Connect;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Voting</title>

        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />

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
            <div class="form_registration">
              
                <section>
                    <div class="row">
                        <!-- <h6> <font color="blue"></font></h6><!--for spacing below carousel-->
                        <section class="sidebar col col-lg-4"><!-- notice row section start-->

                            <div class="panel panel-primary">
                                <div align="center"class="panel-heading"><font size="5"><b> List of Notices </b></font></div>
                                <div class="list-group list-group-flush">
                                    <%
                                        DB_Connect dbcon = new DB_Connect();

                                        try {
                                            dbcon.st = dbcon.con.prepareStatement("SELECT * FROM notice order by id desc");
                                            dbcon.rs = dbcon.st.executeQuery();
                                            while (dbcon.rs.next()) {
                                                dbcon.i = dbcon.rs.getInt(1);
                                    %>

                                    <a href="noticeBoard.jsp?krtp=<%= dbcon.rs.getInt(1)%>" class="list-group-item"><b><%= dbcon.rs.getString(2)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= dbcon.rs.getString(4).substring(0, 10)%></b><h5
                                            class="list-group item heading"> </h5>

                                    </a> 

                                    <%
                                            }
                                        } catch (Exception ex) {
                                            ex.getMessage();
                                        }%>

                                </div> 
                            </div>
                        </section>

                        <section class="sidebar col col-lg-8">
                            
                            <%
                                String ID = request.getParameter("krtp");
                                int k = Integer.parseInt(ID);

                                try {
                                    dbcon.st = dbcon.con.prepareStatement("SELECT * FROM notice where id=" + k);
                                    dbcon.rs = dbcon.st.executeQuery();
                                    while (dbcon.rs.next()) {

                            %>
                            <div id="notice_head"><p><b><%= dbcon.rs.getString(2)%> </b></p></div>
                            <div id="notice_box"> <p><%= dbcon.rs.getString(3)%></p> </div>

                            <%
                                    }
                                } catch (Exception ex) {
                                    ex.getMessage();
                                }%>
                        </section>

                    </div>


                </section>

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
