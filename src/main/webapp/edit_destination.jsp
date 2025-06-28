<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.halabo.model.Destination" %> <%-- Import your Destination model --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Edit Destination - Admin</title>
	    <link rel="stylesheet" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        /* Reuse .form-container-admin styles from add_destination.jsp */
	    </style>
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	
	    <%
	        // Access control check
	        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
	        if (isAdmin == null || !isAdmin) {
	            response.sendRedirect("login.jsp?error=unauthorized");
	            return;
	        }
	
	        // Retrieve the Destination object from request attribute set by the servlet
	        Destination destinationToEdit = (Destination) request.getAttribute("destinationToEdit");
	        if (destinationToEdit == null) {
	            // If destinationToEdit is null, it means the ID was invalid or not found.
	            // Redirect back to the list with an error message.
	            response.sendRedirect("modifyDestination?message=Destination not found for editing.&messageType=error");
	            return;
	        }
	    %>
	
	    <div class="form-container-admin">
	        <h2>Edit Destination: <%= destinationToEdit.getName() %></h2>
	
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
	
	        <form action="modifyDestination" method="post">
	            <input type="hidden" name="action" value="update"> <%-- Hidden field to tell servlet it's an update --%>
	            <input type="hidden" name="id" value="<%= destinationToEdit.getId() %>">
	
	            <label for="destinationName">Destination Name:</label>
	            <input type="text" id="destinationName" name="destinationName" value="<%= destinationToEdit.getName() %>" required>
	
	            <label for="caption">Caption (Short Description):</label>
            <input type="text" id="caption" name="caption" value="<%= destinationToEdit.getCaption() != null ? destinationToEdit.getCaption() : "" %>">

            <label for="description">Full Description:</label>
            <textarea id="description" name="description" required><%= destinationToEdit.getDescription() != null ? destinationToEdit.getDescription() : "" %></textarea>

            <label for="imagePath">Image Path (e.g., /images/new_destination.jpg):</label>
            <input type="text" id="imagePath" name="imagePath" value="<%= destinationToEdit.getImagePath() != null ? destinationToEdit.getImagePath() : "" %>">
            <small style="display: block; margin-top: -15px; margin-bottom: 20px; color: #777;">
                Remember to upload the actual image file to your /images/ folder!
            </small>

            <button type="submit">Update Destination</button>
            <a href="modify_destination.jsp" class="back-link" style="display: block; text-align: center; margin-top: 15px; color: #d92662;">Back to List</a>
        </form>
    </div>

    <jsp:include page="footer.jsp"/>
</body>
</html>