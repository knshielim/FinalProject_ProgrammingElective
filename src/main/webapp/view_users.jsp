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
	    <title>View Users - Admin Panel</title>
	    <link rel="stylesheet" href="styles.css">
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            background: #f2f2f2;
	            margin: 0;
	        }
	        .main-container {
	            max-width: 1000px;
	            margin: 40px auto;
	            background-color: #fff;
	            padding: 25px;
	            border-radius: 10px;
	            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
	        }
	        h2 {
	            text-align: center;
	            color: #d92662;
	            margin-bottom: 25px;
	        }
	        table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-top: 10px;
	        }
	        th, td {
	            padding: 10px;
	            border: 1px solid #ddd;
	            text-align: center;
	        }
	        th {
	            background-color: #d92662;
	            color: white;
	        }
	        tr:nth-child(even) {
	            background-color: #fafafa;
	        }
	        .back-link {
	            text-align: center;
	            display: block;
	            margin-top: 20px;
	            color: #d92662;
	            text-decoration: none;
	            font-weight: bold;
	        }
	        .back-link:hover {
	            text-decoration: underline;
	        }
	    </style>
	</head>
	<body>
	
		<jsp:include page="header.jsp"/>
		
		<div class="main-container">
		    <h2>Registered Users</h2>
		
		    <%
		        Connection conn = null;
		        PreparedStatement ps = null;
		        ResultSet rs = null;
		
		        try {
		            conn = DatabaseConnection.getConnection();
		            ps = conn.prepareStatement("SELECT id, first_name, last_name, username, email, phone, created_at FROM users ORDER BY id ASC");
		            rs = ps.executeQuery();
		    %>
		
		    <table>
		        <thead>
		            <tr>
		                <th>ID</th>
		                <th>First Name</th>
		                <th>Last Name</th>
		                <th>Username</th>
		                <th>Email</th>
		                <th>Phone</th>
		                <th>Created At</th>
		            </tr>
		        </thead>
		        <tbody>
		        <%
		            while (rs.next()) {
		        %>
		            <tr>
		                <td><%= rs.getInt("id") %></td>
		                <td><%= rs.getString("first_name") %></td>
		                <td><%= rs.getString("last_name") %></td>
		                <td><%= rs.getString("username") %></td>
		                <td><%= rs.getString("email") %></td>
		                <td><%= rs.getString("phone") != null ? rs.getString("phone") : "-" %></td>
		                <td><%= rs.getTimestamp("created_at") %></td>
		            </tr>
		        <%
		            }
		        %>
		        </tbody>
		    </table>
		
		    <%
		        } catch (SQLException e) {
		            out.println("<p style='color:red; text-align:center;'>Error fetching users: " + e.getMessage() + "</p>");
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
