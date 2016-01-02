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
public class ModelUserAccount {

    private String name;
    private String address;
    private String email;
    private String phone;
    private String username;
    private String password;
    private String role;
    private String newusername;
    private String newpassword;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getNewusername() {
        return newusername;
    }

    public void setNewusername(String newusername) {
        this.newusername = newusername;
    }

    public String getNewpassword() {
        return newpassword;
    }

    public void setNewpassword(String newpassword) {
        this.newpassword = newpassword;
    }

    public boolean createAccount() {
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "INSERT INTO user (user,pass,login_as,email,name,address,phone) values (?,?,?,?,?,?,?)";
            dbcon.st = dbcon.con.prepareStatement(sql);

            dbcon.st.setString(1, getUsername());
            dbcon.st.setString(2, getPassword());
            dbcon.st.setString(3, getRole());
            dbcon.st.setString(4, getEmail());
            dbcon.st.setString(5, getName());
            dbcon.st.setString(6, getAddress());
            dbcon.st.setString(7, getPhone());
            int i = dbcon.st.executeUpdate();
            if (i == 1) {
                return true;

            } else {
                return false;
            }

        } catch (Exception ex) {
            return false;
        }

    }

    public boolean changeUsernamePassword() {
        DB_Connect dbcon = new DB_Connect();
        try {
            String sql = "UPDATE user set user=?, pass=? WHERE user=? AND pass=? AND email=?  ";

            dbcon.st = dbcon.con.prepareStatement(sql);

            dbcon.st.setString(1, getNewusername());
            dbcon.st.setString(2, getNewpassword());

            dbcon.st.setString(3, getUsername());
            dbcon.st.setString(4, getPassword());
            dbcon.st.setString(5, getEmail());
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

    public ArrayList<ModelUserAccount> showUser() {
        ModelUserAccount userList = null;
        ArrayList<ModelUserAccount> list = new ArrayList<ModelUserAccount>();
        DB_Connect dbcon = new DB_Connect();

        try {
            String sql = "SELECT   name,address,email,user,pass FROM user WHERE login_as='officer'";
            dbcon.st = dbcon.con.prepareStatement(sql);
            dbcon.rs = dbcon.st.executeQuery();

            while (dbcon.rs.next()) {
                userList = new ModelUserAccount();
                userList.setName(dbcon.rs.getString(1));
                userList.setAddress(dbcon.rs.getString(2));
                userList.setEmail(dbcon.rs.getString(3));
                userList.setUsername(dbcon.rs.getString(4));
                userList.setPassword(dbcon.rs.getString(5));

                list.add(userList);

            }

        } catch (Exception ex) {
            ex.getMessage();
        }

        return list;

    }

    public boolean editUserPass() {

        DB_Connect dbcon = new DB_Connect();
        try {
            String sql = "UPDATE user SET user=?, pass=? WHERE  email=?  ";

            dbcon.st = dbcon.con.prepareStatement(sql);

            dbcon.st.setString(1, getNewusername());
            dbcon.st.setString(2, getNewpassword());           
            dbcon.st.setString(3, getEmail());
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

}
