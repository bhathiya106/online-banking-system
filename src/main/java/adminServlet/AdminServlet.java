package adminServlet;

import adminDAO.UserDAO;
import adminModel.User;

import java.util.List;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;


@SuppressWarnings("serial")
@javax.servlet.annotation.WebServlet("/admin")
public class AdminServlet extends HttpServlet{
	
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<User> users = UserDAO.getAllUsers();
			request.setAttribute("userList", users);
			RequestDispatcher rd = request.getRequestDispatcher("admin_dashboard.jsp");
			rd.forward(request, response);
		}
		catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		try {
			if("add".equals(action)) {
				User user = new User();
				user.setName(request.getParameter("name"));
				user.setEmail(request.getParameter("email"));
				user.setRole(request.getParameter("role"));
				user.setPassword(request.getParameter("password"));
				UserDAO.insertUser(user);
			}
			else if("delete".equals(action)) {
				int id = Integer.parseInt(request.getParameter("id"));
				UserDAO.deleteUser(id);
			}
			else if("update".equals(action)) {
				int id = Integer.parseInt(request.getParameter("id"));
				String email = request.getParameter("email");
				String role = request.getParameter("role");
				String password = request.getParameter("password");
				
				User user = UserDAO.findById(id);
				
				if(user != null) {
					user.setEmail(email);
			        user.setRole(role);
			        
			        if (password != null && !password.isEmpty()) {
			            user.setPassword(password);  // update only if provided
			        }
			        
			       UserDAO.updateUser(user);
				}
				
				if(UserDAO.updateUser(user)) {
				    System.out.println("User updated successfully.");
				} else {
				    System.out.println("Failed to update user.");
				}

                
           }
			response.sendRedirect("admin");
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
}