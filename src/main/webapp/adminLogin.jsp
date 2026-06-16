<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        
        <% if (request.getParameter("error") != null) { %>
            <div class="error">
                <% 
                    String error = request.getParameter("error");
                    if ("invalid_credentials".equals(error)) {
                        out.print("Invalid username, password or admin type");
                    } else if ("invalid_type".equals(error)) {
                        out.print("Invalid admin type");
                    }
                %>
            </div>
        <% } %>
        
        <form action="AdminLoginServlet" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="adminType">Admin Type:</label>
                <select id="adminType" name="adminType" required>
                    <option value="">Select Admin Type</option>
                    <option value="Loan Officer">Loan Officer</option>
                    <option value="Banking Staff">Banking Staff</option>
                    <option value="Administration">Administration</option>
                </select>
            </div>
            <div class="form-group">
            <p class="aa">If you're coustomer, <a href="login.jsp">click here to login</a>.</p>
                <button type="submit">Login</button>
            </div>
        </form>
    </div>
</body>
</html>