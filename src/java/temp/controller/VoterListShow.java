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
@WebServlet(name = "VoterListShow", urlPatterns = {"/VoterListShow"})
public class VoterListShow extends HttpServlet {

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

        String districtName = request.getParameter("district");
        int constituencyNo = Integer.parseInt(request.getParameter("constituency"));
        String vdcName = request.getParameter("vdc");
        
        PendingVoting pv  = new PendingVoting();
        pv.setDistrict(districtName);
        pv.setConstituency(constituencyNo);
        pv.setVdc(vdcName);
        
        
        ArrayList<PendingVoting> list = pv.showVoterlist();
        if(list!=null){      
        request.setAttribute("value", list);
        RequestDispatcher view = request.getRequestDispatcher("voter_list.jsp");
        view.forward(request, response);
        }else{
            request.setAttribute("Message", "Error : Sorry  Invalid Inputs !");
        RequestDispatcher view = request.getRequestDispatcher("messageError.jsp");
        view.forward(request, response);
        }
        
        
        
        
        


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VoterListShow</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VoterListShow at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
