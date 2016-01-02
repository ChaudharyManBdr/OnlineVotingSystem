package temp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import temp.model.ModelRegistration;
import temp.model.*;

@WebServlet(name = "Registration", urlPatterns = {"/Registration"})
@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB  
public class Registration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String citizenNo = request.getParameter("citizen_no");
        String firstName = request.getParameter("fname");
        String middleName = request.getParameter("mname");
        String lastName = request.getParameter("lname");
        String dateOfBirth = request.getParameter("dob");
        String sex = request.getParameter("gender");
        String addrDistrict = request.getParameter("district");
        String addrVdc = request.getParameter("vdc");
        int addrWard = Integer.parseInt(request.getParameter("ward"));
        int consti_no = Integer.parseInt(request.getParameter("constituency"));
        String Email_addr = request.getParameter("email");

        ModelRegistration reg = new ModelRegistration();
        reg.setCitizenNo(citizenNo);
        reg.setFname(firstName);
        reg.setMname(middleName);
        reg.setLname(lastName);
        reg.setDob(dateOfBirth);
        reg.setGender(sex);
        reg.setDistrict(addrDistrict);
        reg.setVdc(addrVdc);
        reg.setWard(addrWard);
        reg.setConstituency(consti_no);
        reg.setEmail(Email_addr);

        boolean Yes = reg.onlineRegister();

        String success = "Successfully Your Information Is Submitted !";
        String failed = "Error : Sorry Registration Failed ....!";
        if (Yes) {
            request.setAttribute("Message", success);

            // forwards to the message page
            getServletContext().getRequestDispatcher("/messageSuccess.jsp").forward(request, response);
        } else {
            request.setAttribute("Message", failed);

            // forwards to the message page
            getServletContext().getRequestDispatcher("/messageError.jsp").forward(request, response);
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
