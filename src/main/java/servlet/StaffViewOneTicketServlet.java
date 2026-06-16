package servlet;

import controller.TicketService;
import model.TicketModel;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/StaffViewOneTicketServlet")
public class StaffViewOneTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TicketService ticketService = new TicketService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        // Check if user is logged in
        if (session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp?loginRequired=true");
            return;
        }
        
        String ticketId = request.getParameter("ticketId");
        if (ticketId == null || ticketId.isEmpty()) {
            request.setAttribute("errorMessage", "Ticket ID is required");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        
        try {
            TicketModel ticket = ticketService.getTicketById(Integer.parseInt(ticketId));
            if (ticket == null) {
                request.setAttribute("errorMessage", "Ticket not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            
            request.setAttribute("ticket", ticket);
            request.getRequestDispatcher("StaffViewOneTicket.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving ticket: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Ticket ID format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}