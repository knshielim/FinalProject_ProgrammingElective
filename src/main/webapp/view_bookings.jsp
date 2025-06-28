<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.halabo.model.Booking" %> <%-- Import your Booking model --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>View Bookings - Admin</title>
	    <link rel="stylesheet" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        /* Reuse .admin-table-container, .admin-table etc., from previous admin JSPs */
	        /* If you moved them to styles.css, you don't need them here. */
	        .admin-table-container {
	            max-width: 1200px; /* Wider for more columns */
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
	            font-size: 0.9em; /* Slightly smaller font for more columns */
	        }
	        .admin-table th {
	            background-color: #d92662;
	            color: white;
	            font-weight: bold;
	        }
	        .admin-table tbody tr:nth-child(even) {
	            background-color: #f2f2f2;
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
	        <h2>All Bookings</h2>
	
	        <%-- Display messages if any --%>
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
	
	        <%-- Retrieve the list of bookings from the request attribute --%>
	        <%
	            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
	            if (bookings != null && !bookings.isEmpty()) {
	        %>
	                <table class="admin-table">
	                    <thead>
	                        <tr>
	                            <th>ID</th>
	                            <th>User</th>
	                            <th>Package</th>
	                            <th>Booking Date</th>
	                            <th>Travel Date</th>
	                            <th>Travelers</th>
	                            <th>Total Price</th>
	                            <th>Status</th>
	                            <th>Contact Name</th>
	                            <th>Contact Email</th>
	                            <th>Contact Phone</th>
	                            <%-- Optional: Special Requests --%>
	                            <%-- <th>Special Requests</th> --%>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <% for (Booking booking : bookings) { %>
	                            <tr>
	                                <td><%= booking.getId() %></td>
	                                <td><%= booking.getUsername() %></td>
	                                <td><%= booking.getPackageName() %></td>
	                                <td><%= booking.getBookingDate() %></td>
	                                <td><%= booking.getTravelDate() %></td>
	                                <td><%= booking.getNumberOfTravelers() %></td>
	                                <td><%= String.format("%,.2f", booking.getTotalPrice()) %></td> <%-- Format as currency --%>
	                                <td><%= booking.getStatus() %></td>
	                                <td><%= booking.getContactName() != null ? booking.getContactName() : "N/A" %></td>
	                                <td><%= booking.getContactEmail() != null ? booking.getContactEmail() : "N/A" %></td>
	                                <td><%= booking.getContactPhone() != null ? booking.getContactPhone() : "N/A" %></td>
	                                <%-- Optional: Special Requests --%>
	                                <%-- <td><%= booking.getSpecialRequests() != null ? booking.getSpecialRequests() : "" %></td> --%>
	                            </tr>
	                        <% } %>
	                    </tbody>
	                </table>
	        <%
	            } else {
	        %>
	                <p class="no-data-message">No bookings found.</p>
	        <%
	            }
	        %>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>