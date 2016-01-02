
package temp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DB_Connect {
    public Connection con;
    public PreparedStatement st;
    public ResultSet rs;
    public int i;
    

    public DB_Connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_voting", "root", "");
            
        } catch (Exception ex) {

            ex.getMessage();
        }
    }
    
}
