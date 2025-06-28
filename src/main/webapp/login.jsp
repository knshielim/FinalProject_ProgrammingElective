<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Login - Halabo Tour</title>
	    <link rel="stylesheet" href="css/style.css"> <%-- Adjust path to your CSS --%>
	    <style>
	        /* Basic styling for the login form */
	        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
	        .login-container { background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 350px; text-align: center; }
	        .login-container h1 { color: #333; margin-bottom: 25px; }
	        .form-group { margin-bottom: 15px; text-align: left; }
	        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; color: #555; }
	        .form-group input[type="text"],
	        .form-group input[type="password"] {
	            width: calc(100% - 22px);
	            padding: 10px;
	            border: 1px solid #ccc;
	            border-radius: 4px;
	            font-size: 16px;
	        }
	        .login-btn {
	            background-color: #007bff;
	            color: white;
	            padding: 12px 25px;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 18px;
	            width: 100%;
	            transition: background-color 0.3s ease;
	            margin-top: 20px;
	        }
	        .login-btn:hover { background-color: #0056b3; }
	        .register-link { margin-top: 20px; font-size: 14px; }
	        .register-link a { color: #007bff; text-decoration: none; }
	        .register-link a:hover { text-decoration: underline; }
	
	        /* Error/Success Message Styling */
	        .message-box {
	            padding: 10px;
	            margin-bottom: 15px;
	            border-radius: 4px;
	            font-size: 0.9em;
	            text-align: center;
	        }
	        .message-box.error {
	            background-color: #f8d7da;
	            color: #721c24;
	            border: 1px solid #f5c6cb;
	        }
	        .message-box.success {
	            background-color: #d4edda;
	            color: #155724;
	            border: 1px solid #c3e6cb;
	        }
	    </style>
	</head>
	<body>
	    <div class="login-container">
	        <h1>Login</h1>
	
	        <%-- Display error messages from request attribute (after forward from doPost) --%>
	        <c:if test="${not empty requestScope.errorMessage}">
	            <div class="message-box error">
	                <c:out value="${requestScope.errorMessage}"/>
	            </div>
	        </c:if>
	
	        <%-- Display success messages from URL parameter (after redirect from doGet/logout) --%>
	        <c:if test="${not empty param.message}">
	            <div class="message-box ${param.messageType}">
	                <c:out value="${param.message}"/>
	            </div>
	        </c:if>
	
	        <form action="login" method="post">
	            <div class="form-group">
	                <label for="username">Username:</label>
	                <input type="text" id="username" name="username" required>
	            </div>
	            <div class="form-group">
	                <label for="password">Password:</label>
	                <input type="password" id="password" name="password" required>
	            </div>
	            <button type="submit" class="login-btn">Login</button>
	        </form>
	        <p class="register-link">Don't have an account? <a href="register.jsp">Register here</a></p>
	    </div>
	</body>
</html>