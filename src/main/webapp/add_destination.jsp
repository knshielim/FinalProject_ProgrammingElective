<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Add Destination - Halabo Indonesia Tour Admin</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        .admin-form-container {
	            max-width: 600px;
	            margin: 40px auto;
	            padding: 30px;
	            background-color: #fefefe;
	            border-radius: 10px;
	            box-shadow: 0 0 8px rgba(0,0,0,0.1);
	        }
	
	        .admin-form-container h2 {
	            color: #d92662;
	            text-align: center;
	            margin-bottom: 25px;
	        }
	
	        .admin-form-container label {
	            font-weight: bold;
	            display: block;
	            margin: 15px 0 5px;
	        }
	
	        .admin-form-container input,
	        .admin-form-container textarea {
	            width: 100%;
	            padding: 10px;
	            border: 1px solid #aaa;
	            border-radius: 5px;
	            font-size: 16px;
	        }
	
	        .admin-form-container button {
	            margin-top: 20px;
	            width: 100%;
	            background-color: #d92662;
	            color: white;
	            border: none;
	            padding: 12px;
	            font-size: 16px;
	            border-radius: 5px;
	            cursor: pointer;
	        }
	
	        .admin-form-container button:hover {
	            background-color: #b71c4c;
	        }
	
	        .admin-form-container .message {
	            text-align: center;
	            margin-top: 20px;
	            font-weight: bold;
	        }
	
	        .success {
	            color: green;
	        }
	
	        .error {
	            color: red;
	        }
	    </style>
	</head>
	<body>
	
	    <jsp:include page="header.jsp"/>
	
	    <div class="admin-form-container">
	        <h2>Add New Destination</h2>
	
	        <form action="${pageContext.request.contextPath}/AddDestinationServlet" method="post">
	            <label for="name">Destination Name:</label>
	            <input type="text" id="name" name="name" required>
	
	            <label for="location">Location:</label>
	            <input type="text" id="location" name="location" required>
	
	            <label for="description">Description:</label>
	            <textarea id="description" name="description" rows="5" required></textarea>
	
	            <button type="submit">Add Destination</button>
	        </form>
	
	        <%-- Optional success/failure message --%>
	        <%
	            String status = request.getParameter("status");
	            if ("success".equals(status)) {
	        %>
	            <div class="message success">Destination added successfully!</div>
	        <%
	            } else if ("error".equals(status)) {
	        %>
	            <div class="message error">Failed to add destination. Please try again.</div>
	        <%
	            }
	        %>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>
