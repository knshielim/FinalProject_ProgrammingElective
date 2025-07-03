<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import="java.io.File" %>
<%@ page import="com.halabo.model.User" %> <%-- Import your User model class --%>

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
        <link rel="stylesheet" type="text/css" href="styles.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="profile-container">
            <h2 style="color: #d92662;">User Profile</h2>

            <div style="text-align: center;">
                <img src="GetProfileImageServlet?username=<%= username %>" class="profile-image" alt="Profile Image"
                     onerror="this.onerror=null; this.src='images/default_profile.png';">
            </div>

            <form action="UploadProfileImageServlet" method="post" enctype="multipart/form-data" style="margin-top: 1rem; text-align: center;">
                <input type="file" name="profileImage" accept="image/*" required>
                <input type="hidden" name="username" value="<%= username %>">
                <button type="submit" style="margin-top: 10px;">Upload New Image</button>
            </form>

            <hr style="margin: 30px 0;">

            <div class="form-group">
                <label>Full Name:</label>
                <p><%= fullName %></p>
            </div>
            <div class="form-group">
                <label>Username:</label>
                <p><%= username %></p>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <p><%= email %></p>
            </div>
            <div class="form-group">
                <label>Phone Number:</label>
                <p><%= phone %></p>
            </div>

            <div style="text-align: center; margin-top: 20px;">
                <a href="home.jsp" class="btn">← Back to Home</a>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
    </body>
</html>