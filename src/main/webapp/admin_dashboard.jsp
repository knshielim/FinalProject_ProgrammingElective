<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	    </style>
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	
	    <div class="admin-dashboard">
	        <h1>Welcome, Admin</h1>
	
	        <div class="admin-options">
	            <a href="add_destination.jsp">Add Destination</a>
	            <a href="manage_destinations.jsp">Modify Destination</a>
	            <a href="add_package.jsp">Add Package</a>
	            <a href="manage_packages.jsp">Modify Package</a>
	        </div>
	
	        <a href="logout.jsp" class="logout-btn">Logout</a>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>
