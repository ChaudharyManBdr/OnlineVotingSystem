<%-- 
    Document   : editCandidate
    Created on : Aug 3, 2014, 2:35:22 PM
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
                <h1>Update candidate information from here!</h1><br/>

                <%   
                    String citizenNum = request.getParameter("citizen_no");
                    DB_Connect dbcon = new DB_Connect();
                    try {
                        String sql = "SELECT * FROM candidate WHERE citizen_no=?";

                        dbcon.st = dbcon.con.prepareStatement(sql);

                        dbcon.st.setString(1, citizenNum);
                        dbcon.rs = dbcon.st.executeQuery();

                        while (dbcon.rs.next()) {%>   


                <table width="760" height="420" border="0">
                    <form method="post" action="CandidateRegistration">
                        <tr>
                            <td width="119">CitizenShip No. :</td>
                            <td width="225"><%= dbcon.rs.getString(1)%></td>
                            <td width="225"><label for="textfield6"></label>
                                <input type="hidden" name="cit_no"   value="<%= dbcon.rs.getString(1)%>"/>Type Here For Updating...!</td>
                        </tr>
                        <tr>
                            <td>Name :</td>
                            <td><%= dbcon.rs.getString(2)%></td>
                            <td><label for="textfield7"></label>
                                <input type="text" name="name" id="textfield7" size="30" style="font-size:14pt;height:25px" required="Name is Required !"/></td>
                        </tr>
                        <tr>
                            <td>Election District :</td>
                            <td><%= dbcon.rs.getString(3)%></td>
                            <td><label for="textfield8"></label>
                                <input type="text" name="district" id="textfield8" style="font-size:14pt;height:25px" required="It is Required !" /></td>
                        </tr>
                        <tr>
                            <td>Constituency No. :</td>
                            <td><%= dbcon.rs.getString(4)%></td>
                            <td><label for="textfield9"></label>
                                <input type="text" name="constituency" id="textfield9"  style="font-size:14pt;height:25px"  required="It is Required !"/></td>
                        </tr>
                        <tr>
                            <td>Party :</td>
                            <td><%= dbcon.rs.getString(5)%></td>

                            <%
                                    }

                                } catch (Exception e) {
                                    e.getMessage();
                                }

                            %>
                            <td>
                                <label for="textfield"></label>
                                <input type="text" name="party" id="textfield" size="30" style="font-size:14pt;height:25px"   required="It is Required !" />
                            </td>
                        </tr>
                        <tr>
                            <td><input type="hidden" name="check" value="updateAction"</td>
                            <td align="center"><button type="submit" name="submit"  class="btn btn-success"/>Update</button></td>
                            <td><button type="reset" name="clear"  class="btn btn-default" />Cancel</button></td>
                        </tr>
                    </form>
                </table>
            </div>

        </div>
        <!-- wrapper ends -->
    </body>

</html>


