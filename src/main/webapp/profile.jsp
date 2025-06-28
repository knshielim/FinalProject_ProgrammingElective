<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import="java.io.File" %>

<%
    String fullName = (String) session.getAttribute("name");
    if (fullName == null) {
        String first = (String) session.getAttribute("firstName");
        String last = (String) session.getAttribute("lastName");
        fullName = (first != null ? first : "") + " " + (last != null ? last : "");
    }

    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("phone");

    // Profile image path
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
	    <style>
	        .profile-container {
	            max-width: 600px;
	            margin: 30px auto;
	            padding: 25px;
	            background: #fff;
	            border-radius: 10px;
	            box-shadow: 0 0 12px rgba(0,0,0,0.1);
	        }
	        .profile-image {
	            width: 150px;
	            height: 150px;
	            border-radius: 50%;
	            object-fit: cover;
	            border: 2px solid #d92662;
	            margin-bottom: 15px;
	        }
	        .form-group {
	            margin-bottom: 1rem;
	        }
	        .form-group label {
	            font-weight: bold;
	        }
	    </style>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		
		<div class="profile-container">
		    <h2 style="color: #d92662;">User Profile</h2>
		
		    <!-- Profile image section -->
		    <div style="text-align: center;">
		        <img src="GetProfileImageServlet?username=<%= username %>" class="profile-image" alt="Profile Image"
     				onerror="this.onerror=null; this.src='images/default_profile.png';">
		    </div>
		
		    <!-- Upload new profile image -->
		    <form action="UploadProfileImageServlet" method="post" enctype="multipart/form-data" style="margin-top: 1rem; text-align: center;">
		        <input type="file" name="profileImage" accept="image/*" required>
		        <input type="hidden" name="username" value="<%= username %>">
		        <button type="submit" style="margin-top: 10px;">Upload New Image</button>
		    </form>
		
		    <hr style="margin: 30px 0;">
		
		    <!-- User Information -->
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
