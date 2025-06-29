<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.halabo.model.User" %> <%-- Import your User model class here --%>

<head>
    <meta charset="UTF-8">
    <title>Halabo Indonesia Tour</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <style>
        /* Optional: Add some basic styling for the new buttons if not already in styles.css */
        .admin-btn {
            background-color: #007bff; /* Example blue */
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin-left: 10px;
            white-space: nowrap; /* Prevent button text from wrapping */
        }
        .admin-btn:hover {
            background-color: #0056b3;
        }
        .profile-btn {
            display: inline-block; /* Ensure profile image and text are on the same line if you add text */
            margin-left: 10px;
        }
        .profile-btn img {
            vertical-align: middle; /* Align image nicely with other elements */
        }
        .login-btn, .register-btn, .logout-btn {
            /* Assuming you already have styles for these. If not, add them. */
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin-left: 10px;
            white-space: nowrap;
        }
        .login-btn { background-color: #28a745; color: white; } /* Example green */
        .register-btn { background-color: #17a2b8; color: white; } /* Example cyan */
        .logout-btn { background-color: #dc3545; color: white; } /* Example red */

        /* To properly hide and show elements without breaking layout, you might want to use display: none; */
        .hidden {
            display: none;
        }
    </style>
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
	        </ul>
	
	        <a href="feedback.jsp" class="feedback-btn">Feedback</a>
	        <a href="booking.jsp" class="booking-btn">Book Now</a>
	        <a href="contact.jsp" class="contact-btn">Contact Us</a>
	
	        <%
	            // Retrieve the User object from session
	            User loggedInUser = (User) session.getAttribute("loggedInUser");
	
	            // Initialize flags and username
	            Boolean isLoggedIn = (loggedInUser != null); // User is logged in if loggedInUser object exists
	            String usernameForHeader = (isLoggedIn ? loggedInUser.getUsername() : ""); // Get username from object
	            Boolean isAdmin = (isLoggedIn ? loggedInUser.isAdmin() : false); // Get admin status from object
	        %>
	
	        <% if (isAdmin) { %>
	            <a href="admin_dashboard.jsp" class="admin-btn">Admin Dashboard</a>
	        <% } %>
	
	        <% if (isLoggedIn) { %>
	            <a href="profile.jsp" class="profile-btn" title="Profile">
	                <%-- Use usernameForHeader for the image source --%>
	                <img src="GetProfileImageServlet?username=<%= usernameForHeader %>"
	                     alt="Profile"
	                     style="width: 35px; height: 35px; border-radius: 50%; object-fit: cover; vertical-align: middle;"
	                     onerror="this.onerror=null; this.src='images/default_profile.png';">
	            </a>
	            <a href="login?action=logout" class="logout-btn">Logout</a>
	        <% } else { %>
	            <a href="login.jsp" class="login-btn">Login</a>
	            <a href="register.jsp" class="register-btn">Register</a>
	        <% } %>
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