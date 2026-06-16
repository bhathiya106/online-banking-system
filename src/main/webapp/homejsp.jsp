<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String customerName = (String) session.getAttribute("customerName");
    if (customerName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard - Online Bank</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f7;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #004080;
            color: white;
            padding: 15px 30px;
            text-align: center;
        }
        .container {
            padding: 30px;
        }
        .welcome {
            font-size: 20px;
            margin-bottom: 20px;
        }
        .nav-links a {
            display: block;
            background-color: #0066cc;
            color: white;
            padding: 10px;
            margin: 10px 0;
            text-decoration: none;
            border-radius: 4px;
            width: 250px;
        }
        .nav-links a:hover {
            background-color: #0052a3;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Online Bank</h1>
    </header>
    <div class="container">
        <div class="welcome">
            Hello, <strong><%= customerName %></strong>!
        </div>
        <div class="nav-links">
            <a href="accountDetails.jsp">View Account Details</a>
            <a href="transactionHistory.jsp">Transaction History</a>
            <a href="withdraw.jsp">Withdraw Money</a>
            <a href="deposit.jsp">Deposit Money</a>
            <a href="transfer.jsp">Transfer Funds</a>
            <a href="billPayment.jsp">Pay Bills</a>
            <a href="loanApplication.jsp">Apply for Loan</a>
            <a href="changePassword.jsp">Change Password</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>
    
    
    <div class="container1">
        <h2>Customer Services</h2>
        <div class="menu-grid">
            <a href="accountDetails.jsp">Account Details</a>
            <a href="withdraw.jsp">Withdraw</a>
            <a href="deposit.jsp">Deposit</a>
            <a href="transfer.jsp">Fund Transfer</a>
            <a href="billPayment.jsp">Bill Payment</a>
            <a href="loanApplication.jsp">Apply for Loan</a>
            <a href="transactionHistory.jsp">Transaction History</a>
            <a href="Coustomercomplaint.jsp">Coustomer Services</a>
        </div>
    </div>
</body>
</html>
