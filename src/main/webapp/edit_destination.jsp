<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.halabo.model.Destination" %>
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
            .form-container-admin {
                max-width: 600px;
                margin: 50px auto;
                padding: 30px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
            }
            .form-container-admin h2 {
                text-align: center;
                color: #d92662;
                margin-bottom: 25px;
            }
            .form-container-admin label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #555;
            }
            .form-container-admin input[type="text"],
            .form-container-admin textarea {
                width: calc(100% - 22px); /* Account for padding and border */
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 1em;
            }
            .form-container-admin textarea {
                resize: vertical;
                min-height: 100px;
            }
            .form-container-admin button[type="submit"] {
                display: block;
                width: 100%;
                padding: 12px;
                background-color: #d92662;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 1.1em;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .form-container-admin button[type="submit"]:hover {
                background-color: #b31f51;
            }
            .form-message {
                margin-bottom: 15px;
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
            .back-link {
                color: #d92662 !important;
                text-decoration: none;
                font-weight: bold;
            }
            .back-link:hover {
                text-decoration: underline;
            }
            /* Style for image preview */
            .image-preview {
                max-width: 200px; /* Adjust as needed */
                height: auto;
                display: block;
                margin: 10px auto 20px auto;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
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

            Destination destinationToEdit = (Destination) request.getAttribute("destinationToEdit");
            if (destinationToEdit == null) {
                response.sendRedirect("modifyDestination?message=" + URLEncoder.encode("Destination not found for editing.", StandardCharsets.UTF_8) + "&messageType=error");
                return;
            }
        %>

        <div class="form-container-admin">
            <h2>Edit Destination: <%= destinationToEdit.getName() %></h2>

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

            <form action="modifyDestination" method="post" enctype="multipart/form-data"> <%-- IMPORTANT: enctype for file upload --%>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= destinationToEdit.getId() %>">
                <%-- Send current image path as a hidden field, so we know what to use if no new file is uploaded --%>
                <input type="hidden" name="currentImagePath" value="<%= destinationToEdit.getImagePath() != null ? destinationToEdit.getImagePath() : "" %>">

                <label for="destinationName">Destination Name:</label>
                <input type="text" id="destinationName" name="destinationName" value="<%= destinationToEdit.getName() %>" required>

                <label for="caption">Caption (Short Description):</label>
                <input type="text" id="caption" name="caption" value="<%= destinationToEdit.getCaption() != null ? destinationToEdit.getCaption() : "" %>">

                <label for="description">Full Description:</label>
                <textarea id="description" name="description" required><%= destinationToEdit.getDescription() != null ? destinationToEdit.getDescription() : "" %></textarea>

                <label>Current Image:</label>
                <% if (destinationToEdit.getImageData() != null && destinationToEdit.getImageData().length > 0) { %>
                    <img src="<%= request.getContextPath() %>/getDestinationImage?id=<%= destinationToEdit.getId() %>" alt="<%= destinationToEdit.getName() %>" class="image-preview">
                <% } else { %>
                    <p style="text-align: center; color: #777; margin-bottom: 20px;">No current image available.</p>
                <% } %>

                <label for="newImageFile">Upload New Image (optional):</label>
                <input type="file" id="newImageFile" name="newImageFile" accept="image/*">
                <small style="display: block; margin-top: 5px; margin-bottom: 20px; color: #777;">
                    Choose a new file (JPEG, PNG, GIF) to update the destination image.
                </small>

                <button type="submit">Update Destination</button>
                <a href="modify_destination.jsp" class="back-link" style="display: block; text-align: center; margin-top: 15px;">Back to List</a>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>