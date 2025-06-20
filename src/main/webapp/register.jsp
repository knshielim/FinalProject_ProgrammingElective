<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Register - Halabo Indonesia Tour</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
        <div class="container">
            <div class="form-container">
                <h2 style="text-align: center; margin-bottom: 2rem;">Create Your Account</h2>
                <form onsubmit="handleRegistration(event)">
                    <div class="form-group">
                        <label for="reg-username">Username</label>
                        <input type="text" id="reg-username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="reg-email">Email</label>
                        <input type="email" id="reg-email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="reg-password">Password</label>
                        <input type="password" id="reg-password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="reg-confirm-password">Confirm Password</label>
                        <input type="password" id="reg-confirm-password" name="confirm-password" required>
                    </div>
                    <div class="form-group">
                        <label for="reg-phone">Phone Number</label>
                        <input type="tel" id="reg-phone" name="phone" required>
                    </div>
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Sign Up</button>
                </form>
                <p style="text-align: center; margin-top: 1rem;">
                    Already have an account? <a href="login.jsp">Login here</a>
                </p>
            </div>
        </div>
	</body>
</html>