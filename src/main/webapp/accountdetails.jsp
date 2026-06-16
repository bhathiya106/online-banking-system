<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        out.println("<p>Session expired. Please <a href='login.jsp'>login again</a>.</p>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Account Details</title>
     <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container1">
    <h2>Account Details</h2>
    <p><strong>Full Name:</strong> <%= user.getFullName() %></p>
    <p><strong>Date of Birth:</strong> <%= user.getDateOfBirth() %></p>
    <p><strong>NIC:</strong> <%= user.getNic() %></p>
    <p><strong>Address:</strong> <%= user.getAddress() %></p>
    <p><strong>Contact Number:</strong> <%= user.getContactNumber() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>
    <p><strong>Account Number:</strong> <%= user.getAccountNumber() %></p>
    <p><strong>Branch Name:</strong> <%= user.getBranchName() %></p>
    
    <form action="update.jsp" method="get">
    <input type="submit" value="Update Profile" />
</form>
    
    </div> 
</body>
</html>
