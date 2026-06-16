package servlet;



import controller.TransactionDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteTransactionServlet")
public class DeleteTransactionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("transactionId");

        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                boolean deleted = TransactionDAO.deleteTransactionById(id);
                System.out.println("Deleted transaction ID: " + id + ", success: " + deleted);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("TransactionServlet"); // Reload transaction list
    }
}
