package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoanApplicationServlet")
public class LoanApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String loanType = request.getParameter("loanType");
	        String message = "Loan application submitted for: " + loanType;
	        request.setAttribute("message", message);
	        request.getRequestDispatcher("loan.jsp").forward(request, response);
	        
	        
	}

}
