<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="adminModel.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Online Banking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body style="background-color: #f8f9fa;">

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="#">Zentra Bank Admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="#">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Users</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Settings</a></li>
                <li class="nav-item"><a class="nav-link" href="adminLogin.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Heading -->
<div class="container py-5">
    <h2 class="text-center mb-4 text-primary">Zentra Bank - User Management</h2>
</div>
<div class="container py-5">
    <h2 class="text-center mb-4 text-primary">User Management</h2>

    <!-- Add User Form -->
    <div class="card shadow-sm mb-5">
        <div class="card-header bg-success text-white">
            <i class="fa fa-user-plus"></i> Add New User
        </div>
        <div class="card-body">
            <form method="post" action="admin">
                <input type="hidden" name="action" value="add" />
                <div class="row g-3">
                    <div class="col-md-3">
                        <input name="name" class="form-control" placeholder="Full Name" required>
                    </div>
                    <div class="col-md-3">
                        <input name="email" type="email" class="form-control" placeholder="Email Address" required>
                    </div>
                    <div class="col-md-2">
                        <select name="role" class="form-select">
                            <option>Admin</option>
                            <option>BankingStaff</option>
                            <option>LoanOfficer</option>
                            <option>Customer</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input name="password" type="password" class="form-control" placeholder="Password" required>
                    </div>
                    <div class="col-md-2 d-grid">
                        <button class="btn btn-success"><i class="fa fa-plus-circle"></i> Add User</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- User List Table -->
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <i class="fa fa-users"></i> Registered Users
        </div>
        <div class="card-body p-0">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                   <%
    					// Retrieve the userList attribute from the request
                        Object userListObj = request.getAttribute("userList");
    
   					   	// Ensure it's of type List<User>
   						if (userListObj instanceof List<?>) {
        					List<?> userList = (List<?>) userListObj;
        					// Further check if the list contains User objects (type-safe check)
        					if (!userList.isEmpty() && userList.get(0) instanceof User) {
            					
            
            					List<User> users = (List<User>) userList;
            					for (User user : users) {
   		 			%>
                	<tr>
                    	<td><%= user.getId() %></td>
                    	<td><%= user.getName() %></td>
                    	<td><%= user.getEmail() %></td>
                    	<td><%= user.getRole() %></td>
                    	<td>
                        	<form method="post" action="admin" class="d-inline">
                            	<input type="hidden" name="action" value="delete" />
                            	<input type="hidden" name="id" value="<%= user.getId() %>" />
                            	<button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editModal<%= user.getId() %>">
                            		<i class="fa fa-edit">Edit</i>
                            	</button>
                            	<button class="btn btn-danger btn-sm">
                                	<i class="fa fa-trash"></i> Delete
                            	</button>
                        	</form>
                        <div class="modal fade" id="editModal<%= user.getId() %>" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  								<div class="modal-dialog">
    								<form method="post" action="admin">
      									<div class="modal-content">
        									<div class="modal-header bg-warning">
          										<h5 class="modal-title" id="editModalLabel">Edit User - <%= user.getName() %></h5>
         										<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        									</div>
        									<div class="modal-body">
          										<input type="hidden" name="action" value="update" />
          										<input type="hidden" name="id" value="<%= user.getId() %>" />

          										<div class="mb-3">
            										<label class="form-label">Email</label>
            										<input type="email" name="email" class="form-control" value="<%= user.getEmail() %>">
          										</div>

          										<div class="mb-3">
            										<label class="form-label">Role</label>
            										<select name="role" class="form-select">
    													<option value="Admin" <%= user.getRole().equals("Admin") ? "selected" : "" %>>Admin</option>
    													<option value="BankingStaff" <%= user.getRole().equals("BankingStaff") ? "selected" : "" %>>BankingStaff</option>
    													<option value="LoanOfficer" <%= user.getRole().equals("LoanOfficer") ? "selected" : "" %>>LoanOfficer</option>
														<option value="customer" <%= user.getRole().equals("customer") ? "selected" : "" %>>Customer</option>
													</select>
            									</div>

          										<div class="mb-3">
            										<label class="form-label">New Password (leave blank to keep unchanged)</label>
            										<input type="password" name="password" class="form-control">
          										</div>
        								</div>
        								<div class="modal-footer">
          									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          									<button type="submit" class="btn btn-warning">Update</button>
        								</div>
      								</div>
    							</form>
  							</div>
					</div>

                    	</td>
                		</tr>
							
						                		
                	
                	
    			<%
            	}
        	}
    	}
    				else {
    						%>
        						<tr>
            						<td colspan="5" class="text-center text-muted">No users found.</td>
        						</tr>
    						<%
    					}
				%>
                   
            </tbody>
         </table>
        </div>
    </div>
</div>

<!-- Bootstrap & FontAwesome JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>