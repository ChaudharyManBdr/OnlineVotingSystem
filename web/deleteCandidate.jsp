<%-- 
    Document   : deleteCandidate
    Created on : Aug 3, 2014, 2:35:44 PM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@  page import ="temp.model.*;" %>
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

                    <div class="clear"></div>
                </div>
            </div>
            <!-- Header ends --> 
            <div class="form_registration">

                <%             String citizenNum = request.getParameter("citizen_no");

                    DB_Connect dbcon = new DB_Connect();
                    try {
                        String sql = "DELETE FROM candidate WHERE citizen_no=?";

                        dbcon.st = dbcon.con.prepareStatement(sql);

                        dbcon.st.setString(1, citizenNum);
                        int i=0;
                        i = dbcon.st.executeUpdate();

                        
                        if (i == 1) {
                           out.println("Successfully  record is deleted from the system !");
                        } else {
                           out.println("Sorry failed error occurred !");
                        }

                    } catch (Exception e) {
                        e.getMessage();
                    }

                %>


            </div>

        </div>
        <!-- wrapper ends -->
    </body>

</html>

