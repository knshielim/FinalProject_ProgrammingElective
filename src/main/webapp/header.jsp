<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.halabo.model.User" %> <%-- Import your User model class here --%>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>
	<div class="header">
	    <div class="logo">
	        <a href="home.jsp"><img src="images/Logo.jpg" alt="Halabo Logo"></a>
	    </div>
	
	    <div class="nav-links" id="navLinks">
		    <i class="fas fa-xmark" onclick="hideMenu()"></i>
		    <ul>
		        <li><a href="home.jsp">Home</a></li>
		        <li><a href="about.jsp">About</a></li>
		        <li><a href="attractions.jsp">Attractions</a></li>
		        <li><a href="packages.jsp">Packages</a></li>
		        <li><a href="feedback.jsp" class="feedback-btn">Feedback</a></li>
		        <li><a href="booking.jsp" class="booking-btn">Book Now</a></li>
		        <li><a href="contact.jsp" class="contact-btn">Contact Us</a></li>
		
		        <%-- Server-side login check --%>
		        <%
		            User loggedInUser = (User) session.getAttribute("loggedInUser");
		            boolean isLoggedIn = (loggedInUser != null);
		            String usernameForHeader = isLoggedIn ? loggedInUser.getUsername() : "";
		            boolean isAdmin = isLoggedIn && loggedInUser.isAdmin();
		        %>
		
		        <% if (isAdmin) { %>
		            <li><a href="admin_dashboard.jsp" class="admin-btn">Admin Dashboard</a></li>
		        <% } %>
		
		        <% if (isLoggedIn) { %>
		            <li>
		                <a href="profile.jsp" class="profile-btn" title="Profile">
		                    <img src="GetProfileImageServlet?username=<%= usernameForHeader %>"
		                         alt="Profile"
		                         style="width: 35px; height: 35px; border-radius: 50%; object-fit: cover; vertical-align: middle;"
		                         onerror="this.onerror=null; this.src='images/default_profile.png';">
		                </a>
		            </li>
		            <li><a href="login?action=logout" class="logout-btn">Logout</a></li>
		        <% } else { %>
		            <li><a href="login.jsp" class="login-btn">Login</a></li>
		            <li><a href="register.jsp" class="register-btn">Register</a></li>
		        <% } %>
		    </ul>
		</div>

	
	    <i class="fa fa-bars" onclick="showMenu()"></i>
	</div>
	
	<script>
	    var navLinks = document.getElementById("navLinks");
	
	    function showMenu() {
	        navLinks.style.right = "0";
	    }
	
	    function hideMenu() {
	        navLinks.style.right = "-200px";
	    }
	</script>
</body>