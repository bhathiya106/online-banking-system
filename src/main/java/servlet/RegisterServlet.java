package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import controller.Registercontroller;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters from form
        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dateOfBirth");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String contact = request.getParameter("contactNumber");
        String email = request.getParameter("email");
        String accountNo = request.getParameter("accountNumber");
        String branchName = request.getParameter("branchName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Optional: Password confirmation check
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
            return;
        }

        // Call DB utility
        boolean isTrue = Registercontroller.insertUser(fullName, dob, nic, address, contact, email,
                                                   accountNo, branchName, username, password);

        if (isTrue) {
            // Redirect to login page after successful registration
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "Registration failed!");
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
        }
    }
}


