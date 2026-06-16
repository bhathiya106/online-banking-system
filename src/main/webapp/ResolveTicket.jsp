<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Resolve Ticket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .resolution-card {
            max-width: 700px;
            margin: 2rem auto;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
        }
        .resolution-header {
            background-color: #198754;
            color: white;
        }
        .resolution-body {
            padding: 2rem;
        }
        .resolution-textarea {
            min-height: 200px;
        }
        .btn-resolve {
            background-color: #198754;
            color: white;
        }
        .btn-resolve:hover {
            background-color: #157347;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="card resolution-card">
            <div class="card-header resolution-header">
                <h1 class="h4 mb-0">
                    <i class="bi bi-check-circle-fill me-2"></i>Resolve Ticket #${ticketId}
                </h1>
            </div>
            
            <div class="card-body resolution-body">
                
                
                <div class="alert alert-info mb-4">
                    <i class="bi bi-info-circle-fill me-2"></i> Please provide detailed resolution steps for this ticket.
                </div>
                
                <form action="ResolveTicketServlet" method="post">
                    <input type="hidden" name="ticketId" value="${ticketId}">
                    
                    <div class="mb-4">
                        <label for="resolutionDetails" class="form-label fw-bold">Resolution Details</label>
                        <textarea class="form-control resolution-textarea" id="resolutionDetails" 
                                  name="resolutionDetails" required></textarea>
                        <div class="form-text">Describe how the issue was resolved and any steps taken.</div>
                    </div>
                    
                    <div class="d-flex justify-content-end gap-2">
                        <a href="AllTicketServlet" class="btn btn-outline-secondary">
                            <i class="bi bi-x-circle me-2"></i>Cancel
                        </a>
                        <button type="submit" class="btn btn-resolve">
                            <i class="bi bi-check-circle me-2"></i>Submit Resolution
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>