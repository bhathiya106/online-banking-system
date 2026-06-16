<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Bank Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            height: 100vh;
            background-color: #343a40;
            color: white;
            padding-top: 20px;
            position: fixed;
            width: 220px;
            top: 0;
            left: 0;
        }

        .sidebar a {
            color: white;
            display: block;
            padding: 10px;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .content {
            margin-left: 220px;
            padding: 20px;
            margin-top: 56px; /* Height of navbar */
        }

        .card {
            border-radius: 15px;
        }

        .navbar {
            position: fixed;
            top: 0;
            left: 220px;
            right: 0;
            z-index: 1030;
        }

        .card-icon {
            font-size: 2rem;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar p-3">
    <h4 class="text-center">Admin Panel</h4>
    <a href="#">Support Tickets</a>
    <a href="#">Accounts</a>
    <a href="#">Transactions</a>
    <a href="#">Users</a>
    <a href="#">Reports</a>
    <a href="#">Settings</a>
    <a href="adminLogin.jsp">Logout</a>
</div>

<!-- Top Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <span class="navbar-brand">Zentra Bank</span>
    </div>
</nav>

<!-- Main Content -->
<div class="content">
    <h2 class="mb-4">Welcome, Bank Staff</h2>
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card shadow-sm bg-primary text-white p-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h5>Total Accounts</h5>
                        <h3>1200</h3>
                    </div>
                    <div class="card-icon">
                        <i class="bi bi-person-lines-fill"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm bg-success text-white p-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h5>Total Transactions</h5>
                        <h3>8,540</h3>
                    </div>
                    <div class="card-icon">
                        <i class="bi bi-cash-stack"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm bg-warning text-white p-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h5>Registered Users</h5>
                        <h3>980</h3>
                    </div>
                    <div class="card-icon">
                        <i class="bi bi-people-fill"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap 5 JS + Icons -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</body>
</html>