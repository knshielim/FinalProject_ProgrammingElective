<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Add New Destination - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	
	    <%
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