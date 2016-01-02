/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package temp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import temp.model.*;

/**
 *
 * @author Manav
 */
@WebServlet(name = "VoterId", urlPatterns = {"/VoterId"})
public class VoterId extends HttpServlet {

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
     
        
        String CitizenShip = request.getParameter("citizen_no");
        String dateOfBirth = request.getParameter("dob");
        ModelRegistration mv = new ModelRegistration();
        mv.setCitizenNo(CitizenShip);
        mv.setDob(dateOfBirth);
        
        ArrayList<ModelRegistration> list = mv.getVoterId();                          
        
        if(list==null){
            request.setAttribute("Message", "Sorry error occurred Invalid inputs !");
        RequestDispatcher view = request.getRequestDispatcher("voterId.jsp");
        view.forward(request, response);
        }
        else{      
        request.setAttribute("value", list);
        RequestDispatcher view = request.getRequestDispatcher("showVoterId.jsp");
        view.forward(request, response);
        }
        
        
     
        
        
        
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
