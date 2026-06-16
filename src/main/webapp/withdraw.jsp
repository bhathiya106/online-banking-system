<%@ page language="java" session="true" %>
<%
    String customerName = (String) session.getAttribute("customerName");
    if (customerName == null) customerName = "Guest";
%>
<html>
<head>
    <title>Withdraw Funds</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
      
</head>
<body>
    <%@ include file="navbar.jsp" %>
<%@ include file="footer.jsp" %>
    <!-- Withdraw Form -->
    <div class="container2">
        <h2>Withdraw Funds</h2>
        <form action="WithdrawServlet" method="post" >
            <label for="amount">Amount to Withdraw:</label><br>
            <input type="number" id="amount" name="amount" required /><br><br>

            <label for="method">Withdrawal Method:</label><br>
            <select id="method" name="method" required>
                <option value="ATM">ATM</option>
                <option value="Bank Transfer">Bank Transfer</option>
            </select><br><br>

            <input type="submit" value="Withdraw" />
        </form>
    </div>
    
    
</body>
</html>
