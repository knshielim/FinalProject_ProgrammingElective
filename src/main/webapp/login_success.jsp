<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String userName = (String) session.getAttribute("name");
    if (userName == null) userName = "Guest";
%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Welcome</title>
	    <link rel="stylesheet" href="styles.css">
	</head>
	<body>
	    <div class="confirmation-container">
	        <h2>Welcome, <%= userName %>!</h2>
	        <p>You have successfully logged in.</p>
	        <a href="home.jsp" class="btn-primary">Go to Home</a>
	    </div>
	</body>
</html>
