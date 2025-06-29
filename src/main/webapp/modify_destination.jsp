<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.halabo.model.Destination" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Destinations - Admin</title>
        <link rel="stylesheet" href="styles.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            /* Shared admin dashboard styles are assumed from styles.css */
            .admin-table-container {
                max-width: 1000px;
                margin: 50px auto;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }
            .admin-table-container h2 {
                text-align: center;
                color: #d92662;
                margin-bottom: 30px;
            }
            .admin-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            .admin-table th, .admin-table td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
                vertical-align: top;
            }
            .admin-table th {
                background-color: #d92662;
                color: white;
                font-weight: bold;
            }
            .admin-table tbody tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            .admin-table .actions {
                white-space: nowrap; /* Prevent buttons from wrapping */
            }
            .admin-table .actions a {
                display: inline-block;
                padding: 5px 10px;
                margin-right: 5px;
                border-radius: 5px;
                text-decoration: none;
                color: white;
                font-size: 0.9em;
            }
            .admin-table .actions .edit-btn {
                background-color: #007bff;
            }
            .admin-table .actions .edit-btn:hover {
                background-color: #0056b3;
            }
            .admin-table .actions .delete-btn {
                background-color: #dc3545;
            }
            .admin-table .actions .delete-btn:hover {
                background-color: #c82333;
            }
            .admin-table img {
                max-width: 80px;
                height: auto;
                border-radius: 4px;
            }
            .no-data-message {
                text-align: center;
                padding: 20px;
                color: #777;
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
        %>

        <div class="admin-table-container">
            <h2>Manage Destinations</h2>

            <%-- Display success or error messages from Update/Delete operations --%>
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

            <%-- Retrieve the list of destinations from the request attribute --%>
            <%
                List<Destination> destinations = (List<Destination>) request.getAttribute("destinations");
                if (destinations != null && !destinations.isEmpty()) {
            %>
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Caption</th>
                                <th>Image</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Destination dest : destinations) { %>
                                <tr>
                                    <td><%= dest.getId() %></td>
                                    <td><%= dest.getName() %></td>
                                    <td><%= dest.getCaption() %></td>
                                    <td>
                                        <%-- Use imagePath directly from the model --%>
                                        <% if (dest.getImagePath() != null && !dest.getImagePath().isEmpty()) { %>
                                            <img src="<%= request.getContextPath() %><%= dest.getImagePath() %>" alt="<%= dest.getName() %>" style="max-width: 80px;">
                                        <% } else { %>
                                            No Image
                                        <% } %>
                                    </td>
                                    <td class="actions">
                                        <a href="modifyDestination?action=edit&id=<%= dest.getId() %>" class="edit-btn">Edit</a>
                                        <a href="modifyDestination?action=delete&id=<%= dest.getId() %>" class="delete-btn" onclick="return confirm('Are you sure you want to delete <%= dest.getName() %>? This cannot be undone.');">Delete</a>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
            <%
                } else {
            %>
                    <p class="no-data-message">No destinations found. <a href="add_destination.jsp">Add one now!</a></p>
            <%
                }
            %>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>