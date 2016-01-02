package temp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import temp.model.*;

@WebServlet(name = "Voting", urlPatterns = {"/Voting"})
public class Voting extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String addrDistrict = request.getParameter("district");
        int const_no = Integer.parseInt(request.getParameter("constituency"));
        String Candidate = request.getParameter("candidate");
        String Party = request.getParameter("party");

        ModelVoting mv = new ModelVoting();
        
        mv.setDistrict(addrDistrict);
        mv.setConstituency(const_no);
        mv.setCandidate(Candidate);
        mv.setParty(Party);

        String success = "Successfully your vote is submitted";
        String failed = "Sorry Invalid , Voting Failed";
        boolean exist = mv.checkVoterList();
        if (exist) {

            boolean districtTrue = mv.checkDistrict();
            if (districtTrue) {
                boolean Yes = mv.castVote();
                if (Yes) {
                    request.setAttribute("Message", success);

                    getServletContext().getRequestDispatcher("/messageSuccess.jsp").forward(request, response);

                } else {
                    request.setAttribute("Message", "Error : Sorry Voting Failed  !");

                    getServletContext().getRequestDispatcher("/messageError.jsp").forward(request, response);

                }

            } else {
                request.setAttribute("Message", "Error : Sorry Failed  District and Constituency Number Not Matched !");

                // forwards to the message page
                getServletContext().getRequestDispatcher("/messageError.jsp").forward(request, response);
            } 

        } else {
            String message = "Sorry Invalid voter ID !";
            request.setAttribute("Message", message);
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
