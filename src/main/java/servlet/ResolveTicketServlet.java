package servlet;

import controller.TicketService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ResolveTicketServlet")
public class ResolveTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TicketService ticketService = new TicketService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String ticketId = request.getParameter("ticketId");
        if (ticketId == null || ticketId.isEmpty()) {
            request.setAttribute("errorMessage", "Ticket ID is required");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        
        try {
            // Verify ticket exists and is not already resolved
            int id = Integer.parseInt(ticketId);
            model.TicketModel ticket = ticketService.getTicketById(id);
            
            if (ticket == null) {
                request.setAttribute("errorMessage", "Ticket not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            
            if ("Resolved".equals(ticket.getStatus())) {
                request.setAttribute("errorMessage", "Ticket #" + ticketId + " is already resolved");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            
            request.setAttribute("ticketId", ticketId);
            request.getRequestDispatcher("ResolveTicket.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Ticket ID format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading resolution page: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String ticketId = request.getParameter("ticketId");
        String resolutionDetails = request.getParameter("resolutionDetails");
        
        if (ticketId == null || ticketId.isEmpty() || resolutionDetails == null || resolutionDetails.isEmpty()) {
            request.setAttribute("errorMessage", "Ticket ID and resolution details are required");
            request.getRequestDispatcher("ResolveTicket.jsp").forward(request, response);
            return;
        }
        
        try {
            int id = Integer.parseInt(ticketId);
            
            // Verify ticket exists first
            model.TicketModel ticket = ticketService.getTicketById(id);
            if (ticket == null) {
                request.setAttribute("errorMessage", "Ticket not found");
                request.getRequestDispatcher("ResolveTicket.jsp").forward(request, response);
                return;
            }
            
            boolean success = ticketService.resolveTicket(id, resolutionDetails);
            
            if (success) {
                response.sendRedirect("AllTicketServlet?resolveSuccess=true");
            } else {
                request.setAttribute("errorMessage", "Failed to resolve ticket. Please try again.");
                request.setAttribute("ticketId", ticketId);
                request.getRequestDispatcher("ResolveTicket.jsp").forward(request, response);
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Ticket ID format");
            request.setAttribute("ticketId", ticketId);
            request.getRequestDispatcher("ResolveTicket.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error resolving ticket: " + e.getMessage());
            request.setAttribute("ticketId", ticketId);
            request.getRequestDispatcher("ResolveTicket.jsp").forward(request, response);
        }
    }
}