package controller;

import database.DBconnection;
import model.AdminModel;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminService {
    private static final Logger LOGGER = Logger.getLogger(AdminService.class.getName());

    public AdminModel authenticate(String username, String password, String adminType) {
        String query = "SELECT * FROM admin WHERE username = ? AND password = ? AND admin_type = ?";
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, adminType);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    AdminModel admin = new AdminModel();
                    admin.setAdminId(rs.getInt("admin_id"));
                    admin.setUsername(rs.getString("username"));
                    admin.setEmail(rs.getString("email"));
                    admin.setAdminType(rs.getString("admin_type"));
                    admin.setCreatedAt(rs.getTimestamp("created_at"));
                    admin.setLastLogin(rs.getTimestamp("last_login"));
                    
                    // Update last login time
                    updateLastLogin(admin.getAdminId());
                    
                    return admin;
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error during admin authentication", e);
        }
        return null;
    }

    private void updateLastLogin(int adminId) {
        String query = "UPDATE admin SET last_login = CURRENT_TIMESTAMP WHERE admin_id = ?";
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, adminId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating last login time", e);
        }
    }
}