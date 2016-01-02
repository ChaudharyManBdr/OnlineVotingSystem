/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package temp.model;

import java.sql.*;

/**
 *
 * @author Manav
 */
public class ModelUserLogin {

    private String user;
    private String pass;
    private String logAs;
    public int check = 0;

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getLog() {
        return logAs;
    }

    public void setLog(String log) {
        this.logAs = log;
    }

    public boolean userLogin() {

        DB_Connect dbcon = new DB_Connect();
        try {
            dbcon.st = dbcon.con.prepareStatement("select * from user where user=? and pass=? and login_as=?");

            dbcon.st.setString(1, getUser());
            dbcon.st.setString(2, getPass());
            dbcon.st.setString(3, getLog());
            dbcon.rs = dbcon.st.executeQuery();
            if (dbcon.rs.next()) {
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
