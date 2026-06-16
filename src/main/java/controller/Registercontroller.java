
package controller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.DBconnection;
import model.User;




public class Registercontroller {

    private static boolean isSuccess;
    private static Connection con = null;
    private static java.sql.Statement stmt = null;

    public static boolean insertUser(String fullName, String dob, String nic, String address,
                                     String contact, String email, String accountNo,
                                     String branchName, String username, String password) {

        isSuccess = false;

        try {
            // Establish DB connection
            con = DBconnection.getConnection();
            stmt = con.createStatement();

            // SQL Insert query
            String sql = "INSERT INTO register2 (full_name, date_of_birth, nic, address, contact_number, email, account_number, branch_name, username, password) " +
                    "VALUES ('" + fullName + "', '" + dob + "', '" + nic + "', '" + address + "', '" + contact + "', '" + email + "', '" + accountNo + "', '" + branchName+ "', '" + username + "', '" + password + "')";

            int result = stmt.executeUpdate(sql);

            if (result > 0) {
                isSuccess = true;
               
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("SQL Error: " + e.getMessage());
        }

        return isSuccess;
    }
    
    
    public static String withdraw(String accountNumber, double amount, String method) {
		System.out.println("====== TransactionController.withdraw CALLED ======");
	    try (Connection con = DBconnection.getConnection()) {
	
	        // Check balance
	        String query = "SELECT balance FROM account WHERE account_number = ?";
	        PreparedStatement checkStmt = con.prepareStatement(query);
	        checkStmt.setString(1, accountNumber);
	        ResultSet rs = checkStmt.executeQuery();

	        if (!rs.next()) {
	            return "Account not found.";
	        }

	        double balance = rs.getDouble("balance");
	        System.out.println("Balance = " + balance + ", Withdraw = " + amount);

	        if (balance < amount) {
	            return "Insufficient balance.";
	        }

	        // Withdraw
	        PreparedStatement updateStmt = con.prepareStatement("UPDATE account SET balance = balance - ? WHERE account_number = ?");
	        updateStmt.setDouble(1, amount);
	        updateStmt.setString(2, accountNumber);
	        int rowsUpdated = updateStmt.executeUpdate();

	        System.out.println("Balance updated rows: " + rowsUpdated);

	        // Insert transaction
	        PreparedStatement transStmt = con.prepareStatement("INSERT INTO transaction (account_number, transaction_type, amount, method, transaction_date) VALUES (?, ?, ?, ?, NOW())");
	        transStmt.setString(1, accountNumber);
	        transStmt.setString(2, "Withdraw");
	        transStmt.setDouble(3, amount);
	        transStmt.setString(4, method);
	        int rowsInserted = transStmt.executeUpdate();

	        System.out.println("Transaction inserted rows: " + rowsInserted);

	        return "Withdrawal successful.";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "Error: " + e.getMessage();
	    }
	}
    
    public static String Deposit(String accountNumber, double amount, String method) {
		System.out.println("====== TransactionController.Deposit CALLED ======");
	    try (Connection con = DBconnection.getConnection()) {
	
	        // Check balance
	        String query = "SELECT balance FROM account WHERE account_number = ?";
	        PreparedStatement checkStmt = con.prepareStatement(query);
	        checkStmt.setString(1, accountNumber);
	        ResultSet rs = checkStmt.executeQuery();

	        if (!rs.next()) {
	            return "Account not found.";
	        }

	        double balance = rs.getDouble("balance");
	        System.out.println("Balance = " + balance + ", Deposit = " + amount);


	        // Withdraw
	        PreparedStatement updateStmt = con.prepareStatement("UPDATE account SET balance = balance + ? WHERE account_number = ?");
	        updateStmt.setDouble(1, amount);
	        updateStmt.setString(2, accountNumber);
	        int rowsUpdated = updateStmt.executeUpdate();

	        System.out.println("Balance updated rows: " + rowsUpdated);

	        // Insert transaction
	        PreparedStatement transStmt = con.prepareStatement("INSERT INTO transaction (account_number, transaction_type, amount, method, transaction_date) VALUES (?, ?, ?, ?, NOW())");
	        transStmt.setString(1, accountNumber);
	        transStmt.setString(2, "Deposit");
	        transStmt.setDouble(3, amount);
	        transStmt.setString(4, method);
	        int rowsInserted = transStmt.executeUpdate();

	        System.out.println("Transaction inserted rows: " + rowsInserted);

	        return "Deposit successful.";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "Error: " + e.getMessage();
	    }
	}
    
    public static User getUserByUsername(String username) {
        User user = null;

        try (Connection con = DBconnection.getConnection()) {
            String sql = "SELECT * FROM register2 WHERE username = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setFullName(rs.getString("full_name"));
                user.setDateOfBirth(rs.getString("date_of_birth"));
                user.setNic(rs.getString("nic"));
                user.setAddress(rs.getString("address"));
                user. setContactNumber(rs.getString("contact_number"));
                user.setEmail(rs.getString("email"));
                user.setAccountNumber(rs.getString("account_number"));
                user.setBranchName(rs.getString("branch_name"));
                user.setUsername(rs.getString("username"));
                // Don’t return password
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    
    public static boolean updateUser(String username, String fullName, String dob, String nic,
            String address, String contact, String email, String branch) {
try (Connection con = DBconnection.getConnection()) {
String sql = "UPDATE register2 SET full_name=?, date_of_birth=?, nic=?, address=?, " +
"contact_number=?, email=?, branch_name=? WHERE username=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, fullName);
ps.setString(2, dob);
ps.setString(3, nic);
ps.setString(4, address);
ps.setString(5, contact);
ps.setString(6, email);
ps.setString(7, branch);
ps.setString(8, username);
int rows = ps.executeUpdate();
return rows > 0;
} catch (Exception e) {
e.printStackTrace();
return false;
}
}


}
