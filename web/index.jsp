<%-- 
    Document   : index
    Created on : Jun 24, 2014, 3:50:50 PM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*;"%>
<%@page import="temp.model.DB_Connect;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Voting</title>

        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script src="js/jquery_library.js"></script>
        <script src="js/bootstrap.js" ></script>
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
                        <li><a href=" voterId.jsp">Voter-ID</a></li>
                        <li><a href="voting.jsp">Voting </a></li>
                        <li><a href="contactUs.jsp">Contact us </a></li>                         
                        <li class="no_bg ped"><a href="#"data-toggle="modal" data-target="#myModal">Login </a></li>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Nav end --> 

            <!-- maincontent Starts -->
            <div class="container">
                <div class="container-in"><!--  <img src="images/container-bg.jpg" width="940" height="300" alt="img" />  -->
                    <!-- Carousel                                 -->
                    <!--==========================================-->
                    <div id="myCarousel" class="carousel slide ">				
                        <div align="center" class="carousel-inner">				
                            <!--Carousel item 1-->
                            <div class="item active">
                                <img src="img/f.jpg" />
                                <div class="carousel-caption">
                                    <p><h3>	WelCome To Online Voting </h3></p>
                                </div>
                            </div>

                            <!--Carousel item 2-->
                            <div class="item">
                                <img src="img/a2.jpg"  />
                                <div class="carousel-caption">
                                    <p>	</p>
                                </div>
                            </div>

                            <!--Carousel item 3-->
                            <div class="item">
                                <img src="img/p2.jpg"  >
                                <div class="carousel-caption">
                                    <p>	</p>
                                </div>
                            </div>	
                            <!-- carousel item 4-->
                            <div class="item">
                                <img src="img/p1.jpg"  >
                                <div class="carousel-caption">
                                    <p>	</p>
                                </div>
                            </div>
                             <div class="item">
                                <img src="img/p3.jpg"  >
                                <div class="carousel-caption">
                                    <p>	</p>
                                </div>
                            </div>	
                             	

                        </div>
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
                    </div>  <!-- carousel end-->

                    <div class="read1">
                        <div class="read1-img1"> <img src="images/1.jpg" width="60" height="60" alt="img" /> </div>
                        <h3>Registration</h3>
                        <p>
                            <a href="registration.jsp">Click Here</a>
                        </p></div>
                    <div class="read1">
                        <div class="read1-img1"> <img src="images/2.jpg" width="60" height="60" alt="img" /> </div>
                        <h3>Voting</h3>
                        <p>
                            <a href="voting.jsp">Click Here</a>
                        </p></div>
                    <div class="read1 last">
                        <div class="read1-img1"> <img src="images/3.jpg" width="60" height="60" alt="img" /> </div>
                        <h3>Other Links</h3>
                        <p>
                            <a href="download.jsp">Click Here</a>
                        </p></div>
                    <div class="clear"></div>


                    </br>
                    <div class="bottom-cont1">
                        <h6>About us</h6>
                        <p>On-Line Voting System is a web based system that facilitates the running of elections online. This system has been proposed to simplify the process of organizing elections and make it convenient for voters to vote remotely from their home computers. 
                            The word “vote” means to choose from a list to elect a candidate. <a href="aboutUs.jsp"> Read all </a>


                        </p>
                    </div>



                    <div class="bottom-cont1">
                        <h6>Latest news</h6>
                        <%

                            DB_Connect dbcon = new DB_Connect();

                            try {
                                dbcon.st = dbcon.con.prepareStatement("SELECT * FROM notice order by id desc limit 3 ");
                                dbcon.rs = dbcon.st.executeQuery();
                                while (dbcon.rs.next()) {
                                    dbcon.i = dbcon.rs.getInt(1);
                        %>

                        <a href="noticeBoard.jsp?krtp=<%= dbcon.rs.getInt(1)%>">       
                            <span><%= dbcon.rs.getString(2)%>&nbsp;&nbsp;&nbsp;<%= dbcon.rs.getString(4).substring(0, 10)%></span></a>
                        <p><%= dbcon.rs.getString(3).substring(0, 30)%>........</p>

                        <%
                                }
                            } catch (Exception ex) {
                                ex.getMessage();
                            }%>

                        <a href="noticeBoard.jsp?krtp=0"> <span> Notice Board </span></a> 
                    </div>

                    <div class="bottom-cont1 last">
                        <h6>Side Bar Menu</h6>
                        <ul>
                            <li><a href="registration.jsp">On-line Registration</a></li></br>
                            <li><a href="voterId.jsp"> Get Voter-ID</a></li> </br>
                            <li><a href="seeCandidateList.jsp">See Candidate List</a></li></br>
                            <li><a href="seeVoterList.jsp">See Voter List </a></li> </br>
                            <li><a href="seeResult.jsp">See Results District Or Party Wise</a></li>                     
                            <li><a href="voting.jsp">Voting Here</a></li>

                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>       <!-- End of container-in div   -->
            </div>          <!-- End of container dic  -->
            <!-- aincontent ends --> 


            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <!--<h4 class="modal-title" id="myModalLabel">Sign In Here...</h4>    -->
                            <h3>Admin Login Area</h3> 
                        </div>  
                        <div class="modal-body">
                            <form class="well" method="post" action="UserLogin">
                                <label>User Name &nbsp;</label>
                                <input type="text" name="user" class="span5" required=""/><br/><br/>
                                <label>Password &nbsp;&nbsp;&nbsp;</label>
                                <input type="password" name="pass" class="span5" required=""/><br/><br/>
                                <label>Sign In as: &nbsp;&nbsp;</label>
                                Administrator &nbsp;
                                <input type= "radio"name="log" value="admin" checked="checked"/>&nbsp;&nbsp;
                                Officer &nbsp;
                                <input type= "radio" name = "log" value ="officer"/><br/><br/>
                                <button type="submit" class="btn btn-primary" >Login</button>
                                <button type="reset" class="btn btn-default" >Cancel</button>

                            </form>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>

                        </div>  
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->




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
