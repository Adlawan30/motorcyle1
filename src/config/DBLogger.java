package config;

import config.connectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class DBLogger {

    public static void log(int userId, String username, String message) {
    connectDB con = new connectDB(); 

    try {
        String query = "INSERT INTO tbl_logs (u_id, user_name, action, log_time) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.getConnection().prepareStatement(query);
        pstmt.setInt(1, userId);
        pstmt.setString(2, username);
        pstmt.setString(3, message);
        pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));

        pstmt.executeUpdate();  
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

}
