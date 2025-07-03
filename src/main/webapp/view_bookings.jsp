<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.halabo.util.DatabaseConnection" %>

<%
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>View Bookings - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	</head>
	<body>
	
		<jsp:include page="header.jsp"/>
		
		<div class="main-container">
		    <h2>All Bookings</h2>
		
		    <%
		        Connection conn = null;
		        PreparedStatement ps = null;
		        ResultSet rs = null;
		
		        try {
		            conn = DatabaseConnection.getConnection();
		
		            String query = "SELECT b.id, u.username, p.package_name, b.travel_date, b.number_of_travelers, " +
		                           "b.total_price, b.status, b.contact_name, b.contact_email, b.contact_phone, b.booking_date " +
		                           "FROM bookings b " +
		                           "JOIN users u ON b.user_id = u.id " +
		                           "JOIN packages p ON b.package_id = p.id " +
		                           "ORDER BY b.id ASC";
		
		            ps = conn.prepareStatement(query);
		            rs = ps.executeQuery();
		    %>
		
		    <table>
		        <thead>
		            <tr>
		                <th>ID</th>
		                <th>Username</th>
		                <th>Package</th>
		                <th>Travel Date</th>
		                <th>Travelers</th>
		                <th>Total Price</th>
		                <th>Status</th>
		                <th>Contact Name</th>
		                <th>Contact Email</th>
		                <th>Contact Phone</th>
		                <th>Booking Date</th>
		            </tr>
		        </thead>
		        <tbody>
		        <%
		            while (rs.next()) {
		        %>
		            <tr>
		                <td><%= rs.getInt("id") %></td>
		                <td><%= rs.getString("username") %></td>
		                <td><%= rs.getString("package_name") %></td>
		                <td><%= rs.getDate("travel_date") %></td>
		                <td><%= rs.getInt("number_of_travelers") %></td>
		                <td>RM <%= rs.getBigDecimal("total_price").setScale(2) %></td>
		                <td><%= rs.getString("status") %></td>
		                <td><%= rs.getString("contact_name") != null ? rs.getString("contact_name") : "-" %></td>
		                <td><%= rs.getString("contact_email") != null ? rs.getString("contact_email") : "-" %></td>
		                <td><%= rs.getString("contact_phone") != null ? rs.getString("contact_phone") : "-" %></td>
		                <td><%= rs.getTimestamp("booking_date") %></td>
		            </tr>
		        <%
		            }
		        %>
		        </tbody>
		    </table>
		
		    <%
		        } catch (SQLException e) {
		            out.println("<p style='color:red; text-align:center;'>Error fetching bookings: " + e.getMessage() + "</p>");
		        } finally {
		            if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
		            if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
		            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
		        }
		    %>
		
		    <a href="admin_dashboard.jsp" class="back-link">← Back to Admin Dashboard</a>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</body>
</html>
