<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Complaint</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .form-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background-color: #f2f2f2;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container label {
            display: block;
            margin-top: 10px;
        }
        .form-container input[type="text"],
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="form-container">
    <h2>Submit a Complaint</h2>
    <form action="SubmitComplaintServlet" method="post">
        <label for="subject">Subject:</label>
        <input type="text" name="subject" id="subject" required>

        <label for="message">Message:</label>
        <textarea name="message" id="message" rows="6" required></textarea>

        <button type="submit">Submit Complaint</button>
    </form>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
