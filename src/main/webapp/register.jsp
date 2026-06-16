<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
       <h1>Zentra online banking</h1>
    <form method="post" action="RegisterServlet">
    
    
     <center><strong><h3 class="rr">Register</h3></strong></center>
        <h3>Personal Details</h3>
        Full Name: <input type="text" name="fullName"><br>
        Date of Birth: <input type="date" name="dateOfBirth"><br>
        NIC: <input type="text" name="nic"><br>
        Address: <input type="text" name="address"><br>
        Contact Number: <input type="text" name="contactNumber"><br>
        Email: <input type="email" name="email"><br>

        <h3>Banking Details</h3>
        Account Number: <input type="text" name="accountNumber"><br>
        Branch Name: <input type="text" name="branchName"><br>

        <h3>Login Credentials</h3>
        Username: <input type="text" name="username"><br>
        Password: <input type="password" name="password"><br>
        Confirm Password: <input type="password" name="confirmPassword"><br>

        <input type="submit" value="Register">
    </form>
    <%@ include file="footer.jsp" %>
</body>
</html>