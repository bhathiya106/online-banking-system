package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import database.DBconnection;
import dao.LoanDAO;
import model.LoanApplication;

@WebServlet("/AddLoanServlet")
public class AddLoanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String customerName = request.getParameter("customerName");
        String loanType = request.getParameter("loanType");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        double amount = 0;
        try {
            amount = Double.parseDouble(request.getParameter("amount"));
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid loan amount.");
            return;
        }

        LoanApplication loan = new LoanApplication();
        loan.setCustomerName(customerName);
        loan.setLoanType(loanType);
        loan.setAmount(amount);
        loan.setPhone(phone);
        loan.setAddress(address);

        try (Connection connection = DBconnection.getConnection()) {
            LoanDAO loanDAO = new LoanDAO(connection);
            loanDAO.addLoan(loan);
            response.sendRedirect("add-loan.jsp"); // redirect to list view after submission
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error adding loan application.");
        }
    }
}
