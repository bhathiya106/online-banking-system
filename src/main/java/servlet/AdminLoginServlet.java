package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AdminModel;
import controller.AdminService;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminService adminService = new AdminService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String adminType = request.getParameter("adminType");
        
        AdminModel admin = adminService.authenticate(username, password, adminType);
        
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            
            // Redirect based on admin type
            switch(adminType) {
                case "Loan Officer":
                    response.sendRedirect("ListLoansServlet");
                    break;
                case "Banking Staff":
                    response.sendRedirect("bankingStaffDashboard.jsp");
                    break;
                case "Administration":
                    response.sendRedirect("admin_dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("adminLogin.jsp?error=invalid_type");
            }
        } else {
            response.sendRedirect("adminLogin.jsp?error=invalid_credentials");
        }
    }
}