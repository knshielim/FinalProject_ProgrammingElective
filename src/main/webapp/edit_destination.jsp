<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.halabo.model.Destination" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>

<%
    // Check if user is an admin
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }

    // Get destination object from request
    Destination destinationToEdit = (Destination) request.getAttribute("destinationToEdit");
    if (destinationToEdit == null) {
        response.sendRedirect("modifyDestination?message=" + URLEncoder.encode("Destination not found.", StandardCharsets.UTF_8) + "&messageType=error");
        return;
    }

    String destinationName = destinationToEdit.getName();
    String caption = destinationToEdit.getCaption();
    String description = destinationToEdit.getDescription();
    String imagePath = destinationToEdit.getImagePath(); // Should be like "images/bali.jpg"
    String fullImageURL = request.getContextPath() + "/" + imagePath;
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Edit Destination - Admin</title>
	    <link rel="stylesheet" href="styles.css">
	    <style>
	        .form-container-admin {
	            max-width: 700px;
	            margin: 50px auto;
	            background: #fff;
	            padding: 30px;
	            border-radius: 10px;
	            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
	        }
	        .form-container-admin h2 {
	            text-align: center;
	            color: #d92662;
	        }
	        .form-container-admin label {
	            display: block;
	            margin-top: 15px;
	            font-weight: bold;
	        }
	        .form-container-admin input[type="text"],
	        .form-container-admin textarea,
	        .form-container-admin input[type="file"] {
	            width: 100%;
	            padding: 10px;
	            margin-top: 6px;
	            box-sizing: border-box;
	            border: 1px solid #ccc;
	            border-radius: 5px;
	        }
	        .form-container-admin textarea {
	            min-height: 100px;
	            resize: vertical;
	        }
	        .form-container-admin button {
	            margin-top: 20px;
	            padding: 12px 20px;
	            width: 100%;
	            background-color: #d92662;
	            color: white;
	            border: none;
	            border-radius: 5px;
	            font-size: 1.1em;
	            cursor: pointer;
	        }
	        .form-container-admin button:hover {
	            background-color: #b31f51;
	        }
	        .form-message {
	            margin: 15px 0;
	            padding: 10px;
	            font-weight: bold;
	            text-align: center;
	            border-radius: 5px;
	        }
	        .form-message.success {
	            background-color: #d4edda;
	            color: #155724;
	        }
	        .form-message.error {
	            background-color: #f8d7da;
	            color: #721c24;
	        }
	        .image-preview {
	            display: block;
	            max-width: 100%;
	            max-height: 300px;
	            margin: 15px auto;
	            border-radius: 6px;
	            border: 1px solid #ddd;
	        }
	        .back-link {
	            display: block;
	            text-align: center;
	            margin-top: 15px;
	            text-decoration: none;
	            color: #d92662;
	        }
	        .back-link:hover {
	            text-decoration: underline;
	        }
	    </style>
	</head>
	<body>
	
		<jsp:include page="header.jsp"/>
		
		<div class="form-container-admin">
		    <h2>Edit Destination: <%= destinationName %></h2>
		
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
		
		    <form action="modifyDestination" method="post" enctype="multipart/form-data">
		        <input type="hidden" name="action" value="update">
		        <input type="hidden" name="id" value="<%= destinationToEdit.getId() %>">
		
		        <label for="destinationName">Destination Name:</label>
		        <input type="text" id="destinationName" name="destinationName" value="<%= destinationName %>" required>
		
		        <label for="caption">Caption (Short Description):</label>
		        <input type="text" id="caption" name="caption" value="<%= caption != null ? caption : "" %>">
		
		        <label for="description">Full Description:</label>
		        <textarea id="description" name="description" required><%= description != null ? description : "" %></textarea>
		
		        <label>Current Image:</label>
		        <img src="<%= fullImageURL %>" alt="Image of <%= destinationName %>" class="image-preview"
		             onerror="this.style.display='none'; this.nextElementSibling.style.display='inline';" />
		        <span style="display:none;">Image not found</span>
		
		        <label for="newImageFile">Upload New Image (optional):</label>
		        <input type="file" id="newImageFile" name="newImageFile" accept="image/*">
		
		        <button type="submit">Update Destination</button>
		    </form>
		
		    <a href="modifyDestination" class="back-link">Back to Destination List</a>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</body>
</html>
