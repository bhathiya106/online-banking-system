package adminDAO;
import java.sql.*;
import java.util.*;
import adminModel.User;
import database.DBconnection;

public class UserDAO {
	public static List<User> getAllUsers() throws SQLException {
		List<User> userList = new ArrayList<User>();
		
		String sqlQuery = "SELECT * FROM users";
		
		try (Connection conn = DBconnection.getConnection();
				PreparedStatement ps = conn.prepareStatement(sqlQuery);
				ResultSet rs = ps.executeQuery()) {
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getNString("name"));
				user.setEmail(rs.getNString("email"));
				user.setRole(rs.getNString("role"));
				user.setPassword(rs.getNString("password"));
				userList.add(user);
			}
		}
		return userList;
	}
		
		public static boolean insertUser(User user) throws SQLException {
		    String sqlQuery = "INSERT INTO users (name, email, role, password) VALUES (?, ?, ?, ?)";
		    try (Connection conn = DBconnection.getConnection(); 
		         PreparedStatement ps = conn.prepareStatement(sqlQuery)) {

		        ps.setString(1, user.getName());
		        ps.setString(2, user.getEmail());
		        ps.setString(3, user.getRole());
		        ps.setString(4, user.getPassword());

		        return ps.executeUpdate() > 0;
		    } 
		}
		
		public static boolean deleteUser(int id) throws SQLException {
			String sqlQuery = "DELETE FROM users WHERE id = ?"; 
			try(Connection conn = DBconnection.getConnection();
					PreparedStatement ps = conn.prepareStatement(sqlQuery)) {
				ps.setInt(1, id);
				return ps.executeUpdate() > 0;
			
		}
	}
				
		public static boolean updateUser(User user) {
		   
		    boolean updatePassword = user.getPassword() != null && !user.getPassword().trim().isEmpty();

		    try (Connection conn = DBconnection.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(
		             updatePassword ?
		             "UPDATE users SET email = ?, role = ?, password = ? WHERE id = ?" :
		             "UPDATE users SET email = ?, role = ? WHERE id = ?"
		         )) {

		        stmt.setString(1, user.getEmail());
		        stmt.setString(2, user.getRole());

		        if (updatePassword) {
		            stmt.setString(3, user.getPassword());
		            stmt.setInt(4, user.getId());
		        } else {
		            stmt.setInt(3, user.getId());
		        }

		        int rows = stmt.executeUpdate();
		        return rows > 0;

		    } catch (SQLException e) {
		        e.printStackTrace();
		        return false;
		    }
		}


		public static User findById(int id) {
		    String sql = "SELECT * FROM users WHERE id = ?";
		    
		    try (Connection conn = DBconnection.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(sql)) {
		        
		        stmt.setInt(1, id);
		        try (ResultSet rs = stmt.executeQuery()) {
		            if (rs.next()) {
		                User user = new User();
		                user.setId(rs.getInt("id"));
		                user.setEmail(rs.getString("email"));
		                user.setRole(rs.getString("role"));
		                user.setPassword(rs.getString("password")); // optional: only if needed
		                return user;
		            }
		        }
		    } catch (SQLException e) {
		        System.err.println("Error finding user by ID: " + e.getMessage());
		        e.printStackTrace();
		    }
		    
		    return null; // user not found
		}

}	