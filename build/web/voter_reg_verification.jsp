<%-- 
    Document   : voter_reg
    Created on : Jul 6, 2014, 8:30:28 PM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@  page import ="temp.model.*;" %>
<%@page import="java.sql.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <%
            if ((session.getAttribute("username") == null) && (session.getAttribute("password") == null)) {

                response.sendRedirect("error.jsp");
            }


        %>
    </head>

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

            <!-- maincontent Starts -->
            <div class="form_registration">
                <h2>Validation for the voter registration!</h2> 

                <table width="970" height="400" border="0">
                    <tr>
                        <td width="380" scope="col">
                            <%                  String citizenNum = request.getParameter("citizen_no");

                                DB_Connect dbcon = new DB_Connect();
                                try {
                                    String sql = "SELECT  citizen_no,fname,mname,lname,dob,vdc,ward,district,TIMESTAMPDIFF(YEAR,dob,CURDATE()) AS age,gender FROM registration WHERE citizen_no=?";
                                    dbcon.st = dbcon.con.prepareStatement(sql);
                                    dbcon.st.setString(1, citizenNum);

                                    dbcon.rs = dbcon.st.executeQuery();

                                    while (dbcon.rs.next()) {
                            %>

                            CitizenShip Number : <%= dbcon.rs.getString(1)%> <br/><br/><br/>

                            Name :  <%= dbcon.rs.getString(2)%> <%= dbcon.rs.getString(3)%> <%= dbcon.rs.getString(4)%><br/><br/><br/>

                            Date Of Birth : <%= dbcon.rs.getString(5)%><br/><br/>

                            Age : <%= dbcon.rs.getString(9)%><br/><br/>

                            Gender : <%= dbcon.rs.getString(10)%><br/><br/>

                            Address : <%= dbcon.rs.getString(6)%> - <%= dbcon.rs.getString(7)%> , <%= dbcon.rs.getString(8)%><br/><br/>

                        </td>
                        <td width="590" scope="col">          
                            <%

                                // String s_email = "sunil" ;//request.getParameter(name);
                                out.println("<img width='500' height='400' src=PhotoDisplay.jsp?citNo='" + citizenNum + "'></img>");
                            %>
                        </td>
                    </tr>
                </table> </br>

                <div align="center">
                    <table width="390" height="38" border="0">
                        <tr>
                            <th width="118" scope="col"><form method="post" action="VoterVerify">
                            <input type="hidden" name="accept" value="<%=dbcon.rs.getString(1)%>" />
                            <button  type="submit" class="btn btn-primary">Accept</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </form></th>
                        <th width="116" scope="col"><form method="post" action="VoterVerify">
                            <input type="hidden" name="reject" value="<%=dbcon.rs.getString(1)%>" />
                            <button type="" class="btn btn-danger" >Reject</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </form></th>
                        <th width="138" scope="col"><form method="post" action="VoterVerify">
                            <input type="hidden" name="pending" value="<%=dbcon.rs.getString(1)%>" />
                            <button type="" class="btn btn-success" >Pending</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </form></th>
                        </tr>
                    </table>

                </div>



                <%
                        }

                    } catch (Exception e) {
                        e.getMessage();
                    }

                %>

                <div class="clear"></div>

            </div>
            <!-- aincontent ends --> 



            <!-- footer starts -->
            <div class="footer">
                <div class="footer-in">

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
