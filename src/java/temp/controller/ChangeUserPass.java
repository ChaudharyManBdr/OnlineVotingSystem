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
import temp.model.ModelUserAccount;

/**
 *
 * @author Manav
 */
@WebServlet(name = "ChangeUserPass", urlPatterns = {"/ChangeUserPass"})
public class ChangeUserPass extends HttpServlet {

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

        String userName = request.getParameter("oldUsername");
        String passWord = request.getParameter("oldPassword");
        String Email = request.getParameter("email");
        String newUsername = request.getParameter("username");
        String passWord1 = request.getParameter("password1");
        String passWord2 = request.getParameter("password2");
        if (userName != null) {

            if (passWord1.equals(passWord2)) {
                ModelUserAccount mua = new ModelUserAccount();

                mua.setUsername(userName);
                mua.setPassword(passWord);
                mua.setEmail(Email);
                mua.setNewusername(newUsername);
                mua.setNewpassword(passWord2);

                boolean Y = mua.changeUsernamePassword();
                String success = "Successfully  Updated  Username & Password !";
                String failed = "Error : Sorry  Failed";
                if (Y) {
                    request.setAttribute("Message", success);

                    // forwards to the message page
                    getServletContext().getRequestDispatcher("/messageSuccess.jsp").forward(request, response);
                } else {
                    request.setAttribute("Message", failed);

                    // forwards to the message page
                    getServletContext().getRequestDispatcher("/messageError.jsp").forward(request, response);
                }

            } else {

                request.setAttribute("Message", "Sorry Your Password Mismatched Try Again !");
                RequestDispatcher view = request.getRequestDispatcher("changeUsernamePassword.jsp");
                view.forward(request, response);
            }
        } else {
            if (passWord1.equals(passWord2)) {
                ModelUserAccount mua = new ModelUserAccount();               
                mua.setEmail(Email);
                mua.setNewusername(newUsername);
                mua.setNewpassword(passWord2);

                boolean Y = mua.editUserPass();
                String success = "Successfully  Updated  Username & Password !";
                String failed = "Error : Sorry  Failed";
                if (Y) {
                    request.setAttribute("Message", success);

                    // forwards to the message page
                    getServletContext().getRequestDispatcher("/messageSuccess.jsp").forward(request, response);
                } else {
                    request.setAttribute("Message", failed);

                    // forwards to the message page
                    getServletContext().getRequestDispatcher("/messageError.jsp").forward(request, response);
                }

            } else {

                request.setAttribute("Message", "Sorry  Password Mismatched Try Again !");
                RequestDispatcher view = request.getRequestDispatcher("editUserPass.jsp");
                view.forward(request, response);
            }

        }

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeUserPass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeUserPass at " + request.getContextPath() + "</h1>");
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
