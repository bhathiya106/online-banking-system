package servlet;

import controller.TicketService;
import model.TicketModel;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ViewMyTicketsServlet")
public class ViewMyTicketsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TicketService ticketService = new TicketService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // false = don't create if doesn't exist
        User user = (User) session.getAttribute("user");

        //  If not logged in, redirect to login
        if (user == null) {
            response.sendRedirect("login.jsp?loginRequired=true");
            return;
        }

        //  Use user ID or username as the identifier
        String userId = user.getUsername(); // or user.getId(), depends on your User class

        try {
            List<TicketModel> tickets = ticketService.getTicketsByCustomer(userId);
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("ViewMyTickets.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching tickets: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
