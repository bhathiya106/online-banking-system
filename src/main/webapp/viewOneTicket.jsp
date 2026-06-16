<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ticket Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .ticket-header {
            background-color: #f8f9fa;
            border-radius: 0.375rem;
        }
        .detail-label {
            font-weight: 600;
            color: #495057;
        }
        .resolution-box {
            background-color: #f8f9fa;
            border-left: 4px solid #0d6efd;
            border-radius: 0.375rem;
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
        <div class="card shadow">
            <div class="card-header ticket-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="h4 mb-0">Ticket #${ticket.ticketId}: ${ticket.subject}</h1>
                    <div>
                        <span class="badge bg-primary">${ticket.priority} Priority</span>
                        <c:choose>
                            <c:when test="${ticket.status == 'Open'}">
                                <span class="badge bg-danger">${ticket.status}</span>
                            </c:when>
                            <c:when test="${ticket.status == 'In Progress'}">
                                <span class="badge bg-warning text-dark">${ticket.status}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-success">${ticket.status}</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <p class="mb-0 text-muted mt-2">
                    <small>Created: ${ticket.formattedCreatedAt} | Last Updated: ${ticket.formattedUpdatedAt}</small>
                </p>
            </div>
            
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <span class="detail-label">Ticket Type:</span>
                            <div>${ticket.ticketType}</div>
                        </div>
                        <div class="mb-3">
                            <span class="detail-label">Account Number:</span>
                            <div>${ticket.accountNumber}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <c:if test="${not empty ticket.assignedTo}">
                            <div class="mb-3">
                                <span class="detail-label">Assigned To:</span>
                                <div>${ticket.assignedTo}</div>
                            </div>
                        </c:if>
                    </div>
                </div>
                
                <div class="mb-4">
                    <span class="detail-label">Description:</span>
                    <div class="p-3 bg-light rounded">${ticket.description}</div>
                </div>
                
                <c:if test="${not empty ticket.resolutionDetails}">
                    <div class="mb-4">
                        <span class="detail-label">Resolution:</span>
                        <div class="p-3 resolution-box">${ticket.resolutionDetails}</div>
                    </div>
                </c:if>
                
                <div class="d-flex justify-content-between">
                    <a href="ViewMyTicketsServlet" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left"></i> Back to My Tickets
                    </a>
                    <div class="btn-group">
                        <a href="EditTicketServlet?ticketId=${ticket.ticketId}" class="btn btn-warning">
                            <i class="bi bi-pencil"></i> Edit
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>