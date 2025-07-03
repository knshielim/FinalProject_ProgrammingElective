<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.halabo.model.Destination" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>

<%
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }

    Destination destinationToEdit = (Destination) request.getAttribute("destinationToEdit");
    if (destinationToEdit == null) {
        response.sendRedirect("modifyDestination?message=" + URLEncoder.encode("Destination not found.", StandardCharsets.UTF_8) + "&messageType=error");
        return;
    }

    String destinationName = destinationToEdit.getName();
    String caption = destinationToEdit.getCaption();
    String description = destinationToEdit.getDescription();
    String imagePath = destinationToEdit.getImagePath();
    String fullImageURL = request.getContextPath() + "/" + imagePath;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Destination - Halabo Indonesia Tour</title>
    <link rel="stylesheet" href="styles.css">
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

    <a href="modifyDestination" class="back-link">← Back to Destination List</a>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
