<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
	<meta charset="UTF-8">
    <title>Halabo Indonesia Tour</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>

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
            Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
            String username = (String) session.getAttribute("username");
        %>

        <% if (isLoggedIn != null && isLoggedIn && username != null) { %>
            <!-- User is logged in: show profile image and logout -->
            <a href="profile.jsp" class="profile-btn" title="Profile">
                <img src="GetProfileImageServlet?username=<%= username %>"
                     alt="Profile"
                     style="width: 35px; height: 35px; border-radius: 50%; object-fit: cover; vertical-align: middle;"
                     onerror="this.onerror=null; this.src='images/default_profile.png';">
            </a>
            <a href="login?action=logout" class="login-btn">Logout</a>
        <% } else { %>
            <!-- Not logged in: show login/register -->
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