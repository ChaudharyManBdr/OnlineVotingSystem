<%-- 
    Document   : accept
    Created on : Jul 16, 2014, 2:40:08 PM
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
    </head>
    <%
        
        String citizenNum = request.getParameter("citizen_no");
        out.println(citizenNum);
       // String Dob = request.getParameter("dob");
        //out.println(Dob);
        

        DB_Connect dbcon = new DB_Connect();
        try {           
            String sql = "INSERT INTO voter_list (dob,citizen_no) values (?,?)";
            dbcon.st = dbcon.con.prepareStatement(sql);
           // dbcon.st.setString(1, Dob);
            dbcon.st.setString(2, citizenNum);
           // dbcon.st.setString(3, voterId);
            int i = dbcon.st.executeUpdate();
           
            if(i==1){
                out.println("Registered in voter list successfully with unique voterId");
            }
            else
                out.println("Sorry failed to register in voter list");

        } catch (Exception e) {
            e.getMessage();
        }
    %>
    <body>
       
    </body>
</html>
