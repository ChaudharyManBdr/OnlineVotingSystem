package temp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import temp.model.ModelUserLogin;

@WebServlet(name = "UserLogin", urlPatterns = {"/UserLogin"})
public class UserLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String logIn = request.getParameter("log");
        String admin = "admin";
        String officer = "officer";

        if (username.equals("") && password.equals("")) {

            response.setHeader("Refresh", "1,index.jsp");
        } else {
            HttpSession session = request.getSession(true);
            ModelUserLogin model = new ModelUserLogin();
            model.setUser(username);
            model.setPass(password);
            model.setLog(logIn);

            boolean Y = model.userLogin();

            if (Y) {
                if (logIn.equals(admin)) {
                    request.setAttribute("Message", username);
                    RequestDispatcher rd = request.getRequestDispatcher("adminHome.jsp");
                    session.setAttribute("username", username);
                    session.setAttribute("password", password);
                    session.setAttribute("loginAs", logIn);
                    rd.forward(request, response);
                }
                if (logIn.equals(officer)) {
                    request.setAttribute("Message", username);
                    RequestDispatcher rda = request.getRequestDispatcher("officerHome.jsp");
                    session.setAttribute("username", username);
                    //session.setAttribute("password",password);
                    // session.setAttribute("loginAs", logIn);
                    rda.forward(request, response);
                }
            } else {
                String error = "Sorry Invalid User !!";
                request.setAttribute("Message", error);
                // forwards to the message page
                getServletContext().getRequestDispatcher("/messageError.jsp").forward(request, response);

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
