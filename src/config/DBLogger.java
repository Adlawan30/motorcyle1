package config;

import config.connectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class DBLogger {

    public static void log(String username, String message) {
        connectDB con = new connectDB(); 

        try {
            String query = "INSERT INTO tbl_logs (user_name, action, log_time) VALUES (?, ?, ?)";
            PreparedStatement pstmt = con.getConnection().prepareStatement(query);
            pstmt.setString(1, username); // Log the username
            pstmt.setString(2, message);  // Log the message
            pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis())); // Current timestamp

            pstmt.executeUpdate();  
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

