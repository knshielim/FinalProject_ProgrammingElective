<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Simple session check (you should implement proper login/auth check)
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Admin Dashboard - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	    <script src="admin.js" defer></script>
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	    
	    <div class="admin-container">
	        <h2>Admin Panel - Manage Destinations & Packages</h2>
	
	        <div class="admin-section">
	            <h3>Add New Package</h3>
	            <form id="add-form" method="post" action="AdminServlet?action=add">
	                <label>Destination:</label>
	                <input type="text" name="destination" required>
	
	                <label>Package Name:</label>
	                <input type="text" name="packageName" required>
	
	                <label>Description:</label>
	                <textarea name="description" required></textarea>
	
	                <label>Price:</label>
	                <input type="number" name="price" required>
	
	                <button type="submit">Add Package</button>
	            </form>
	        </div>
	
	        <div class="admin-section">
	            <h3>Existing Packages</h3>
	            <table id="package-table">
	                <thead>
	                    <tr>
	                        <th>Destination</th>
	                        <th>Package</th>
	                        <th>Description</th>
	                        <th>Price</th>
	                        <th>Actions</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <!-- Example row, dynamically generate with JSTL or servlet -->
	                    <tr>
	                        <td>Bali Island</td>
	                        <td>Beach Getaway</td>
	                        <td>Relaxing beachside tour</td>
	                        <td>1099</td>
	                        <td>
	                            <a href="AdminServlet?action=edit&id=1">Edit</a> |
	                            <a href="AdminServlet?action=delete&id=1" onclick="return confirm('Delete this package?')">Delete</a>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>
