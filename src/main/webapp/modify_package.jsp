<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Modify Packages - Admin Panel</title>
	    <link rel="stylesheet" href="css/style.css"> <%-- Adjust path to your CSS --%>
	    <style>
	        /* Add some basic styling for the table if not in style.css */
	        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
	        .container { max-width: 1200px; margin: 0 auto; padding: 25px; background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
	        h1 { text-align: center; color: #333; margin-bottom: 25px; }
	        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
	        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; vertical-align: top; }
	        th { background-color: #f2f2f2; }
	        .action-links a { margin-right: 10px; text-decoration: none; color: #007bff; }
	        .action-links a:hover { text-decoration: underline; }
	        .action-links .delete { color: #dc3545; }
	        .action-links .delete:hover { color: #c82333; }
	        .add-button-container { text-align: right; margin-bottom: 20px; }
	        .add-button {
	            background-color: #28a745;
	            color: white;
	            padding: 10px 20px;
	            border: none;
	            border-radius: 5px;
	            text-decoration: none;
	            font-size: 16px;
	            transition: background-color 0.3s ease;
	        }
	        .add-button:hover { background-color: #218838; }
	        .message { padding: 10px; margin-bottom: 15px; border-radius: 5px; }
	        .message.success { background-color: #d4edda; color: #155724; border-color: #c3e6cb; }
	        .message.error { background-color: #f8d7da; color: #721c24; border-color: #f5c6cb; }
	        .back-link { display: block; text-align: center; margin-top: 20px; }
	    </style>
	</head>
	<body>
	    <div class="container">
	        <h1>Modify Packages</h1>
	
	        <%-- Display messages from URL parameters (after redirect) --%>
	        <c:if test="${not empty param.message}">
	            <div class="message ${param.messageType}">${param.message}</div>
	        </c:if>
	        <%-- Display messages from request attributes (after forward from doGet) --%>
	        <c:if test="${not empty requestScope.message}">
	            <div class="message ${requestScope.messageType}">${requestScope.message}</div>
	        </c:if>
	
	        <div class="add-button-container">
	            <a href="addPackage.jsp" class="add-button">Add New Package</a> <%-- Assuming you have an addPackage.jsp --%>
	        </div>
	
	        <c:choose>
	            <c:when test="${not empty packages}">
	                <table>
	                    <thead>
	                        <tr>
	                            <th>ID</th>
	                            <th>Package Name</th>
	                            <th>Destination</th>
	                            <th>Price</th>
	                            <th>Duration</th>
	                            <th>Tour Type</th>
	                            <th>Actions</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <c:forEach var="pkg" items="${packages}">
	                            <tr>
	                                <td><c:out value="${pkg.id}"/></td>
	                                <td><c:out value="${pkg.packageName}"/></td>
	                                <td><c:out value="${pkg.destinationName}"/></td> <%-- Using destinationName from Package model --%>
	                                <td><c:out value="${pkg.price}"/></td>
	                                <td><c:out value="${pkg.duration}"/></td>
	                                <td><c:out value="${pkg.tourType}"/></td>
	                                <td class="action-links">
	                                    <a href="modifyPackage?action=edit&id=${pkg.id}">Edit</a> |
	                                    <a href="modifyPackage?action=delete&id=${pkg.id}" class="delete" onclick="return confirm('Are you sure you want to delete package: ${pkg.packageName}?');">Delete</a>
	                                </td>
	                            </tr>
	                        </c:forEach>
	                    </tbody>
	                </table>
	            </c:when>
	            <c:otherwise>
	                <p>No packages found.</p>
	            </c:otherwise>
	        </c:choose>
	
	        <p class="back-link"><a href="adminDashboard.jsp">Back to Admin Dashboard</a></p>
	    </div>
	</body>
</html>