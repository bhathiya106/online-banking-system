<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="css/style.css">
    
    <style>
        .welcome-container {
            margin-top: 50px;
            text-align: center;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            animation: fadeIn 1s ease-in-out;
        }

        .welcome-container h2 {
            font-size: 32px;
            margin: 0;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp"); // Session check
        return;
    }

    String formattedUsername = username.substring(0, 1).toUpperCase() + username.substring(1);
%>
    <%@ include file="navbar.jsp" %>
    <div class="welcome-container">
        <h2>Welcome back <%= formattedUsername %>!</h2>
    </div>
    <%@ include file="footer.jsp" %>
    
    
    <div class="container1">
         <center><span class="highlight">coustomer services</span>
</center>
        <div class="menu-grid">
            <a href="accountdetails.jsp">Account Details</a>
            <a href="withdraw.jsp">Withdraw</a>
            <a href="Deposit.jsp">Deposit</a>
        
            
            <a href="add-loan.jsp">Apply for Loan</a>
            <a href="TransactionServlet">Transaction History</a>
            <a href="chome.jsp">Coustomer Services</a>
        </div>
    </div> 
</body>
</html>