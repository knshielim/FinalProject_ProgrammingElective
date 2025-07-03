<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback - Halabo Indonesia Tour</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="feedback-container">
    <h2>We'd Love Your Feedback</h2>

    <% if (request.getParameter("success") != null) { %>
        <div class="feedback-message success" id="feedback-success">Thank you for your feedback!</div>
    <% } else if (request.getParameter("error") != null) { %>
        <div class="feedback-message error">Something went wrong. Please try again.</div>
    <% } %>

    <form method="post" action="feedback" id="feedbackForm" class="feedback-form">

        <div class="feedback-form-group">
            <label for="name">Name</label>
            <input type="text" class="feedback-input" id="name" name="name" required>
        </div>

        <div class="feedback-form-group">
            <label for="email">Email</label>
            <input type="email" class="feedback-input" id="email" name="email" required>
        </div>

        <div class="feedback-form-group">
            <label for="feedback">Feedback</label>
            <textarea id="feedback" class="feedback-textarea" name="feedback" rows="4" required></textarea>
        </div>

        <div class="feedback-form-group">
            <label style="text-align: center;">How would you rate your experience?</label>
            <div class="feedback-rating">
                <input type="radio" id="star5" name="rating" value="5"><label for="star5">&#9733;</label>
                <input type="radio" id="star4" name="rating" value="4"><label for="star4">&#9733;</label>
                <input type="radio" id="star3" name="rating" value="3"><label for="star3">&#9733;</label>
                <input type="radio" id="star2" name="rating" value="2"><label for="star2">&#9733;</label>
                <input type="radio" id="star1" name="rating" value="1"><label for="star1">&#9733;</label>
            </div>
        </div>

        <button type="submit" class="feedback-submit">Submit</button>
    </form>
</div>

<jsp:include page="footer.jsp"/>

<!-- Auto-clear form after successful submission -->
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const successMessage = document.getElementById("feedback-success");
        const form = document.getElementById("feedbackForm");

        if (successMessage) {
            setTimeout(() => {
                form.reset();
            }, 500);
        }
    });
</script>

</body>
</html>
