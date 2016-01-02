package temp.model;

import java.util.ArrayList;

public class ModelCandidateRegistration {

    private String citizenNo;
    private String name;

    private String district;
    private int constituency;
    private String party;

    public String getCitizenNo() {
        return citizenNo;
    }

    public void setCitizenNo(String citizenNo) {
        this.citizenNo = citizenNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public int getConstituency() {
        return constituency;
    }

    public void setConstituency(int constituency) {
        this.constituency = constituency;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public boolean candidateRegister() {
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = " INSERT INTO candidate (citizen_no,name,district,constituency,party) values (?,?,?,?,?)";

            dbcon.st = dbcon.con.prepareStatement(sql);

            dbcon.st.setString(1, getCitizenNo());
            dbcon.st.setString(2, getName());

            dbcon.st.setString(3, getDistrict());
            dbcon.st.setInt(4, getConstituency());
            dbcon.st.setString(5, getParty());

            int check = 0;
            check = dbcon.st.executeUpdate();
            if (check == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            return false;
        }
    }

    public ArrayList<ModelCandidateRegistration> showCandidatelistByDistrict() {
        ModelCandidateRegistration candidateList = null;
        ArrayList<ModelCandidateRegistration> list = new ArrayList<ModelCandidateRegistration>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT   name,district,constituency,party,citizen_no FROM candidate where district=? order by constituency";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getDistrict());

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                candidateList = new ModelCandidateRegistration();

                candidateList.setName(dbcon.rs.getString(1));

                candidateList.setDistrict(dbcon.rs.getString(2));
                candidateList.setConstituency(dbcon.rs.getInt(3));
                candidateList.setParty(dbcon.rs.getString(4));
                candidateList.setCitizenNo(dbcon.rs.getString(5));

                list.add(candidateList);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }

    public ArrayList<ModelCandidateRegistration> showCandidatelistByParty() {
        ModelCandidateRegistration candidateList = null;
        ArrayList<ModelCandidateRegistration> list = new ArrayList<ModelCandidateRegistration>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT   name,district,constituency,party,citizen_no FROM candidate where party=? order by district";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getParty());

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                candidateList = new ModelCandidateRegistration();

                candidateList.setName(dbcon.rs.getString(1));

                candidateList.setDistrict(dbcon.rs.getString(2));
                candidateList.setConstituency(dbcon.rs.getInt(3));
                candidateList.setParty(dbcon.rs.getString(4));
                candidateList.setCitizenNo(dbcon.rs.getString(5));

                list.add(candidateList);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }

    public ArrayList<ModelCandidateRegistration> showCandidatelist() {
        ModelCandidateRegistration candidateList = null;
        ArrayList<ModelCandidateRegistration> list = new ArrayList<ModelCandidateRegistration>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT   name,district,constituency,party,citizen_no FROM candidate where district=? and party=? order by constituency";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getDistrict());
            dbcon.st.setString(2, getParty());

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                candidateList = new ModelCandidateRegistration();

                candidateList.setName(dbcon.rs.getString(1));

                candidateList.setDistrict(dbcon.rs.getString(2));
                candidateList.setConstituency(dbcon.rs.getInt(3));
                candidateList.setParty(dbcon.rs.getString(4));
                 candidateList.setCitizenNo(dbcon.rs.getString(5));

                list.add(candidateList);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }
    public boolean editCandidate(){
         DB_Connect dbcon = new DB_Connect();

        try {
            String sql = " UPDATE candidate SET name=?, district=?, constituency=?, party=? WHERE citizen_no="+getCitizenNo();
            dbcon.st = dbcon.con.prepareStatement(sql);
           
            dbcon.st.setString(1, getName());
            dbcon.st.setString(2, getDistrict());
            dbcon.st.setInt(3, getConstituency());
            dbcon.st.setString(4, getParty());
           
           

            int check = 0;
            check = dbcon.st.executeUpdate();
            
            
            if (check ==1) {
                 
                return true;
            } else {
                 
                return false;
            }
        } catch (Exception ex) {
           ex.getMessage();
           return false;
        }
        
        
    }
    

}
