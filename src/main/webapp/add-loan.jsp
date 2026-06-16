<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Loan Application</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/style1.css" rel="stylesheet">
    
    
    
</head>
<body>



 
    <div class="container mt-5">
        <div class="form-container shadow p-4 rounded bg-light">
            <h2 class="mb-4">Add Loan Application</h2>

            <form action="${pageContext.request.contextPath}/AddLoanServlet" method="post" onsubmit="return validateForm()">
                <div class="mb-3">
                    <label for="customerName" class="form-label">Customer Name</label>
                    <input type="text" name="customerName" id="customerName" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="loanType" class="form-label">Loan Type</label>
                    <select name="loanType" id="loanType" class="form-select" required>
                        <option value="">Select</option>
                        <option value="Home">Home Loan</option>
                        <option value="Personal">Personal Loan</option>
                        <option value="Car">Car Loan</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="amount" class="form-label">Loan Amount</label>
                    <input type="number" name="amount" id="amount" class="form-control" min="1000" max="1000000" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="tel" name="phone" id="phone" class="form-control" pattern="[0-9]{10}" placeholder="e.g. 1234567890" required>
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <textarea name="address" id="address" class="form-control" rows="3" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary btn-lg">Submit Application</button>
            </form>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/validation.js"></script>
</body>
</html>
