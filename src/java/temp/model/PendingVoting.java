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
public class PendingVoting {

    private String citizenNo;
    private String fname;
    private String mname;
    private String lname;
    private String dob;
    private String district;
    private int constituency;
    private String vdc;
    private int ward;
    private int age;

    public String getCitizenNo() {
        return citizenNo;
    }

    public void setCitizenNo(String citizenNo) {
        this.citizenNo = citizenNo;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    

    public ArrayList<PendingVoting> showVoterlist() {
        PendingVoting voterList = null;
        ArrayList<PendingVoting> list = new ArrayList<PendingVoting>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT  a.citizen_no, a.fname,a.mname,a.lname,a.vdc,a.ward,a.district,a.dob FROM registration a, voter_list b WHERE a.citizen_no=b.citizen_no and district=? and constituency=? and vdc=?";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getDistrict());
            dbcon.st.setInt(2, getConstituency());
            dbcon.st.setString(3, getVdc());

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                voterList = new PendingVoting();

                voterList.setCitizenNo(dbcon.rs.getString(1));
                voterList.setFname(dbcon.rs.getString(2));
                voterList.setMname(dbcon.rs.getString(3));
                voterList.setLname(dbcon.rs.getString(4));
                voterList.setVdc(dbcon.rs.getString(5));
                voterList.setWard(dbcon.rs.getInt(6));
                voterList.setDistrict(dbcon.rs.getString(7));
                voterList.setDob(dbcon.rs.getString(8));

                list.add(voterList);

            }

        } catch (Exception ex) {
           list=null;
           return list;
          
        }

        return list;

    }

    public ArrayList<PendingVoting> showPendinglist() {
        PendingVoting voterList = null;
        ArrayList<PendingVoting> list = new ArrayList<PendingVoting>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT  a.citizen_no, a.fname,a.mname,a.lname,a.vdc,a.ward,a.district,a.dob FROM registration a, pending_list b WHERE a.citizen_no=b.citizen_no and district=? and constituency=? and vdc=?";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getDistrict());
            dbcon.st.setInt(2, getConstituency());
            dbcon.st.setString(3, getVdc());

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                voterList = new PendingVoting();

                voterList.setCitizenNo(dbcon.rs.getString(1));
                voterList.setFname(dbcon.rs.getString(2));
                voterList.setMname(dbcon.rs.getString(3));
                voterList.setLname(dbcon.rs.getString(4));
                voterList.setVdc(dbcon.rs.getString(5));
                voterList.setWard(dbcon.rs.getInt(6));
                voterList.setDistrict(dbcon.rs.getString(7));
                voterList.setDob(dbcon.rs.getString(8));

                list.add(voterList);

            }

        } catch (Exception ex) {
            list=null;
           return list;
        }

        return list;

    }
    public ArrayList<PendingVoting> seeVoterlist() {
        PendingVoting voterList = null;
        ArrayList<PendingVoting> list = new ArrayList<PendingVoting>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT   a.fname,a.mname,a.lname,a.vdc,a.ward,a.district,TIMESTAMPDIFF(YEAR,a.dob,CURDATE()) AS age FROM registration a, voter_list b WHERE a.citizen_no=b.citizen_no and district=? and constituency=? and vdc=?";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.st.setString(1, getDistrict());
            dbcon.st.setInt(2, getConstituency());
            dbcon.st.setString(3, getVdc());

            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                voterList = new PendingVoting();

               
                voterList.setFname(dbcon.rs.getString(1));
                voterList.setMname(dbcon.rs.getString(2));
                voterList.setLname(dbcon.rs.getString(3));
                voterList.setVdc(dbcon.rs.getString(4));
                voterList.setWard(dbcon.rs.getInt(5));
                voterList.setDistrict(dbcon.rs.getString(6));
                voterList.setAge(dbcon.rs.getInt(7));

                list.add(voterList);

            }

        } catch (Exception ex) {
           list=null;
           return list;
          
        }

        return list;

    }


}
