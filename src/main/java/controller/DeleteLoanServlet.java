package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBconnection;
import dao.LoanDAO;

import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/DeleteLoanServlet")
public class DeleteLoanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection connection = DBconnection.getConnection()) {
            LoanDAO loanDAO = new LoanDAO(connection);
            loanDAO.deleteLoan(id);
            response.sendRedirect("ListLoansServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting loan application.");
        }
    }
}