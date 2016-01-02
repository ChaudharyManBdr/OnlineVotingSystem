<%-- 
    Document   : Message
    Created on : Jun 24, 2014, 9:43:11 PM
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

                    <div class="clear"></div>
                </div>
            </div>
            <!-- Header ends --> 
            <div class="form_registration">
            <center>
                </br></br</br></br>
                <div class="form_registration_k">
                <h1><%=request.getAttribute("Message")%></h1>
                </div>
                
            </center>
            </div>

        </div>
        <!-- wrapper ends -->
    </body>

</html>
