<%-- 
    Document   : deleteUserPass
    Created on : Aug 5, 2014, 9:39:42 PM
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

                <%                    String email_ID = request.getParameter("email_id");

                    DB_Connect dbcon = new DB_Connect();
                    try {
                        String sql = "DELETE FROM user WHERE email=?";

                        dbcon.st = dbcon.con.prepareStatement(sql);

                        dbcon.st.setString(1, email_ID);
                        int i = 0;
                        i = dbcon.st.executeUpdate();

                        if (i == 1) {
                            //out.println("Successfully  User  Deleted !");
                            request.setAttribute("Message", "Successfully  User  Deleted !");

                            // forwards to the message page
                            getServletContext().getRequestDispatcher("/messageSuccess.jsp").forward(request, response);
                        } else {
                            //  out.println("Error : Sorry Failed  !");
                            request.setAttribute("Message", "Error : Sorry Opeation Failed  !");

                            // forwards to the message page
                            getServletContext().getRequestDispatcher("/messageError.jsp").forward(request, response);
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

