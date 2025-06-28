<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback - Halabo Indonesia Tour</title>
</head>
<body>
    <jsp:include page="header.jsp"/>

    <h2>Feedback Form</h2>

    <% if (request.getParameter("success") != null) { %>
        <p style="color: green;">Thank you for your feedback!</p>
    <% } else if (request.getParameter("error") != null) { %>
        <p style="color: red;">Something went wrong. Please try again.</p>
    <% } %>

    <form method="post" action="feedback">
        <label>Name:</label><br>
        <input type="text" name="name" required><br><br>

        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>

        <label>Feedback:</label><br>
        <textarea name="feedback" rows="5" cols="30" required></textarea><br><br>

        <input type="submit" value="Submit">
    </form>

    <jsp:include page="footer.jsp"/>
</body>
</html>