<%@ page import="java.util.List" %>
<%@ page import="model.LoanApplication" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Loan Applications</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap @5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/css/list.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    
</head>
<body class="container mt-5">

<div class="navbar">
   
    <a href="adminLogin.jsp">LogOut</a>
    <h1 class="logout">Zentra Bank</h1>
</div>

    
    <div class="page-header">
        <h2 class="page-title">Loan Applications</h2>
       <!--  <a href="views/add-loan.jsp" class="btn btn-primary">➕ Add New Application</a> -->    </div>

    
    <div class="table-container">
        <table class="table table-hover align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Phone</th>
					<th>Address</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<LoanApplication> loans = (List<LoanApplication>) request.getAttribute("loans"); 
                if (loans != null && !loans.isEmpty()) {
                    for (LoanApplication loan : loans) { %>
                <tr>
                    <td><%= loan.getId() %></td>
                    <td><%= loan.getCustomerName() %></td>
                    <td><%= loan.getLoanType() %></td>
                    <td>$<%= String.format("%.2f", loan.getAmount()) %></td>
                    <td><%= loan.getPhone() %></td>
					<td><%= loan.getAddress() %></td>
                    
                    <td>
                        <% String status = loan.getStatus(); %>
                        <span class="badge <%= status.equals("Approved") ? "status-approved" :
                                    status.equals("Rejected") ? "status-rejected" : "status-pending" %>">
                            <%= status %>
                        </span>
                    </td>
                    <td><%= loan.getCreatedAt() %></td>

                    <td>
                        <a href="EditLoanServlet?id=<%= loan.getId() %>" class="btn btn-sm btn-outline-primary">Edit</a>
                        <a href="DeleteLoanServlet?id=<%= loan.getId() %>" class="btn btn-sm btn-outline-danger">Delete</a>
                    </td>
                </tr>
                <% } } else { %>
                <tr>
                    <td colspan="7" class="no-data">No applications found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    
     <%@ include file="footer.jsp" %>

</body>
</html>