package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBconnection;
import dao.LoanDAO;
import model.LoanApplication;

@WebServlet("/ListLoansServlet")
public class ListLoansServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection connection = DBconnection.getConnection()) {
            LoanDAO loanDAO = new LoanDAO(connection);
            List<LoanApplication> loans = loanDAO.getAllLoans();
            request.setAttribute("loans", loans);
            RequestDispatcher dispatcher = request.getRequestDispatcher("list-loan.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error retrieving loan applications.");
        }
    }
}