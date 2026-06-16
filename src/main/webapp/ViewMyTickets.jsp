<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Support Tickets</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .status-badge {
            font-size: 0.85rem;
            padding: 0.35em 0.65em;
        }
        .priority-badge {
            font-size: 0.85rem;
            padding: 0.35em 0.65em;
        }
        .status-open {
            background-color: #f8d7da;
            color: #721c24;
        }
        .status-in-progress {
            background-color: #fff3cd;
            color: #856404;
        }
        .status-resolved, .status-closed {
            background-color: #d4edda;
            color: #155724;
        }
        .priority-low {
            background-color: #d4edda;
            color: #155724;
        }
        .priority-medium {
            background-color: #fff3cd;
            color: #856404;
        }
        .priority-high {
            background-color: #f8d7da;
            color: #721c24;
        }
        .priority-critical {
            background-color: #721c24;
            color: white;
        }
        .description-cell {
            max-width: 250px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .card-header {
            background-color: #f8f9fa;
        }
        .table-responsive {
            overflow-x: auto;
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
        top: 70px;  /* Increased from 15px to 70px */
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

        <div class="card shadow">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h1 class="h4 mb-0">My Support Tickets</h1>
                <a href="AddTicketViewServlet" class="btn btn-success">
                    <i class="bi bi-plus-circle"></i> Create New Ticket
                </a>
            </div>
            
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
                
                <c:choose>
                    <c:when test="${not empty tickets}">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle">
                                <thead class="table-primary">
                                    <tr>
                                        <th>Ticket ID</th>
                                        <th>Account</th>
                                        <th>Type</th>
                                        <th>Subject</th>
                                        <th>Description</th>
                                        <th>Priority</th>
                                        <th>Status</th>
                                        <th>Created</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${tickets}" var="ticket">
                                        <tr>
                                            <td>#${ticket.ticketId}</td>
                                            <td>${ticket.accountNumber}</td>
                                            <td>${ticket.ticketType}</td>
                                            <td>${ticket.subject}</td>
                                            <td class="description-cell" title="${ticket.description}">
                                                ${ticket.description}
                                            </td>
                                            <td>
                                                <span class="badge priority-${ticket.priority.toLowerCase()} priority-badge">
                                                    ${ticket.priority}
                                                </span>
                                            </td>
                                            <td>
                                                <span class="badge status-${ticket.status.toLowerCase().replace(' ', '-')} status-badge">
                                                    ${ticket.status}
                                                </span>
                                            </td>
                                            <td>
                                                <small class="text-muted">${ticket.formattedCreatedAt}</small>
                                            </td>
                                            <td>
                                                <div class="d-flex gap-2">
                                                    <a href="ViewOneTicketServlet?ticketId=${ticket.ticketId}" 
                                                       class="btn btn-sm btn-primary" title="View Details">
                                                        <i class="bi bi-eye"></i>
                                                    </a>
                                                    <a href="EditTicketServlet?ticketId=${ticket.ticketId}" 
                                                       class="btn btn-sm btn-warning" title="Edit Ticket">
                                                        <i class="bi bi-pencil"></i>
                                                    </a>
                                                    <a href="DeleteTicketServlet?ticketId=${ticket.ticketId}" 
                                                       class="btn btn-sm btn-danger" title="Delete Ticket"
                                                       onclick="return confirm('Are you sure you want to delete this ticket?')">
                                                        <i class="bi bi-trash"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5">
                            <i class="bi bi-ticket-detailed text-muted" style="font-size: 3rem;"></i>
                            <h5 class="mt-3">You don't have any support tickets yet</h5>
                            <p class="text-muted">Click "Create New Ticket" to submit a support request</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>