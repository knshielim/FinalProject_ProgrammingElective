<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Add New Destination - Admin</title>
	    <link rel="stylesheet" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        /* Existing admin dashboard styles apply, but here are specific form styles */
	        .form-container-admin {
	            max-width: 700px;
	            margin: 50px auto;
	            padding: 30px;
	            background-color: #f9f9f9;
	            border-radius: 8px;
	            box-shadow: 0 0 15px rgba(0,0,0,0.1);
	        }
	        .form-container-admin h2 {
	            text-align: center;
	            color: #d92662;
	            margin-bottom: 30px;
	        }
	        .form-container-admin label {
	            display: block;
	            margin-bottom: 8px;
	            font-weight: bold;
	            color: #555;
	        }
	        .form-container-admin input[type="text"],
	        .form-container-admin textarea,
	        .form-container-admin input[type="file"] { /* Added input[type="file"] */
	            width: calc(100% - 20px);
	            padding: 10px;
	            margin-bottom: 20px;
	            border: 1px solid #ccc;
	            border-radius: 5px;
	            font-size: 1em;
	            box-sizing: border-box;
	        }
	        .form-container-admin textarea {
	            min-height: 120px;
	            resize: vertical;
	        }
	        .form-container-admin button[type="submit"] {
	            display: block;
	            width: 100%;
	            padding: 12px;
	            background-color: #28a745; /* Green for submit */
	            color: white;
	            border: none;
	            border-radius: 5px;
	            font-size: 1.1em;
	            cursor: pointer;
	            transition: background-color 0.3s ease;
	        }
	        .form-container-admin button[type="submit"]:hover {
	            background-color: #218838;
	        }
	        .form-message {
	            margin-top: 15px;
	            padding: 10px;
	            border-radius: 5px;
	            font-weight: bold;
	            text-align: center;
	        }
	        .form-message.success {
	            background-color: #d4edda;
	            color: #155724;
	            border: 1px solid #c3e6cb;
	        }
	        .form-message.error {
	            background-color: #f8d7da;
	            color: #721c24;
	            border: 1px solid #f5c6cb;
	        }
	    </style>
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	
	    <%
	        // Basic access control for this specific page (good practice for all admin JSPs)
	        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
	        if (isAdmin == null || !isAdmin) {
	            response.sendRedirect("login.jsp?error=unauthorized");
	            return; // Stop further processing of the JSP
	        }
	    %>
	
	    <div class="form-container-admin">
	        <h2>Add New Destination</h2>
	
	        <%-- Display success or error messages --%>
	        <%
	            String message = (String) request.getAttribute("message");
	            String messageType = (String) request.getAttribute("messageType");
	            if (message != null) {
	        %>
	            <div class="form-message <%= messageType %>">
	                <%= message %>
	            </div>
	        <%
	            }
	        %>
	
	        <form action="AddDestinationServlet" method="post" enctype="multipart/form-data">
	            <label for="destinationName">Destination Name:</label>
	            <input type="text" id="destinationName" name="destinationName" required>
	
	            <label for="caption">Caption (Short Description):</label>
	            <input type="text" id="caption" name="caption">
	
	            <label for="description">Full Description:</label>
	            <textarea id="description" name="description" required></textarea>
	
	            <label for="imageFile">Upload Image:</label>
	            <input type="file" id="imageFile" name="imageFile" accept="image/*" required>
	            <small style="display: block; margin-top: -15px; margin-bottom: 20px; color: #777;">
	                Please upload the image file (e.g., JPG, PNG).
	            </small>
	
	            <button type="submit">Add Destination</button>
	        </form>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>