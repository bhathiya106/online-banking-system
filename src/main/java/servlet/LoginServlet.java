package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.AuthController;
import model.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String username = request.getParameter("username");
        String password = request.getParameter("password");
       

        if (AuthController.login(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            
            
            User user = AuthController.getUser(username);
            session.setAttribute("user", user);
            
            System.out.println("User in session: " + user);
           
            
         // Get user info from DB (including account number)
           
            
             System.out.println("Fetched account number: " + user.getAccountNumber());
             
             session.setAttribute("accountNumber", user.getAccountNumber());
             
             System.out.println("Account Number from session: " + session.getAttribute("accountNumber")); 
 // temporarily hardcode to test

            

            
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
	        
		}

}
