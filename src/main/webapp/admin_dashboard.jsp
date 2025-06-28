<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Admin Dashboard - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        .admin-dashboard {
	            max-width: 800px;
	            margin: 50px auto;
	            padding: 30px;
	            border-radius: 10px;
	            background-color: #f5f5f5;
	            box-shadow: 0 0 10px rgba(0,0,0,0.1);
	            text-align: center;
	        }
	
	        .admin-dashboard h1 {
	            color: #d92662;
	            margin-bottom: 30px;
	        }
	
	        .admin-options {
	            display: grid;
	            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	            gap: 20px;
	        }
	
	        .admin-options a {
	            display: block;
	            padding: 15px;
	            background-color: #d92662;
	            color: white;
	            text-decoration: none;
	            border-radius: 8px;
	            font-weight: bold;
	            transition: background-color 0.3s ease;
	        }
	
	        .admin-options a:hover {
	            background-color: #b71c4c;
	        }
	
	        .logout-btn {
	            margin-top: 30px;
	            display: inline-block;
	            background-color: #666;
	            color: #fff;
	            padding: 10px 20px;
	            text-decoration: none;
	            border-radius: 5px;
	        }
	
	        .logout-btn:hover {
	            background-color: #444;
	        }

            /* Styles for unauthorized access message */
            .unauthorized-message {
                max-width: 600px;
                margin: 100px auto;
                padding: 40px;
                background-color: #ffe0e0;
                border: 1px solid #ffb3b3;
                border-radius: 8px;
                text-align: center;
                color: #d92662;
                font-size: 1.2em;
                box-shadow: 0 0 10px rgba(0,0,0,0.05);
            }
            .unauthorized-message a {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #d92662;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            .unauthorized-message a:hover {
                background-color: #b71c4c;
            }
	    </style>
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	
        <%
            // Access control check: Only allow if isAdmin session attribute is true
            Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
            if (isAdmin != null && isAdmin) {
                // User is an admin, show the dashboard content
        %>
                <div class="admin-dashboard">
                    <h1>Welcome, Admin</h1>
        
                    <div class="admin-options">
                        <a href="add_destination.jsp">Add Destination</a>
                        <a href="modify_destination.jsp">Modify Destination</a>
                        <a href="add_package.jsp">Add Package</a>
                        <a href="modify_package.jsp">Modify Package</a>
                        <a href="view_users.jsp">View Users</a>
                        <a href="view_bookings.jsp">View Bookings</a>
                    </div>
        
                    <%-- The Logout button in the header handles logout for admin too, but a dedicated one here is fine --%>
                    <a href="login?action=logout" class="logout-btn">Logout from Admin Dashboard</a>
                </div>
        <%
            } else {
                // User is not an admin or not logged in, show unauthorized message
        %>
                <div class="unauthorized-message">
                    <h2>Access Denied!</h2>
                    <p>You do not have permission to view the Admin Dashboard. Please log in with an administrator account.</p>
                    <a href="login.jsp">Go to Login Page</a>
                </div>
        <%
            }
        %>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>