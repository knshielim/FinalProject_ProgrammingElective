<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Halabo Tour</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- ✅ Matches your site-wide CSS -->
</head>
<body>

    <!-- Optional: Include the same header.jsp if applicable -->
    <%@ include file="header.jsp" %>

    <div class="login-container" style="background-color: white; max-width: 500px; margin: 80px auto; padding: 40px; border-radius: 12px; box-shadow: 0 6px 20px rgba(0,0,0,0.1);">
        <h1 style="color: #1D3D59;">Login</h1>

        <!-- Error Message -->
        <c:if test="${not empty requestScope.errorMessage}">
            <div style="background-color: #ffdddd; color: #d8000c; padding: 12px; border-radius: 8px; margin-bottom: 20px; text-align: center;">
                <c:out value="${requestScope.errorMessage}"/>
            </div>
        </c:if>

        <!-- Success Message -->
        <c:if test="${not empty param.message}">
            <div style="background-color: #ddffdd; color: #4F8A10; padding: 12px; border-radius: 8px; margin-bottom: 20px; text-align: center;">
                <c:out value="${param.message}"/>
            </div>
        </c:if>

        <!-- Login Form -->
        <form action="login" method="post">
            <div class="form-group" style="margin-bottom: 20px;">
                <label for="username" style="color: #1D3D59; font-weight: bold;">Username:</label>
                <input type="text" id="username" name="username" required
                       style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 6px; margin-top: 6px;">
            </div>

            <div class="form-group" style="margin-bottom: 20px;">
                <label for="password" style="color: #1D3D59; font-weight: bold;">Password:</label>
                <input type="password" id="password" name="password" required
                       style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 6px; margin-top: 6px;">
            </div>

            <button type="submit" class="login-btn" style="width: 100%; background-color: #ff6b00; color: white; border: none; padding: 12px; border-radius: 25px; font-weight: bold; font-size: 16px; cursor: pointer; transition: all 0.3s;">
                Login
            </button>
        </form>

        <p class="register-link" style="text-align: center; margin-top: 20px;">
            Don't have an account?
            <a href="register.jsp" style="color: #ff6b00; text-decoration: none; font-weight: bold;">Register here</a>
        </p>
    </div>

</body>
</html>
