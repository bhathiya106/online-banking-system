// Updated TicketService.java
package controller;

import model.TicketModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.format.DateTimeFormatter;
import database.DBconnection;

public class TicketService {
    
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    
    public boolean createTicket(TicketModel ticket) throws SQLException {
        String sql = "INSERT INTO Tickets (customer_id, account_number, ticket_type, subject, " +
                   "description, priority, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, ticket.getCustomerId());
            statement.setString(2, ticket.getAccountNumber());
            statement.setString(3, ticket.getTicketType());
            statement.setString(4, ticket.getSubject());
            statement.setString(5, ticket.getDescription());
            statement.setString(6, ticket.getPriority());
            statement.setString(7, ticket.getStatus());
            
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        }
    }

    public List<TicketModel> getTicketsByCustomer(String customerId) throws SQLException {
        List<TicketModel> tickets = new ArrayList<>();
        String sql = "SELECT * FROM Tickets WHERE customer_id = ? ORDER BY created_at DESC";
        
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            // Handle both numeric and string customer IDs
            try {
                int id = Integer.parseInt(customerId);
                statement.setInt(1, id);
            } catch (NumberFormatException e) {
                statement.setString(1, customerId);
            }
            
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    TicketModel ticket = new TicketModel();
                    ticket.setTicketId(resultSet.getInt("ticket_id"));
                    ticket.setCustomerId(String.valueOf(resultSet.getObject("customer_id")));
                    ticket.setAccountNumber(resultSet.getString("account_number"));
                    ticket.setTicketType(resultSet.getString("ticket_type"));
                    ticket.setSubject(resultSet.getString("subject"));
                    ticket.setDescription(resultSet.getString("description"));
                    ticket.setPriority(resultSet.getString("priority"));
                    ticket.setStatus(resultSet.getString("status"));
                    
                    // Format date fields as strings before setting in model
                    Timestamp createdAt = resultSet.getTimestamp("created_at");
                    if (createdAt != null) {
                        String formattedCreatedAt = createdAt.toLocalDateTime().format(DATE_FORMATTER);
                        ticket.setFormattedCreatedAt(formattedCreatedAt);
                        ticket.setCreatedAt(createdAt.toLocalDateTime());
                    }
                    
                    Timestamp updatedAt = resultSet.getTimestamp("updated_at");
                    if (updatedAt != null) {
                        String formattedUpdatedAt = updatedAt.toLocalDateTime().format(DATE_FORMATTER);
                        ticket.setFormattedUpdatedAt(formattedUpdatedAt);
                        ticket.setUpdatedAt(updatedAt.toLocalDateTime());
                    }
                    
                    ticket.setAssignedTo(resultSet.getString("assigned_to"));
                    ticket.setResolutionDetails(resultSet.getString("resolution_details"));
                    
                    tickets.add(ticket);
                }
            }
        }
        return tickets;
    }
    
    
    public TicketModel getTicketById(int ticketId) throws SQLException {
        String sql = "SELECT * FROM Tickets WHERE ticket_id = ?";
        
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, ticketId);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    TicketModel ticket = new TicketModel();
                    ticket.setTicketId(resultSet.getInt("ticket_id"));
                    ticket.setCustomerId(String.valueOf(resultSet.getObject("customer_id")));
                    ticket.setAccountNumber(resultSet.getString("account_number"));
                    ticket.setTicketType(resultSet.getString("ticket_type"));
                    ticket.setSubject(resultSet.getString("subject"));
                    ticket.setDescription(resultSet.getString("description"));
                    ticket.setPriority(resultSet.getString("priority"));
                    ticket.setStatus(resultSet.getString("status"));
                    
                    // Format date fields as strings before setting in model
                    Timestamp createdAt = resultSet.getTimestamp("created_at");
                    if (createdAt != null) {
                        String formattedCreatedAt = createdAt.toLocalDateTime().format(DATE_FORMATTER);
                        ticket.setFormattedCreatedAt(formattedCreatedAt);
                        ticket.setCreatedAt(createdAt.toLocalDateTime());
                    }
                    
                    Timestamp updatedAt = resultSet.getTimestamp("updated_at");
                    if (updatedAt != null) {
                        String formattedUpdatedAt = updatedAt.toLocalDateTime().format(DATE_FORMATTER);
                        ticket.setFormattedUpdatedAt(formattedUpdatedAt);
                        ticket.setUpdatedAt(updatedAt.toLocalDateTime());
                    }
                    
                    ticket.setAssignedTo(resultSet.getString("assigned_to"));
                    ticket.setResolutionDetails(resultSet.getString("resolution_details"));
                    
                    return ticket;
                }
            }
        }
        return null;
    }
    
 // Add these methods to your existing TicketService class

    public boolean updateTicket(TicketModel ticket) throws SQLException {
        String sql = "UPDATE Tickets SET account_number = ?, ticket_type = ?, subject = ?, " +
                   "description = ?, priority = ?, status = ?, updated_at = CURRENT_TIMESTAMP " +
                   "WHERE ticket_id = ?";
        
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, ticket.getAccountNumber());
            statement.setString(2, ticket.getTicketType());
            statement.setString(3, ticket.getSubject());
            statement.setString(4, ticket.getDescription());
            statement.setString(5, ticket.getPriority());
            statement.setString(6, ticket.getStatus());
            statement.setInt(7, ticket.getTicketId());
            
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    public boolean deleteTicket(int ticketId) throws SQLException {
        String sql = "DELETE FROM Tickets WHERE ticket_id = ?";
        
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, ticketId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        }
    }
    
 // Add these methods to your existing TicketService class

    public List<TicketModel> getAllTickets() throws SQLException {
        List<TicketModel> tickets = new ArrayList<>();
        String sql = "SELECT * FROM Tickets ORDER BY created_at DESC";
        
        try (Connection connection = DBconnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            
            while (resultSet.next()) {
                TicketModel ticket = new TicketModel();
                ticket.setTicketId(resultSet.getInt("ticket_id"));
                ticket.setCustomerId(String.valueOf(resultSet.getObject("customer_id")));
                ticket.setAccountNumber(resultSet.getString("account_number"));
                ticket.setTicketType(resultSet.getString("ticket_type"));
                ticket.setSubject(resultSet.getString("subject"));
                ticket.setDescription(resultSet.getString("description"));
                ticket.setPriority(resultSet.getString("priority"));
                ticket.setStatus(resultSet.getString("status"));
                
                Timestamp createdAt = resultSet.getTimestamp("created_at");
                if (createdAt != null) {
                    String formattedCreatedAt = createdAt.toLocalDateTime().format(DATE_FORMATTER);
                    ticket.setFormattedCreatedAt(formattedCreatedAt);
                    ticket.setCreatedAt(createdAt.toLocalDateTime());
                }
                
                Timestamp updatedAt = resultSet.getTimestamp("updated_at");
                if (updatedAt != null) {
                    String formattedUpdatedAt = updatedAt.toLocalDateTime().format(DATE_FORMATTER);
                    ticket.setFormattedUpdatedAt(formattedUpdatedAt);
                    ticket.setUpdatedAt(updatedAt.toLocalDateTime());
                }
                
                ticket.setAssignedTo(resultSet.getString("assigned_to"));
                ticket.setResolutionDetails(resultSet.getString("resolution_details"));
                
                tickets.add(ticket);
            }
        }
        return tickets;
    }

    public boolean resolveTicket(int ticketId, String resolutionDetails) throws SQLException {
        String sql = "UPDATE Tickets SET status = 'Resolved', resolution_details = ?, updated_at = CURRENT_TIMESTAMP " +
                   "WHERE ticket_id = ?";
        
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, resolutionDetails);
            statement.setInt(2, ticketId);
            
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        }
    }
}
