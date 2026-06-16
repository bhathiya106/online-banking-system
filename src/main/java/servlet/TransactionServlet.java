package servlet;



import controller.TransactionDAO;
import model.Transaction;
import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/TransactionServlet")
public class TransactionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        System.out.println("User in session: " + user);


        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String accountNumber = user.getAccountNumber();
        
        System.out.println("Account number from user object: " + user.getAccountNumber());

        List<Transaction> transactions = TransactionDAO.getTransactionsByAccountNumber(accountNumber);
        
        
        System.out.println("Transactions found: " + transactions.size());


        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("transactions.jsp").forward(request, response);
    }
}

