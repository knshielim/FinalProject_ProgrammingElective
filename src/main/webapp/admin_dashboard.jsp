<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Admin Dashboard - Halabo Indonesia Tour</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="styles.css">
	</head>
	<body>
	    <jsp:include page="header.jsp" />
	
	    <%
	        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
	        if (isAdmin != null && isAdmin) {
	    %>
	    <div class="admin-dashboard-wrapper">
	        <div class="admin-dashboard-card">
	            <h1 class="admin-title">Admin Dashboard</h1>
	
	            <div class="admin-grid">
	                <a href="add_destination.jsp" class="admin-tile">➕ Add Destination</a>
	                <a href="modify_destination.jsp" class="admin-tile">✏️ Modify Destination</a>
	                <a href="add_package.jsp" class="admin-tile">➕ Add Package</a>
	                <a href="modify_package.jsp" class="admin-tile">✏️ Modify Package</a>
	                <a href="view_users.jsp" class="admin-tile">👥 View Users</a>
	                <a href="view_bookings.jsp" class="admin-tile">📄 View Bookings</a>
	            </div>
	
	            <div class="admin-logout-section">
	                <a href="login?action=logout" class="admin-logout-btn">Logout</a>
	            </div>
	        </div>
	    </div>
	    <%
	        } else {
	    %>
	    <div class="unauthorized-message">
	        <h2>Access Denied</h2>
	        <p>You must be an admin to access this page.</p>
	        <a href="login.jsp" class="hero-btn">Return to Login</a>
	    </div>
	    <%
	        }
	    %>
	
	    <jsp:include page="footer.jsp" />
	</body>
</html>
