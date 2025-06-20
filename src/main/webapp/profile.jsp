<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    String name = (String) sessionObj.getAttribute("name");
    String email = (String) sessionObj.getAttribute("email");
    String phone = (String) sessionObj.getAttribute("phone");
    String destination = (String) sessionObj.getAttribute("destination");
    String pkg = (String) sessionObj.getAttribute("package");
    String travelers = (String) sessionObj.getAttribute("travelers");
    String date = (String) sessionObj.getAttribute("date");
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>User Profile</title>
	    <link rel="stylesheet" href="styles.css">
	    <style>
	        .profile-container {
	            max-width: 600px;
	            margin: 3rem auto;
	            padding: 2rem;
	            border: 1px solid #ccc;
	            border-radius: 10px;
	            background-color: #f9f9f9;
	        }
	
	        .profile-container h2 {
	            text-align: center;
	            margin-bottom: 2rem;
	        }
	
	        .profile-info p {
	            font-size: 1rem;
	            padding: 6px 0;
	        }
	    </style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
	    <div class="profile-container">
	        <h2>User Profile</h2>
	        <div class="profile-info">
	            <p><strong>Name:</strong> <%= name %></p>
	            <p><strong>Email:</strong> <%= email %></p>
	            <p><strong>Phone:</strong> <%= phone %></p>
	            <p><strong>Destination:</strong> <%= destination %></p>
	            <p><strong>Package:</strong> <%= pkg %></p>
	            <p><strong>Travelers:</strong> <%= travelers %></p>
	            <p><strong>Travel Date:</strong> <%= date %></p>
	        </div>
	    </div>
	    
	    <jsp:include page="footer.jsp"/>
	</body>
</html>
