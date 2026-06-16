package servlet;

import model.TicketModel;
import controller.TicketService;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

@WebServlet("/AddTicketServlet")
public class AddTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        // 1. Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }


        // 2. Get all form parameters
        String accountNumber = request.getParameter("accountNumber");
        String ticketType = request.getParameter("ticketType");
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");
        String priority = request.getParameter("priority");

        // 3. Create TicketModel object
        
        User user = (User) session.getAttribute("user");


        TicketModel ticket = new TicketModel(
        	    user.getUsername(),         // Assuming username is used as customer ID
        	    accountNumber,
        	    ticketType,
        	    subject,
        	    description,
        	    priority
        	);

        // 4. Create and submit ticket
        try {
            TicketService ticketService = new TicketService();
            boolean isCreated = ticketService.createTicket(ticket);
            
            if (isCreated) {
                session.setAttribute("successMessage", "Ticket created successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to create ticket. Please try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Database error occurred: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
        }

        // 5. Redirect back to the ticket page
        response.sendRedirect("AddTicket.jsp");
    }
}