<%-- 
    Document   : logout
    Created on : 07-Jan-2014, 02:03:08
    Author     : bimal
                
            
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Logout Page</h1>
        <%       
            session.invalidate();
            response.sendRedirect("index.jsp");
        
        %>
        
    </body>
</html>
