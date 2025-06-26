<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Login - Halabo Indonesia Tour</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
		<script src="login.js" defer></script>
	</head>
	<body>
		<div class="container">
            <div class="form-container">
                <h2 style="text-align: center; margin-bottom: 2rem;">Login to Your Account</h2>
                <form onsubmit="handleLogin(event)">
                    <div class="form-group">
                        <label for="login-username">Username or Email</label>
                        <input type="text" id="login-username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="login-password">Password</label>
                        <input type="password" id="login-password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Login</button>
                </form>
                <p style="text-align: center; margin-top: 1rem;">
                    Don't have an account? <a href="register.jsp">Sign up here</a>
                </p>
                <div class="back-button-container" style="margin-top: 20px;">
				    <button onclick="history.back()" class="back-btn">← Back</button>
				</div>
            </div>
        </div>
	</body>
</html>