package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBconnection;
import dao.LoanDAO;
import model.LoanApplication;

import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/UpdateLoanServlet")
public class UpdateLoanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String customerName = request.getParameter("customerName");
        String loanType = request.getParameter("loanType");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String status = request.getParameter("status");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        LoanApplication loan = new LoanApplication();
        loan.setId(id);
        loan.setCustomerName(customerName);
        loan.setLoanType(loanType);
        loan.setAmount(amount);
        loan.setStatus(status);
        loan.setPhone(phone);
        loan.setAddress(address);

        try (Connection connection = DBconnection.getConnection()) {
            LoanDAO loanDAO = new LoanDAO(connection);
            loanDAO.updateLoan(loan);
            response.sendRedirect("ListLoansServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error updating loan application.");
        }
    }
}
