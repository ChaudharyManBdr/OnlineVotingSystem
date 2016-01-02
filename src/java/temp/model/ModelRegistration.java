package temp.model;

import java.util.ArrayList;
import java.util.List;

public class ModelRegistration {

    private String citizenNo;
    private String fname;
    private String mname;
    private String lname;
    private String dob;
    private String gender;
    private String district;
    private String vdc;
    private int ward;
    private int constituency;
    private String email;
    private int voter_id;

    public String getCitizenNo() {
        return citizenNo;
    }

    public void setCitizenNo(String citizen_no) {
        this.citizenNo = citizen_no;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getVdc() {
        return vdc;
    }

    public void setVdc(String vdc) {
        this.vdc = vdc;
    }

    public int getWard() {
        return ward;
    }

    public void setWard(int ward) {
        this.ward = ward;
    }

    public int getConstituency() {
        return constituency;
    }

    public void setConstituency(int constituency) {
        this.constituency = constituency;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getVoter_id() {
        return voter_id;
    }

    public void setVoter_id(int voter_id) {
        this.voter_id = voter_id;
    }

    public boolean onlineRegister() {
        DB_Connect dbcon = new DB_Connect();
        int i = 0;
        try {
            String sql = "INSERT INTO registration (citizen_no,fname,mname,lname,gender,dob,district,vdc,ward,constituency,email) values(?,?,?,?,?,?,?,?,?,?,?)";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getCitizenNo());
            dbcon.st.setString(2, getFname());
            dbcon.st.setString(3, getMname());
            dbcon.st.setString(4, getLname());
            dbcon.st.setString(5, getGender());
            dbcon.st.setString(6, getDob());
            dbcon.st.setString(7, getDistrict());
            dbcon.st.setString(8, getVdc());
            dbcon.st.setInt(9, getWard());
            dbcon.st.setInt(10, getConstituency());
            dbcon.st.setString(11, getEmail());

            i = dbcon.st.executeUpdate();
            if (i == 1) {

                return true;
            } else {

                return false;
            }

        } catch (Exception ex) {
            return false;
        }

    }

    public ArrayList<ModelRegistration> getVoterInfo() {
        ModelRegistration voterInfo = null;
        ArrayList<ModelRegistration> list = new ArrayList<ModelRegistration>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT   citizen_no,fname,mname,lname,district FROM registration WHERE district=? and constituency=? and citizen_no NOT IN (select citizen_no from voter_list UNION ALL select citizen_no from pending_list)";
            dbcon.st = dbcon.con.prepareStatement(sql);

            dbcon.st.setString(1, getDistrict());
            dbcon.st.setInt(2, getConstituency());

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                voterInfo = new ModelRegistration();

                voterInfo.setCitizenNo(dbcon.rs.getString(1));

                voterInfo.setFname(dbcon.rs.getString(2));
                voterInfo.setMname(dbcon.rs.getString(3));

                voterInfo.setLname(dbcon.rs.getString(4));
                voterInfo.setDistrict(dbcon.rs.getString(5));

                list.add(voterInfo);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }

    public void selectingDob() {
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT  dob FROM registration WHERE citizen_no=?";
            dbcon.st = dbcon.con.prepareStatement(sql);

            dbcon.st.setString(1, getCitizenNo());

            dbcon.rs = dbcon.st.executeQuery();
            while (dbcon.rs.next()) {
                setDob(dbcon.rs.getString(1));
            }

        } catch (Exception e) {
            e.getMessage();
        }

    }

    public boolean voterAccept() {
        DB_Connect dbcon = new DB_Connect();
        int ch = 0;
        try {
            String sql = "INSERT INTO voter_list (citizen_no,dob) values(?,?)";
            dbcon.st = dbcon.con.prepareStatement(sql);

            dbcon.st.setString(1, getCitizenNo());
            dbcon.st.setString(2, getDob());
            ch = dbcon.st.executeUpdate();
            if (ch == 1) {

                return true;
            } else {

                return false;
            }
        } catch (Exception e) {
            return false;
        }

    }

    public boolean voterReject() {
        DB_Connect dbcon = new DB_Connect();
        try {
            String sql = "DELETE FROM registration WHERE citizen_no=?";

            dbcon.st = dbcon.con.prepareStatement(sql);

            dbcon.st.setString(1, getCitizenNo());
            int k = dbcon.st.executeUpdate();

            String sql2 = "DELETE FROM photo WHERE citizen_no=?";
            dbcon.st = dbcon.con.prepareStatement(sql2);
            dbcon.st.setString(1, getCitizenNo());
            int i = dbcon.st.executeUpdate();
            if (k == 1 && i == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }

    }

    public boolean voterPending() {
        DB_Connect dbcon = new DB_Connect();
        int j = 0;
        try {
            String sql = "INSERT INTO pending_list (citizen_no,dob) values(?,?)";
            dbcon.st = dbcon.con.prepareStatement(sql);

            dbcon.st.setString(1, getCitizenNo());
            dbcon.st.setString(2, getDob());
            j = dbcon.st.executeUpdate();
            if (j == 1) {

                return true;
            } else {

                return false;
            }
        } catch (Exception e) {
            return false;
        }

    }

    public ArrayList<ModelRegistration> getVoterId() {
        ModelRegistration voterId = new ModelRegistration();
        ArrayList<ModelRegistration> list = new ArrayList<ModelRegistration>();
        DB_Connect dbcon = new DB_Connect();       
       
        try {
            String sql = "SELECT   b.voter_id, a.citizen_no,a.fname,a.mname,a.lname,a.district,a.vdc,a.ward,a.constituency,a.dob,a.gender FROM registration a,voter_list b WHERE a.citizen_no=? and a.dob=? and a.citizen_no=b.citizen_no  ";
            dbcon.st = dbcon.con.prepareStatement(sql);

            dbcon.st.setString(1, getCitizenNo());
            dbcon.st.setString(2, getDob());

            dbcon.rs = dbcon.st.executeQuery();
             
            if(dbcon.rs.next()) {

                voterId.setVoter_id(dbcon.rs.getInt(1));
                voterId.setCitizenNo(dbcon.rs.getString(2));

                voterId.setFname(dbcon.rs.getString(3));
                voterId.setMname(dbcon.rs.getString(4));
                voterId.setLname(dbcon.rs.getString(5));

                voterId.setDistrict(dbcon.rs.getString(6));
                voterId.setVdc(dbcon.rs.getString(7));
                voterId.setWard(dbcon.rs.getInt(8));
                voterId.setConstituency(dbcon.rs.getInt(9));
                voterId.setDob(dbcon.rs.getString(10));
                voterId.setGender(dbcon.rs.getString(11));

                list.add(voterId);
                

            }else{
                list=null;
                return list;
            }

        } catch (Exception ex) {
          ex.getMessage();
        }

        return list;

    }

}
