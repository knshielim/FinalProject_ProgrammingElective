<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Halabo Indonesia Tour</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script>
        function validateForm() {
            const name = document.forms["contactForm"]["name"].value.trim();
            const email = document.forms["contactForm"]["email"].value.trim();
            const message = document.forms["contactForm"]["message"].value.trim();

            if (!name || !email || !message) {
                alert("Please fill in all fields.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="contact-container">
    <h2>We’d Love to Hear From You</h2>

    <% if (request.getParameter("success") != null) { %>
        <div class="contact-alert contact-alert-success">
            Thank you for contacting us! We'll be in touch soon.
        </div>
    <% } else if (request.getParameter("error") != null) { %>
        <div class="contact-alert contact-alert-error">
            Oops! Something went wrong. Please try again.
        </div>
    <% } %>

    <form name="contactForm" method="post" action="contact" class="contact-form" onsubmit="return validateForm();">
        <div class="contact-form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" class="contact-input" required>
        </div>

        <div class="contact-form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" class="contact-input" required>
        </div>

        <div class="contact-form-group">
            <label for="message">Message</label>
            <textarea id="message" name="message" class="contact-textarea" rows="5" required></textarea>
        </div>

        <button type="submit" class="contact-submit">Send Message</button>
    </form>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
