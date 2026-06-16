<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Ticket #${ticket.ticketId}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .ticket-header {
            background-color: #f8f9fa;
            border-radius: 0.375rem;
        }
        .form-section {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        .status-badge {
            font-size: 0.85rem;
            padding: 0.35em 0.65em;
        }
        .priority-badge {
            font-size: 0.85rem;
            padding: 0.35em 0.65em;
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
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow">
                    <div class="card-header ticket-header d-flex justify-content-between align-items-center">
                        <h1 class="h4 mb-0">Edit Ticket #${ticket.ticketId}</h1>
                        <div>
                            <span class="badge ${ticket.status == 'Open' ? 'bg-danger' : 
                                             ticket.status == 'In Progress' ? 'bg-warning text-dark' : 
                                             'bg-success'}">
                                ${ticket.status}
                            </span>
                            <span class="badge ${ticket.priority == 'Low' ? 'bg-success' : 
                                              ticket.priority == 'Medium' ? 'bg-warning text-dark' : 
                                              ticket.priority == 'High' ? 'bg-danger' : 'bg-dark'}">
                                ${ticket.priority} Priority
                            </span>
                        </div>
                    </div>
                    
                    <!-- Rest of your existing content remains the same -->
                    <div class="card-body">
                        <div class="form-section p-4">
                            <form action="EditTicketServlet" method="post">
                                <input type="hidden" name="ticketId" value="${ticket.ticketId}">
                                
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="accountNumber" class="form-label">Account Number</label>
                                        <input type="text" class="form-control" id="accountNumber" 
                                               name="accountNumber" value="${ticket.accountNumber}" readonly="readonly">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="ticketType" class="form-label">Ticket Type</label>
                                        <select class="form-select" id="ticketType" name="ticketType" required>
                                            <option value="Billing" ${ticket.ticketType == 'Billing' ? 'selected' : ''}>Billing</option>
                                            <option value="Technical" ${ticket.ticketType == 'Technical' ? 'selected' : ''}>Technical</option>
                                            <option value="Account" ${ticket.ticketType == 'Account' ? 'selected' : ''}>Account</option>
                                            <option value="Other" ${ticket.ticketType == 'Other' ? 'selected' : ''}>Other</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="subject" class="form-label">Subject</label>
                                    <input type="text" class="form-control" id="subject" 
                                           name="subject" value="${ticket.subject}" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="description" class="form-label">Description</label>
                                    <textarea class="form-control" id="description" 
                                              name="description" rows="4" required>${ticket.description}</textarea>
                                </div>
                                
                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <label for="priority" class="form-label">Priority</label>
                                        <select class="form-select" id="priority" name="priority" required>
                                            <option value="Low" ${ticket.priority == 'Low' ? 'selected' : ''}>Low</option>
                                            <option value="Medium" ${ticket.priority == 'Medium' ? 'selected' : ''}>Medium</option>
                                            <option value="High" ${ticket.priority == 'High' ? 'selected' : ''}>High</option>
                                            <option value="Critical" ${ticket.priority == 'Critical' ? 'selected' : ''}>Critical</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-select" id="status" name="status" >
                                            <option value="Open" ${ticket.status == 'Open' ? 'selected' : ''} >Open</option>
                                            <option value="Resolved" ${ticket.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
                                            <option value="Closed" ${ticket.status == 'Closed' ? 'selected' : ''}>Closed</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="d-flex justify-content-between">
                                    <a href="ViewMyTicketsServlet" class="btn btn-outline-secondary">
                                        <i class="bi bi-arrow-left"></i> Cancel
                                    </a>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="bi bi-save"></i> Update Ticket
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <div class="card-footer text-muted">
                        <small>
                            Created: ${ticket.formattedCreatedAt} | 
                            Last Updated: ${ticket.formattedUpdatedAt}
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>