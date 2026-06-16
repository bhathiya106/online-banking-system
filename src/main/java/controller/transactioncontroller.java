package controller;

import java.sql.*;
import database.DBconnection;
import java.sql.Connection;

public class transactioncontroller {
	
	


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
}



