/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package temp.model;

import java.util.ArrayList;

/**
 *
 * @author Manav
 */
public class ModelResultShow {

    private String district;
    private String party;
    private String candidate;
    private int constituency;
    private int vote;

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public String getCandidate() {
        return candidate;
    }

    public void setCandidate(String candidate) {
        this.candidate = candidate;
    }

    public int getConstituency() {
        return constituency;
    }

    public void setConstituency(int constituency) {
        this.constituency = constituency;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }

    public ArrayList<ModelResultShow> showResult() {
        ModelResultShow result = null;
        ArrayList<ModelResultShow> list = new ArrayList<ModelResultShow>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT   district,constituency,candidate,party,count(candidate) as vote FROM voting where party=? and district=? group by candidate,party order by constituency";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getParty());
            dbcon.st.setString(2, getDistrict());

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                result = new ModelResultShow();

                result.setDistrict(dbcon.rs.getString(1));
                result.setConstituency(dbcon.rs.getInt(2));
                result.setCandidate(dbcon.rs.getString(3));
                result.setParty(dbcon.rs.getString(4));
                result.setVote(dbcon.rs.getInt(5));

                list.add(result);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }
    
    public ArrayList<ModelResultShow> showResultByParty() {
        ModelResultShow result = null;
        ArrayList<ModelResultShow> list = new ArrayList<ModelResultShow>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT   district,constituency,candidate,party,count(candidate) as vote FROM voting where party=? group by candidate,party order by district";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getParty());           

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                result = new ModelResultShow();

                result.setDistrict(dbcon.rs.getString(1));
                result.setConstituency(dbcon.rs.getInt(2));
                result.setCandidate(dbcon.rs.getString(3));
                result.setParty(dbcon.rs.getString(4));
                result.setVote(dbcon.rs.getInt(5));

                list.add(result);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }
    
    public ArrayList<ModelResultShow> showResultByDistrict() {
        ModelResultShow result = null;
        ArrayList<ModelResultShow> list = new ArrayList<ModelResultShow>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT   district,constituency,candidate,party,count(candidate) as vote FROM voting where district=? group by candidate,party order by constituency";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getDistrict());

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                result = new ModelResultShow();

                result.setDistrict(dbcon.rs.getString(1));
                result.setConstituency(dbcon.rs.getInt(2));
                result.setCandidate(dbcon.rs.getString(3));
                result.setParty(dbcon.rs.getString(4));
                result.setVote(dbcon.rs.getInt(5));

                list.add(result);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }
    public ArrayList<ModelResultShow> showWinnerResultByDistrict() {
        ModelResultShow result = null;
        ArrayList<ModelResultShow> list = new ArrayList<ModelResultShow>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = " select district,constituency,candidate,party, max(vote) as winner from (SELECT district,constituency,candidate,party,count(candidate) as vote FROM voting where district=? group by constituency,candidate,party order by vote desc) as tbl group by constituency order by constituency";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getDistrict());

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                result = new ModelResultShow();

                result.setDistrict(dbcon.rs.getString(1));
                result.setConstituency(dbcon.rs.getInt(2));
                result.setCandidate(dbcon.rs.getString(3));
                result.setParty(dbcon.rs.getString(4));
                result.setVote(dbcon.rs.getInt(5));

                list.add(result);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }
    public ArrayList<ModelResultShow> showWinnerResultByParty() {
        ModelResultShow result = null;
        ArrayList<ModelResultShow> list = new ArrayList<ModelResultShow>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT   district,constituency,candidate,party,winner from (select district,constituency,candidate,party,max(vote) as winner from(select district,constituency,candidate,party,count(candidate) as vote from voting group by district,constituency,candidate,party order by vote desc )as tbl2 group by district,constituency)as tbl3 where party=?";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getParty());           

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                result = new ModelResultShow();

                result.setDistrict(dbcon.rs.getString(1));
                result.setConstituency(dbcon.rs.getInt(2));
                result.setCandidate(dbcon.rs.getString(3));
                result.setParty(dbcon.rs.getString(4));
                result.setVote(dbcon.rs.getInt(5));

                list.add(result);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }
     public ArrayList<ModelResultShow> showWinnerResult() {
        ModelResultShow result = null;
        ArrayList<ModelResultShow> list = new ArrayList<ModelResultShow>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "select district,constituency,candidate,party,max(vote) as winner from (SELECT   district,constituency,candidate,party,count(candidate) as vote from voting group by district,constituency,candidate,party order by vote desc )as tbl2 group by district,constituency";
            dbcon.st = dbcon.con.prepareStatement(sql);              

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                result = new ModelResultShow();

                result.setDistrict(dbcon.rs.getString(1));
                result.setConstituency(dbcon.rs.getInt(2));
                result.setCandidate(dbcon.rs.getString(3));
                result.setParty(dbcon.rs.getString(4));
                result.setVote(dbcon.rs.getInt(5));

                list.add(result);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }
    
}
