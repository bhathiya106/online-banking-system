<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
 
 <h1>Zentra online banking</h1>
    <form method="post" action="LoginServlet">
    
    <center><strong>Log in </strong></center><br><br>
    
    
        Username: <input type="text" name="username"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Login">
          <p class="aa">If you're not registered, <a href="register.jsp">click here to register</a>.</p>
           <p class="aa">If you're staff member , <a href="adminLogin.jsp">click here to login</a>.</p>
    </form>

  
    <%@ include file="footer.jsp" %>
</body>
</html>
