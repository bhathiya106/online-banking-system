package servlet;

import controller.TicketService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteTicketServlet")
public class DeleteTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TicketService ticketService = new TicketService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?loginRequired=true");
            return;
        }

        String ticketIdParam = request.getParameter("ticketId");
        if (ticketIdParam == null || ticketIdParam.isEmpty()) {
            request.setAttribute("errorMessage", "Ticket ID is required");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        try {
            int ticketId = Integer.parseInt(ticketIdParam);
            boolean success = ticketService.deleteTicket(ticketId);

            if (success) {
                response.sendRedirect("ViewMyTicketsServlet?deleteSuccess=true");
            } else {
                request.setAttribute("errorMessage", "Failed to delete ticket");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Ticket ID format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error deleting ticket: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
