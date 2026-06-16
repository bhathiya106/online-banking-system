package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;
import model.LoanApplication;

public class LoanDAO {

    private Connection connection;

    public LoanDAO(Connection conn) {
        this.connection = conn;
        System.out.println("LoanDAO initialized with connection: " + (connection != null ? "success" : "failure"));
    }

    public void addLoan(LoanApplication loan) throws SQLException {
        String sql = "INSERT INTO loan_applications (customer_name, loan_type, amount, phone, address) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, loan.getCustomerName());
            stmt.setString(2, loan.getLoanType());
            stmt.setDouble(3, loan.getAmount());
            stmt.setString(4, loan.getPhone());
            stmt.setString(5, loan.getAddress());
            stmt.executeUpdate();
        }
    }

    public List<LoanApplication> getAllLoans() throws SQLException {
        List<LoanApplication> loans = new ArrayList<>();
        String sql = "SELECT * FROM loan_applications";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                loans.add(mapRowToLoan(rs));
            }
        }
        return loans;
    }

    public LoanApplication getLoanById(int id) throws SQLException {
        String sql = "SELECT * FROM loan_applications WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapRowToLoan(rs);
            }
        }
        return null;
    }

    public void updateLoan(LoanApplication loan) throws SQLException {
        String sql = "UPDATE loan_applications SET customer_name = ?, loan_type = ?, amount = ?, phone = ?, address = ?, status = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, loan.getCustomerName());
            stmt.setString(2, loan.getLoanType());
            stmt.setDouble(3, loan.getAmount());
            stmt.setString(4, loan.getPhone());
            stmt.setString(5, loan.getAddress());
            stmt.setString(6, loan.getStatus());
            stmt.setInt(7, loan.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteLoan(int id) throws SQLException {
        String sql = "DELETE FROM loan_applications WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    private LoanApplication mapRowToLoan(ResultSet rs) throws SQLException {
        LoanApplication loan = new LoanApplication();
        loan.setId(rs.getInt("id"));
        loan.setCustomerName(rs.getString("customer_name"));
        loan.setLoanType(rs.getString("loan_type"));
        loan.setAmount(rs.getDouble("amount"));
        loan.setStatus(rs.getString("status"));
        loan.setCreatedAt(rs.getObject("created_at", LocalDateTime.class));
        loan.setPhone(rs.getString("phone"));
        loan.setAddress(rs.getString("address"));
        return loan;
    }
}
