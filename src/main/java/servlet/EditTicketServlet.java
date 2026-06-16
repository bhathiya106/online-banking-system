package servlet;

import controller.TicketService;
import model.TicketModel;
import model.User;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditTicketServlet")
public class EditTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TicketService ticketService = new TicketService();

    // GET - Load ticket for editing
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
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

            // Optional: Check if ticket belongs to the logged-in user
            if (!ticket.getCustomerId().equals(user.getUsername())) {
                request.setAttribute("errorMessage", "Unauthorized access to ticket");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            request.setAttribute("ticket", ticket);
            request.getRequestDispatcher("editTicket.jsp").forward(request, response);

        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving ticket: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // POST - Handle form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp?loginRequired=true");
            return;
        }

        try {
            TicketModel ticket = new TicketModel();
            ticket.setTicketId(Integer.parseInt(request.getParameter("ticketId")));
            ticket.setAccountNumber(request.getParameter("accountNumber"));
            ticket.setTicketType(request.getParameter("ticketType"));
            ticket.setSubject(request.getParameter("subject"));
            ticket.setDescription(request.getParameter("description"));
            ticket.setPriority(request.getParameter("priority"));
            ticket.setStatus(request.getParameter("status"));
            ticket.setCustomerId(user.getUsername()); // Important to track the user

            boolean success = ticketService.updateTicket(ticket);

            if (success) {
                response.sendRedirect("ViewMyTicketsServlet?updateSuccess=true");
            } else {
                request.setAttribute("errorMessage", "Failed to update ticket");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating ticket: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
