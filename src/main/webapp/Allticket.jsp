<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Support Tickets</title>
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
        .status-resolved {
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
        .action-buttons {
            white-space: nowrap;
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

	<a href="bankingStaffDashboard.jsp" class="btn btn-outline-secondary back-button">
            <i class="bi bi-arrow-left"></i> Back
        </a>

    <div class="container py-4">
        <div class="card shadow">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h1 class="h4 mb-0">All Support Tickets</h1>
                <div>
                    <span class="badge bg-primary">
                        <i class="bi bi-ticket-detailed"></i> Total Tickets: ${not empty tickets ? tickets.size() : 0}
                    </span>
                </div>
            </div>
            
            <div class="card-body">
                <c:if test="${not empty param.resolveSuccess}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle"></i> Ticket resolved successfully!
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
                                        <th>Customer</th>
                                        <th>Account</th>
                                        <th>Type</th>
                                        <th>Subject</th>
                                        <th>Priority</th>
                                        <th>Status</th>
                                        <th>Created</th>
                                        <th>Updated</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${tickets}" var="ticket">
                                        <tr>
                                            <td>#${ticket.ticketId}</td>
                                            <td>${ticket.customerId}</td>
                                            <td>${ticket.accountNumber}</td>
                                            <td>${ticket.ticketType}</td>
                                            <td class="description-cell" title="${ticket.subject}">
                                                ${ticket.subject}
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
                                                <small class="text-muted">${ticket.formattedUpdatedAt}</small>
                                            </td>
                                           
                                            <td class="action-buttons">
                                                <div class="d-flex gap-2">
                                                    <a href="StaffViewOneTicketServlet?ticketId=${ticket.ticketId}" 
                                                       class="btn btn-sm btn-primary" title="View Details">
                                                        <i class="bi bi-eye"></i>
                                                    </a>
                                                    <c:if test="${ticket.status != 'Resolved'}">
                                                        <a href="ResolveTicketServlet?ticketId=${ticket.ticketId}" 
                                                           class="btn btn-sm btn-success" title="Resolve Ticket">
                                                            <i class="bi bi-check-circle"></i>
                                                        </a>
                                                    </c:if>
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
                            <h5 class="mt-3">No support tickets found in the system</h5>
                            <p class="text-muted">When tickets are created, they will appear here</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="card-footer text-muted">
                <small>Last updated: <%= new java.util.Date() %></small>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>