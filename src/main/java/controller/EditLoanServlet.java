package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBconnection;
import dao.LoanDAO;
import model.LoanApplication;

@WebServlet("/EditLoanServlet")
public class EditLoanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection connection = DBconnection.getConnection()) {
            LoanDAO loanDAO = new LoanDAO(connection);
            LoanApplication loan = loanDAO.getLoanById(id);

            if (loan != null) {
                request.setAttribute("loan", loan);
                RequestDispatcher dispatcher = request.getRequestDispatcher("edit-loan.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("ListLoansServlet");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching loan details.");
        }
    }
}