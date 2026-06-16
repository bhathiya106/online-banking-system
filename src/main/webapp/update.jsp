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
    <title>Update Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%@ include file="navbar.jsp" %>
    <div class="container1">
        <h2>Update Your Profile</h2>
        <form action="UpdateProfileServlet" method="post">
            Full Name: <input type="text" name="fullName" value="<%= user.getFullName() %>"/><br>
            Date of Birth: <input type="date" name="dob" value="<%= user.getDateOfBirth() %>"/><br>
            NIC: <input type="text" name="nic" value="<%= user.getNic() %>"/><br>
            Address: <input type="text" name="address" value="<%= user.getAddress() %>"/><br>
            Contact Number: <input type="text" name="contactNumber" value="<%= user.getContactNumber() %>"/><br>
            Email: <input type="email" name="email" value="<%= user.getEmail() %>"/><br>
            Branch Name: <input type="text" name="branchName" value="<%= user.getBranchName() %>"/><br>
            <input type="hidden" name="username" value="<%= user.getUsername() %>"/>
            <input type="submit" value="Update" />
        </form>
    </div>
    
     <%@ include file="footer.jsp" %>
</body>
</html>
