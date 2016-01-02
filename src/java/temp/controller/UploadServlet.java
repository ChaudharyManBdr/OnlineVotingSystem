/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package temp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import temp.model.*;

/**
 *
 * @author Manav
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})

@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB  
public class UploadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String citizenNo = request.getParameter("citizen_no");  
       
  
        InputStream inputStream = null;  
  
        // obtains the upload file part in this multipart request  
        Part filePart = request.getPart("photo");  
        if (filePart != null) {  
            // debug messages  
            System.out.println(filePart.getName());  
            System.out.println(filePart.getSize());  
            System.out.println(filePart.getContentType());  
  
            // obtains input stream of the upload file  
            inputStream = filePart.getInputStream();  
        }  
  
        String message = null; // message will be sent back to client  
        DB_Connect dbcon = new DB_Connect();
        
        try {  
            // constructs SQL statement  
            String sql = "INSERT INTO photo (citizen_no,photo) values (?,?)";  
            dbcon.st = dbcon.con.prepareStatement(sql);  
            dbcon.st.setString(1, citizenNo);  
          // a.st.setString(2, lName);  
  
            if (inputStream != null) {  
                // fetches input stream of the upload file for the blob column  
                dbcon.st.setBlob(2, inputStream);  
            }  
 
            // sends the statement to the database server  
            int row = dbcon.st.executeUpdate();  
            if (row > 0) {  
                message = "Please Fill your Information Detail Below !";  
            }  
        } catch (SQLException ex) {  
            message = "ERROR: Too Large Size Of File  !" ;
            //ex.getMessage();  
           // ex.printStackTrace();  
        }  
        // sets the message in request scope  
        request.setAttribute("Message", message);  
        request.setAttribute("citizenShipNo", citizenNo); 
  
        // forwards to the message page  
        getServletContext().getRequestDispatcher("/registration.jsp").forward(  
                request, response);  
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
