<%@ page import="model.LoanApplication" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Loan Application</title>

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap @5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    
    <link href="${pageContext.request.contextPath}/css/edit.css" rel="stylesheet">
</head>
<body class="bg-light">

    <%
        LoanApplication loan = (LoanApplication) request.getAttribute("loan");
        if (loan == null) {
            response.sendRedirect("ListLoansServlet");
            return;
        }
    %>

    <div class="form-container rounded shadow-sm bg-white p-4 mx-auto mt-5" style="max-width: 600px;">
        <h2 class="text-center mb-4">Edit Loan Application</h2>

        <form action="UpdateLoanServlet" method="post">
            <input type="hidden" name="id" value="<%= loan.getId() %>">

            <div class="mb-3">
                <label class="form-label">Customer Name</label>
                <input type="text" name="customerName" value="<%= loan.getCustomerName() %>" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Loan Type</label>
                <select name="loanType" class="form-select" required>
                    <option value="Home" <%= "Home".equals(loan.getLoanType()) ? "selected" : "" %>>Home Loan</option>
                    <option value="Personal" <%= "Personal".equals(loan.getLoanType()) ? "selected" : "" %>>Personal Loan</option>
                    <option value="Car" <%= "Car".equals(loan.getLoanType()) ? "selected" : "" %>>Car Loan</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Loan Amount</label>
                <input type="number" name="amount" value="<%= loan.getAmount() %>" class="form-control" min="1000" max="1000000" required>
            </div>
            
                    
        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" name="phone" value="<%= loan.getPhone() %>" class="form-control" pattern="[0-9]{10}" placeholder="e.g., 1234567890" required>
        </div>

       
        <div class="mb-3">
            <label class="form-label">Address</label>
            <textarea name="address" class="form-control" rows="3" required><%= loan.getAddress() %></textarea>
        </div>

            <div class="mb-3">
                <label class="form-label">Status</label>
                <select name="status" class="form-select" required>
                    <option value="Pending" <%= "Pending".equals(loan.getStatus()) ? "selected" : "" %>>Pending</option>
                    <option value="Approved" <%= "Approved".equals(loan.getStatus()) ? "selected" : "" %>>Approved</option>
                    <option value="Rejected" <%= "Rejected".equals(loan.getStatus()) ? "selected" : "" %>>Rejected</option>
                </select>
            </div>

            <button type="submit" class="btn btn-success w-100">Update Application</button>
        </form>
    </div>

</body>
</html>