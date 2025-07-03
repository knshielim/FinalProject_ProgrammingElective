<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import="java.io.File" %>
<%@ page import="com.halabo.model.User" %>

<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        response.sendRedirect("login.jsp?error=not_logged_in");
        return;
    }

    String fullName = loggedInUser.getFullName(); 
    String username = loggedInUser.getUsername();
    String email = loggedInUser.getEmail();
    String phone = loggedInUser.getPhone();

    String imagePath = "uploads/" + username + ".jpg";
    String realPath = application.getRealPath("/") + imagePath;
    File file = new File(realPath);
    String imageToDisplay = file.exists() ? imagePath : "images/default_profile.png";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile - Halabo Indonesia Tour</title>
    <link rel="stylesheet" href="styles.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="profile-wrapper">
    <div class="profile-container">
        <h2 class="profile-title">Welcome, <%= fullName %>!</h2>

        <div class="profile-image-section">
            <img src="GetProfileImageServlet?username=<%= username %>" alt="Profile Image"
                 class="profile-image"
                 onerror="this.onerror=null; this.src='images/default_profile.png';">

            <form action="UploadProfileImageServlet" method="post" enctype="multipart/form-data" class="profile-upload-form">
                <input type="file" name="profileImage" accept="image/*" required>
                <input type="hidden" name="username" value="<%= username %>">
                <button type="submit">Upload New Image</button>
            </form>
        </div>

        <div class="profile-info">
		    <div class="profile-field">
		        <label>Full Name:</label>
		        <div class="profile-value-box"><%= fullName %></div>
		    </div>
		    <div class="profile-field">
		        <label>Username:</label>
		        <div class="profile-value-box"><%= username %></div>
		    </div>
		    <div class="profile-field">
		        <label>Email:</label>
		        <div class="profile-value-box"><%= email %></div>
		    </div>
		    <div class="profile-field">
		        <label>Phone Number:</label>
		        <div class="profile-value-box"><%= phone %></div>
		    </div>
		</div>

        <div class="profile-back">
            <a href="home.jsp" class="back-home-button">← Back to Home</a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
