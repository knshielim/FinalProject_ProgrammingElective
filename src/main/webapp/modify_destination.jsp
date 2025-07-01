<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, com.halabo.model.Destination, com.halabo.util.DatabaseConnection" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    List<Destination> destinations = new ArrayList<>();
    try (Connection conn = DatabaseConnection.getConnection()) {
    	String sql = "SELECT id, destination_name, caption, description, image_path FROM destinations ORDER BY id ASC";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Destination dest = new Destination(
                    rs.getInt("id"),
                    rs.getString("destination_name"),
                    rs.getString("caption"),
                    rs.getString("description"),
                    rs.getString("image_path")
                );
                destinations.add(dest);
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error retrieving destinations: " + e.getMessage() + "</p>");
        e.printStackTrace();
    }

    request.setAttribute("destinations", destinations);
%>

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
            .add-destination-btn {
                display: inline-block;
                background-color: #28a745;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                margin-bottom: 20px;
            }
            .add-destination-btn:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
    	<pre>
		    Destinations object: ${destinations}
		</pre>
		<c:out value="${destinations}" default="destinations is NULL or empty"/>
		
    	
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

            <!-- Add new destination button -->
            <a href="add_destination.jsp" class="add-destination-btn">Add New Destination</a>

            <!-- Display success or error messages from Update/Delete operations -->
            <c:if test="${not empty message}">
                <div class="form-message ${messageType}">
                    <c:out value="${message}" escapeXml="true"/>
                </div>
            </c:if>

            <!-- Display destinations table -->
            <c:choose>
                <c:when test="${not empty destinations}">
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
                            <c:forEach var="dest" items="${destinations}">
                                <tr>
                                    <td><c:out value="${dest.id}"/></td>
                                    <td><c:out value="${dest.name}"/></td>
                                    <td><c:out value="${dest.caption}"/></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty dest.imagePath}">
                                                <img src="${pageContext.request.contextPath}<c:out value='${dest.imagePath}'/>" 
                                                     alt="<c:out value='${dest.name}'/>" 
                                                     style="max-width: 80px;"
                                                     onerror="this.style.display='none'; this.nextElementSibling.style.display='inline';">
                                                <span style="display:none;">Image not found</span>
                                            </c:when>
                                            <c:otherwise>
                                                No Image
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="actions">
                                        <a href="modifyDestination?action=edit&id=<c:out value='${dest.id}'/>" class="edit-btn">Edit</a>
                                        <a href="modifyDestination?action=delete&id=<c:out value='${dest.id}'/>" 
                                           class="delete-btn" 
                                           onclick="return confirm('Are you sure you want to delete \'<c:out value='${dest.name}' escapeXml='true'/>\'? This cannot be undone.');">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p class="no-data-message">No destinations found. <a href="add_destination.jsp">Add one now!</a></p>
                </c:otherwise>
            </c:choose>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>