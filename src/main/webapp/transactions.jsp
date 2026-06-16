<%@ page import="java.util.List" %>
<%@ page import="model.Transaction" %>
<%
    List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

  <%@ include file="navbar.jsp" %>
    <h2>Your Transaction History</h2>
    
    <div class="container1">
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        <% if (transactions != null) {
            for (Transaction txn : transactions) { %>
                <tr>
                    <td><%= txn.getId() %></td>
                    <td><%= txn.getType() %></td>
                    <td><%= txn.getAmount() %></td>
                    <td><%= txn.getDate() %></td>
                    <td>
                    <form action="DeleteTransactionServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this transaction?');">
                        <input type="hidden" name="transactionId" value="<%= txn.getId() %>" />
                        <button type="submit">Delete</button>
                    </form>
                </td>
                </tr>
        <%  }} else { %>
            <tr><td colspan="4">No transactions found.</td></tr>
        <% } %>
    </table>
    
    </div>
    
     <%@ include file="footer.jsp" %>
</body>
</html>
