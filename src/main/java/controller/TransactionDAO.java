package controller;

import model.Transaction;
import database.DBconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {

    public static List<Transaction> getTransactionsByAccountNumber(String accountNumber) {
        List<Transaction> transactions = new ArrayList<>();

        
        System.out.println("Account number from user object: " + accountNumber);
        try (Connection con = DBconnection.getConnection()) {
         String sql = "SELECT * FROM transaction WHERE account_number = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, accountNumber);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Transaction txn = new Transaction();
                txn.setId(rs.getInt("transaction_id"));
                txn.setAccountNumber(rs.getString("account_number"));
                txn.setType(rs.getString("transaction_type"));
                txn.setAmount(rs.getDouble("amount"));
                txn.setDate(rs.getString("transaction_date"));
                transactions.add(txn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return transactions;
    }
    
    public static boolean deleteTransactionById(int id) {
        boolean isDeleted = false;

        try (Connection con = DBconnection.getConnection()) {
            String sql = "DELETE FROM transaction WHERE transaction_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int rows = ps.executeUpdate();

            isDeleted = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isDeleted;
    }

}
