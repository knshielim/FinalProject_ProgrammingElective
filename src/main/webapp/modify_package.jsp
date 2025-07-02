<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, com.halabo.util.DatabaseConnection" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }

    // Handle delete if action=delete and id provided
    String action = request.getParameter("action");
    String deleteId = request.getParameter("id");
    if ("delete".equals(action) && deleteId != null) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM packages WHERE id = ?");
            ps.setInt(1, Integer.parseInt(deleteId));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("modify_package.jsp");
        return;
    }

    // Fetch all packages with destination name
    List<Map<String, String>> packages = new ArrayList<>();
    try (Connection conn = DatabaseConnection.getConnection()) {
        String sql = "SELECT p.id, p.package_name, p.image_path, d.destination_name FROM packages p JOIN destinations d ON p.destination_id = d.id ORDER BY p.id ASC";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("id", rs.getString("id"));
                row.put("name", rs.getString("package_name"));
                row.put("destination", rs.getString("destination_name"));
                row.put("image", rs.getString("image_path"));
                packages.add(row);
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error retrieving packages: " + e.getMessage() + "</p>");
    }

    request.setAttribute("packages", packages);
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Manage Packages - Admin</title>
	    <link rel="stylesheet" href="styles.css">
	    <style>
	        .admin-table-container {
	            max-width: 1000px;
	            margin: 50px auto;
	            padding: 20px;
	            background-color: #f9f9f9;
	            border-radius: 8px;
	        }
	        .admin-table-container h2 {
	            text-align: center;
	            color: #d92662;
	        }
	        .admin-table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-top: 20px;
	        }
	        .admin-table th, .admin-table td {
	            border: 1px solid #ddd;
	            padding: 10px;
	        }
	        .admin-table th {
	            background-color: #d92662;
	            color: white;
	        }
	        .admin-table tbody tr:nth-child(even) {
	            background-color: #f2f2f2;
	        }
	        .admin-table img {
	            max-width: 80px;
	            height: auto;
	        }
	        .actions a {
	            padding: 5px 10px;
	            margin-right: 5px;
	            text-decoration: none;
	            color: white;
	            border-radius: 5px;
	        }
	        .edit-btn {
	            background-color: #007bff;
	        }
	        .edit-btn:hover {
	            background-color: #0056b3;
	        }
	        .delete-btn {
	            background-color: #dc3545;
	        }
	        .delete-btn:hover {
	            background-color: #c82333;
	        }
	    </style>
	</head>
	<body>
	
		<jsp:include page="header.jsp"/>
		
		<div class="admin-table-container">
		    <h2>Manage Tour Packages</h2>
		    <table class="admin-table">
		        <thead>
		            <tr>
		                <th>ID</th>
		                <th>Package Name</th>
		                <th>Destination</th>
		                <th>Image</th>
		                <th>Actions</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="pkg" items="${packages}">
		                <tr>
		                    <td><c:out value="${pkg.id}"/></td>
		                    <td><c:out value="${pkg.name}"/></td>
		                    <td><c:out value="${pkg.destination}"/></td>
		                    <td>
		                        <c:choose>
		                            <c:when test="${not empty pkg.image}">
		                                <img src="${pageContext.request.contextPath}/${pkg.image}" alt="${pkg.name}" onerror="this.style.display='none'; this.nextElementSibling.style.display='inline';" />
		                                <span style="display:none;">Image not found</span>
		                            </c:when>
		                            <c:otherwise>No image</c:otherwise>
		                        </c:choose>
		                    </td>
		                    <td class="actions">
		                        <a class="edit-btn" href="edit_package.jsp?package_id=${pkg.id}">Edit</a>
		                        <a class="delete-btn" href="modify_package.jsp?action=delete&id=${pkg.id}" onclick="return confirm('Are you sure you want to delete this package?');">Delete</a>
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</body>
</html>
