<%@ page language="java" session="true" %>
<%
    String customerName = (String) session.getAttribute("customerName");
    if (customerName == null) customerName = "Guest";
%>
<html>
<head>
    <title>Customer Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/Style.css" />
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="navbar-left">
            <span class="brand">Online Bank</span>
        </div>
        <div class="navbar-right">
            <span>Welcome, <%= customerName %></span>

            <!-- Profile Icon with Tooltip -->
            <div class="profile-icon-container" title="View Profile Details">
                <a href="accountDetails.jsp">
                    <img src="images/profile-icon.png" alt="Profile" class="profile-icon" />
                </a>
            </div>

            <div class="nav-item dropdown">
                <a href="#">Services ▾</a>
                <div class="dropdown-content">
                    <a href="withdraw.jsp">Withdraw</a>
                    <a href="deposit.jsp">Deposit</a>
                    <a href="transfer.jsp">Fund Transfer</a>
                    <a href="billPayment.jsp">Bill Payment</a>
                    <a href="loanApplication.jsp">Loan Application</a>
                </div>
            </div>
            <a href="logout.jsp">Logout</a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <h2>Customer Services</h2>
        <div class="menu-grid">
            <a href="accountDetails.jsp">Account Details</a>
            <a href="withdraw.jsp">Withdraw</a>
            <a href="deposit.jsp">Deposit</a>
            <a href="transfer.jsp">Fund Transfer</a>
            <a href="billPayment.jsp">Bill Payment</a>
            <a href="loanApplication.jsp">Apply for Loan</a>
            <a href="transactionHistory.jsp">Transaction History</a>
            <a href="changePassword.jsp">Change Password</a>
        </div>
    </div>
    
        <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2025 Online Bank. All rights reserved. | <a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Use</a></p>
    </footer>
</body>
</html>
    
</body>
</html>
