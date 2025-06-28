<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>View Users - Admin Panel</title>
	    <link rel="stylesheet" href="css/style.css"> <%-- Adjust path to your CSS --%>
	    <style>
	        /* Add some basic styling for the table if not in style.css */
	        body { font-family: Arial, sans-serif; margin: 20px; }
	        .container { max-width: 900px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
	        h1 { text-align: center; color: #333; }
	        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
	        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
	        th { background-color: #f2f2f2; }
	        .message { padding: 10px; margin-bottom: 15px; border-radius: 5px; }
	        .message.success { background-color: #d4edda; color: #155724; border-color: #c3e6cb; }
	        .message.error { background-color: #f8d7da; color: #721c24; border-color: #f5c6cb; }
	        .back-link { display: block; text-align: center; margin-top: 20px; }
	    </style>
	</head>
	<body>
	    <div class="container">
	        <h1>Registered Users</h1>
	
	        <%-- Display messages --%>
	        <c:if test="${not empty requestScope.message}">
	            <div class="message ${requestScope.messageType}">${requestScope.message}</div>
	        </c:if>
	
	        <c:choose>
	            <c:when test="${not empty users}">
	                <table>
	                    <thead>
	                        <tr>
	                            <th>ID</th>
	                            <th>First Name</th>
	                            <th>Last Name</th>
	                            <th>Username</th>
	                            <th>Email</th>
	                            <th>Phone</th>
	                            <th>Admin</th> <%-- Now displaying isAdmin status --%>
	                            <%-- Add actions here like Edit/Delete if you implement them for users --%>
	                            </tr>
	                    </thead>
	                    <tbody>
	                        <c:forEach var="user" items="${users}">
	                            <tr>
	                                <td><c:out value="${user.id}"/></td>
	                                <td><c:out value="${user.firstName}"/></td>
	                                <td><c:out value="${user.lastName}"/></td>
	                                <td><c:out value="${user.username}"/></td>
	                                <td><c:out value="${user.email}"/></td>
	                                <td><c:out value="${user.phone}"/></td>
	                                <td>
	                                    <c:choose>
	                                        <c:when test="${user.isAdmin()}">Yes</c:when>
	                                        <c:otherwise>No</c:otherwise>
	                                    </c:choose>
	                                </td>
	                                <%-- Example of actions if needed --%>
	                                </tr>
	                        </c:forEach>
	                    </tbody>
	                </table>
	            </c:when>
	            <c:otherwise>
	                <p>No users found.</p>
	            </c:otherwise>
	        </c:choose>
	
	        <p class="back-link"><a href="adminDashboard.jsp">Back to Admin Dashboard</a></p>
	    </div>
	</body>
</html>