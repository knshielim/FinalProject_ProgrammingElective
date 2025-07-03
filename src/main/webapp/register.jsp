<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Halabo Indonesia Tour</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css"> <!-- ✅ Your main stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <script src="register.js" defer></script>
</head>
<body>

    <%-- Optional: include header.jsp if you use one --%>
    <%@ include file="header.jsp" %>

    <div class="login-container" style="background-color: white; max-width: 600px; margin: 80px auto; padding: 40px; border-radius: 12px; box-shadow: 0 6px 20px rgba(0,0,0,0.1);">
        <h2 style="text-align: center; color: #1D3D59; margin-bottom: 1.5rem;">Create Your Account</h2>

        <%
            String error = request.getParameter("error");
            String message = "";

            if (error != null) {
                switch (error) {
                    case "password_mismatch":
                        message = "Passwords do not match.";
                        break;
                    case "user_exists":
                        message = "Username or email already exists.";
                        break;
                    case "registration_failed":
                        message = "Registration failed. Please try again.";
                        break;
                    case "database_error":
                        message = "Something went wrong with the database.";
                        break;
                    default:
                        message = "Unknown error.";
                }
        %>
        <div class="error-message" style="background-color: #ffdddd; color: #d8000c; padding: 12px; border-radius: 8px; text-align: center; margin-bottom: 1rem;">
            <%= message %>
        </div>
        <% } %>

        <form action="register" method="post" onsubmit="return handleRegistration(event)">
		    <div class="form-group">
		        <label for="reg-first-name">First Name</label>
		        <input type="text" id="reg-first-name" name="first_name" class="form-input" required>
		    </div>
		
		    <div class="form-group">
		        <label for="reg-last-name">Last Name</label>
		        <input type="text" id="reg-last-name" name="last_name" class="form-input" required>
		    </div>
		
		    <div class="form-group">
		        <label for="reg-username">Username</label>
		        <input type="text" id="reg-username" name="username" class="form-input" required>
		    </div>
		
		    <div class="form-group">
		        <label for="reg-email">Email</label>
		        <input type="email" id="reg-email" name="email" class="form-input" required>
		    </div>
		
		    <div class="form-group">
		        <label for="reg-password">Password</label>
		        <input type="password" id="reg-password" name="password" class="form-input" required>
		    </div>
		
		    <div class="form-group">
		        <label for="reg-confirm-password">Confirm Password</label>
		        <input type="password" id="reg-confirm-password" name="confirm-password" class="form-input" required>
		    </div>
		
		    <div class="form-group">
		        <label for="reg-phone">Phone Number</label>
		        <input type="tel" id="reg-phone" name="phone" class="form-input" required>
		    </div>
		
		    <button type="submit" class="signup-btn">Sign Up</button>
		</form>


        <p style="text-align: center; margin-top: 20px;">
            Already have an account?
            <a href="login.jsp" style="color: #ff6b00; text-decoration: none; font-weight: bold;">Login here</a>
        </p>

        <div class="back-button" style="text-align: center; margin-top: 20px;">
            <button onclick="history.back()" class="back-btn">← Back</button>
        </div>
    </div>

</body>
</html>
