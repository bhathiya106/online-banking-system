<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create Support Ticket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .account-info-card {
            background-color: #f8f9fa;
            border-left: 4px solid #0d6efd;
        }
        .form-section {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        .navbar-custom {
            background-color: #e3f2fd !important;
        }
        .nav-link-custom {
            color: #2c3e50 !important;
            font-weight: 500;
        }
        .nav-link-custom:hover {
            color: #0d6efd !important;
        }
        .bank-brand {
            color: #2c3e50 !important;
            font-weight: bold;
            font-size: 1.2rem;
        }
        .back-button {
            position: absolute;
            left: 15px;
            top: 70px;
            z-index: 1000;
        }
    </style>
</head>
<body class="bg-light">
    <!-- Top Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-custom mb-4">
        <div class="container-fluid">
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom" href="HomeServlet"><i class="bi bi-house-door"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom" href="DepositServlet"><i class="bi bi-cash-stack"></i> Deposit</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom" href="LoanServlet"><i class="bi bi-bank"></i> Loan</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom" href="ProfileServlet"><i class="bi bi-person-circle"></i> My Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom" href="home.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <span class="navbar-text bank-brand">Zentra Bank</span>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container py-4">
        <!-- Back Button -->
        <a href="home.jsp" class="btn btn-outline-secondary back-button">
            <i class="bi bi-arrow-left"></i> Back
        </a>

        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h1 class="h4 mb-0">Create Support Ticket</h1>
                    </div>
                    
                    <!-- Rest of the content remains unchanged -->
                    <div class="card-body">
                        <c:if test="${not empty successMessage}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                ${successMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ${errorMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        
                        <div class="card mb-4 account-info-card">
                            <div class="card-body py-2">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <strong><i class="bi bi-person"></i> Logged in as:</strong> ${user.username}
                                    </div>
                                    <div>
                                        <strong><i class="bi bi-credit-card"></i> Account:</strong> ${user.accountNumber}
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-section p-4">
                            <form action="AddTicketServlet" method="post">
                                <div class="mb-3">
                                    <label for="accountNumber" class="form-label">Account Number</label>
                                    <input type="text" class="form-control" id="accountNumber" name="accountNumber" 
                                           value="${user.accountNumber}" readonly>
                                    <div class="form-text">This will be automatically associated with your ticket</div>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="ticketType" class="form-label">Issue Type</label>
                                    <select class="form-select" id="ticketType" name="ticketType" required>
                                        <option value="" selected disabled>Select an issue type</option>
                                        <option value="Account Access">Account Access</option>
                                        <option value="Transaction Issue">Transaction Issue</option>
                                        <option value="Card Problem">Card Problem</option>
                                        <option value="Online Banking">Online Banking</option>
                                        <option value="Mobile App">Mobile App</option>
                                        <option value="Loan Inquiry">Loan Inquiry</option>
                                        <option value="Fraud Concern">Fraud Concern</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="subject" class="form-label">Subject</label>
                                    <input type="text" class="form-control" id="subject" name="subject" 
                                           placeholder="Briefly describe your issue" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="description" class="form-label">Description</label>
                                    <textarea class="form-control" id="description" name="description" 
                                              rows="5" placeholder="Please provide detailed information about your issue" required></textarea>
                                </div>
                                
                                <div class="mb-4">
                                    <label for="priority" class="form-label">Priority</label>
                                    <select class="form-select" id="priority" name="priority" required>
                                        <option value="Low">Low - General inquiry</option>
                                        <option value="Medium" selected>Medium - Non-urgent issue</option>
                                        <option value="High">High - Affecting my banking</option>
                                        <option value="Critical">Critical - Security or fraud concern</option>
                                    </select>
                                </div>
                                
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="bi bi-send"></i> Submit Ticket
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>