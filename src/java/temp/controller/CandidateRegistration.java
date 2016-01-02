package temp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import temp.model.*;

@WebServlet(name = "CandidateRegistration", urlPatterns = {"/CandidateRegistration"})
public class CandidateRegistration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String citizenNo = request.getParameter("cit_no");
        String fullName = request.getParameter("name");
        String addrDistrict = request.getParameter("district");
        int consti_no = Integer.parseInt(request.getParameter("constituency"));
        String partyName = request.getParameter("party");       
        String checkVal = request.getParameter("check");

        ModelCandidateRegistration mcg = new ModelCandidateRegistration();

        mcg.setCitizenNo(citizenNo);
        mcg.setName(fullName);
        mcg.setDistrict(addrDistrict);
        mcg.setConstituency(consti_no);
        mcg.setParty(partyName);
        if (checkVal == null) {
            boolean Yes = mcg.candidateRegister();

            String success = "Successfully  Candidate Registered ..!";
            String failed = "Error Occurred, Sorry  Failed...!";
            if (Yes) {
                request.setAttribute("Message", success);

                // forwards to the message page
                getServletContext().getRequestDispatcher("/messageSuccess.jsp").forward(request, response);
            } else {
                request.setAttribute("Message", failed);

                // forwards to the message page
                getServletContext().getRequestDispatcher("/messageError.jsp").forward(request, response);
            }
        } else {
            boolean Y = mcg.editCandidate();
            if (Y) {
                request.setAttribute("Message","Successfully  Updated");

                // forwards to the message page
                getServletContext().getRequestDispatcher("/messageSuccess.jsp").forward(request, response);
            } else {
                request.setAttribute("Message", "Error : Sorry  Failed");

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
