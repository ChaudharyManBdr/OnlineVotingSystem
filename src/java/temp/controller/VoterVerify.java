/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package temp.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "VoterVerify", urlPatterns = {"/VoterVerify"})
public class VoterVerify extends HttpServlet {

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

        String Accept = request.getParameter("accept");
        String Reject = request.getParameter("reject");
        String Pending = request.getParameter("pending");

        ModelRegistration mr = new ModelRegistration();
       
        if (Accept != null) {
             mr.setCitizenNo(Accept);
             mr.selectingDob();
            boolean Y = mr.voterAccept();
            if (Y) {
                String message = " Successfully Recorded in Voter List !";
                request.setAttribute("Message", message);
                RequestDispatcher view = request.getRequestDispatcher("messageSuccess.jsp");
                view.forward(request, response);
            } else {
                String message = "Error occurred :Sorry failed !!";
                request.setAttribute("Message", message);
                RequestDispatcher view = request.getRequestDispatcher("messageError.jsp");
                view.forward(request, response);
            }

        }
        if (Reject != null) {
            mr.setCitizenNo(Reject);
            
            boolean Y = mr.voterReject();
            if (Y) {
                String message = " Successfully Registration rejected !";
                request.setAttribute("Message", message);

                RequestDispatcher view = request.getRequestDispatcher("messageSuccess.jsp");
                view.forward(request, response);
            } else {
                String message = "Error : Sorry Failed in Operation !";
                request.setAttribute("Message", message);

                RequestDispatcher view = request.getRequestDispatcher("messageError.jsp");
                view.forward(request, response);
            }

        }
        if (Pending != null) {
            mr.setCitizenNo(Pending);
            mr.selectingDob();
            boolean Y = mr.voterPending();
            if (Y) {
                String message = "Successfully Recorded in Pending list !";
                request.setAttribute("Message", message);

                RequestDispatcher view = request.getRequestDispatcher("messageSuccess.jsp");
                view.forward(request, response);
            } else {
                String message = "Error : Sorry Failed in Operation !";
                request.setAttribute("Message", message);

                RequestDispatcher view = request.getRequestDispatcher("messageError.jsp");
                view.forward(request, response);

            }
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
