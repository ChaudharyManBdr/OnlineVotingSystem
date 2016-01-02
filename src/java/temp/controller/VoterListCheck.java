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
@WebServlet(name = "VoterListCheck", urlPatterns = {"/VoterListCheck"})
public class VoterListCheck extends HttpServlet {

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
        String votId = request.getParameter("voter_id");

        String cN = request.getParameter("c");
        String vI = request.getParameter("v");
        String District = request.getParameter("district");
        String constNum = request.getParameter("constituency");

        String Candidate = request.getParameter("candidate");
        String Party = request.getParameter("party");

        DB_Connect dbcon = new DB_Connect();
        String distName = null;
        String constNo = null;
        int check = 0;
        if (Candidate == null) {
            try {
                String sql = "SELECT a.district,a.constituency FROM registration a , voter_list b WHERE a.citizen_no = b.citizen_no and b.citizen_no=? and b.voter_id=?";
                dbcon.st = dbcon.con.prepareStatement(sql);
                dbcon.st.setString(1, citizenNo);
                dbcon.st.setString(2, votId);

                dbcon.rs = dbcon.st.executeQuery();
                while (dbcon.rs.next()) {
                    distName = dbcon.rs.getString(1);
                    constNo = dbcon.rs.getString(2);
                    check = 1;

                }

            } catch (Exception e) {
                e.getMessage();
            }
            if (check == 1) {
                request.setAttribute("citizen_no", citizenNo);
                request.setAttribute("voter_id", votId);
                request.setAttribute("districtName", distName);
                request.setAttribute("constNum", constNo);
                request.setAttribute("message", "Fill the candidate and party field with correct spelling as in reference table");

                RequestDispatcher view = request.getRequestDispatcher("votingNextPage.jsp");
                view.forward(request, response);
            } else {
                request.setAttribute("message", "Sorry Invalid voterID ! ");
                RequestDispatcher view = request.getRequestDispatcher("voting.jsp");
                view.forward(request, response);
            }
        }
        if (Candidate != null) {
            try {
                String sql = "SELECT a.district,a.constituency FROM registration a , voter_list b WHERE a.citizen_no = b.citizen_no and b.citizen_no=? and b.voter_id=?";
                dbcon.st = dbcon.con.prepareStatement(sql);
                dbcon.st.setString(1, cN);
                dbcon.st.setString(2, vI);

                dbcon.rs = dbcon.st.executeQuery();
                while (dbcon.rs.next()) {
                    distName = dbcon.rs.getString(1);
                    constNo = dbcon.rs.getString(2);

                }

            } catch (Exception e) {
                e.getMessage();
            }
            if (District.equals(distName) && constNum.equals(constNo)) {
                ModelVoting mv = new ModelVoting();
                int Consti = Integer.parseInt(constNum);
                mv.setCitizenNo(cN);
                mv.setVoterId(vI);
                mv.setDistrict(distName);
                mv.setConstituency(Consti);
                mv.setCandidate(Candidate);
                mv.setParty(Party);

                boolean Y = mv.castVote();
                String success = "Successfully Your Vote is Submitted";
                String failed = " Error : Sorry  Voting Failed !";
                if (Y) {
                    request.setAttribute("Message", success);

                    getServletContext().getRequestDispatcher("/messageSuccess.jsp").forward(request, response);

                } else {
                    request.setAttribute("Message", failed);

                    getServletContext().getRequestDispatcher("/messageError.jsp").forward(request, response);

                }
            } else {
                request.setAttribute("message", "Sorry District and Constituency Mismatched Try Again !");

                getServletContext().getRequestDispatcher("/voting.jsp").forward(request, response);

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
