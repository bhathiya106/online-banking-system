package servlet;


import model.User;
import controller.AuthController;
import controller.Registercontroller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String contact = request.getParameter("contactNumber");
        String email = request.getParameter("email");
        String branch = request.getParameter("branchName");

        boolean success = Registercontroller.updateUser(username, fullName, dob, nic, address, contact, email, branch);

        if (success) {
            // Update user in session
            User updatedUser = AuthController.getUser(username);
            request.getSession().setAttribute("user", updatedUser);
            response.sendRedirect("accountdetails.jsp");
        } else {
            response.sendRedirect("update.jsp?error=1");
        }
    }
}

