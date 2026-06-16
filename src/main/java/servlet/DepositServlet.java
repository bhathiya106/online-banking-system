package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import controller.Registercontroller;

@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Deposit is executing...");

        HttpSession session = request.getSession();
        String accountNumber = (String) session.getAttribute("accountNumber");

        System.out.println("Account Number from session: " + accountNumber);

        // Check if session has expired or account number is missing
        if (accountNumber == null) {
            request.setAttribute("message", "Session expired. Please login again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Get form inputs
        double amount = Double.parseDouble(request.getParameter("amount"));
        String method = request.getParameter("method");

        System.out.println("Calling Deposit() with account=" + accountNumber + ", amount=" + amount + ", method=" + method);

        // Call controller method to process withdrawal
        String message = Registercontroller.Deposit(accountNumber, amount, method);

        // Send result back to JSP
        request.setAttribute("message", message);
        request.getRequestDispatcher("Deposit.jsp").forward(request, response);
    }
}

