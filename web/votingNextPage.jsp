<%-- 
    Document   : twoTables
    Created on : Jul 21, 2014, 5:19:46 AM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*;"%>
<%@ page import="temp.model.*;"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <title>JSP Page</title>
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
                <h3>Voting Form</h3><br/>

                <div class="form_registration_k">   <%=request.getAttribute("message")%> </div></br>
                Your CitizenShip No. = <%=request.getAttribute("citizen_no")%>
                and VoterID = <%=request.getAttribute("voter_id")%>
                <table width="970" height="392" border="0">
                    <tr>
                        <td width="527" height="386"><table width="514" height="305" border="0">
                                <form method="post" action="VoterListCheck" >
                                    <tr>
                                        <td width="180">Address District :</td>
                                        <td width="324"><label for="textfield4"></label>
                                            <input type="text" name="district" id="textfield4"  size="25" required="" style="font-size:12pt;height:25px"/></td>
                                    </tr>
                                    <input type="hidden" name="c" value="<%=request.getAttribute("citizen_no")%>">
                                    <input type="hidden" name="v" value="<%=request.getAttribute("voter_id")%>">
                                    <tr>
                                        <td>Constituency No. :</td>
                                        <td><label for="textfield5"></label>
                                            <input type="text" name="constituency" id="textfield5"  size="20"  required="" style="font-size:12pt;height:25px"/></td>
                                    </tr>
                                    <tr>
                                        <td>Candidate's Name :</td>
                                        <td><label for="textfield6"></label>
                                            <input type="text" name="candidate" id="textfield6" size="35"  required="" style="font-size:12pt;height:25px"/></td>
                                    </tr>
                                    <tr>
                                        <td>Party :</td>
                                        <td><label for="textfield7"></label>
                                            <input type="text" name="party" id="textfield7"size="35"   required="" style="font-size:12pt;height:25px"/></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><button type="submit" name="button" class="btn btn-primary">Submit</button></td>
                                    </tr>
                                </form>
                            </table></td>
                            
                                <%String cit_no = (String) request.getAttribute("citizen_no");%>
                                <% String vot_id = (String) request.getAttribute("voter_id");%>
                                <% String dName = (String) request.getAttribute("districtName");%>
                                <% String cNo = (String) request.getAttribute("constNum"); %>
                                  <%

                                    DB_Connect dbcon = new DB_Connect();

                                    try {
                                        String sql = "select name from candidate where district=? and constituency=?";
                                        dbcon.st = dbcon.con.prepareStatement(sql);
                                        dbcon.st.setString(1, dName);
                                        dbcon.st.setString(2, cNo);

                                        dbcon.rs = dbcon.st.executeQuery();
                                %>

                                
                        <td width="437"><table width="455" height="239" border="1">

                                Reference Table
                                <tr>
                                    <td width="137" align="center">Address District :</td>
                                    <td width="303" align="center"><input type="hidden" name ="district" />
                                    <%=request.getAttribute("districtName")%></td>
                                </tr>
                                <tr>
                                    <td align="center">Constituency No. :</td>
                                    <td align="center"><input type="hidden" name="constNo" />
                                        <%=request.getAttribute("constNum")%></td>
                                </tr>
                                <tr>
                                    <td align="center">List Of Candidate :</td>
                                    <td align="center"><select name="candidate" >
                                            <option>-------Spelling From Here -----</option>

                                           <%  while (dbcon.rs.next()) {%>

                                            <option> <%= dbcon.rs.getString(1)%>
                                                <% } %>
                                            </option>                        
                                        </select>
                                    </td>
                                </tr>
                                 <%    String sql2 = "select party from candidate where district=? and constituency=?";
                                            dbcon.st = dbcon.con.prepareStatement(sql2);
                                            dbcon.st.setString(1, dName);
                                            dbcon.st.setString(2, cNo);

                                            dbcon.rs = dbcon.st.executeQuery();

                                        %>
                                <tr>
                                    <td align="center">List Of Party :</td>
                                    <td align="center"><select name="p" id="p">
                                            <option>-------Spelling From Here -----</option>

                                            <%  while (dbcon.rs.next()) {%>
                                            <option><%= dbcon.rs.getString(1)%></option>
                                            <% }%>
                                        </select></td>
                                </tr>
                            </table></td>
                    </tr>
                </table>
                                        
<%

    } catch (Exception e) {
        out.println("Sorry error occurred " + e.getMessage());
    }
%>  




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
