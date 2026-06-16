package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.DBconnection;
import model.User;

public class AuthController {

    public static boolean login(String username, String password) {
        boolean isValid = false;

        try {
            Connection con = DBconnection.getConnection();
            String sql = "SELECT * FROM register2 WHERE username = ? AND password = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            isValid = rs.next(); // true if a match is found

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isValid;
    }

    public static User getUser(String username) {
        User user = null;

        try {
            Connection con = DBconnection.getConnection();
            String sql = "SELECT * FROM register2 WHERE username = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, username);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
            	
            	System.out.println("DB Account Number: " + rs.getString("account_number"));

            	user = new User();
                
                
                user.setFullName(rs.getString("full_name"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setContactNumber(rs.getString("contact_number"));
                user.setAccountNumber(rs.getString("account_number"));
                

            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}

