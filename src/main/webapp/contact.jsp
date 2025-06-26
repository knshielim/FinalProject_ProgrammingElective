<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Contact Us - Halabo Indonesia Tour</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script>
			function validateForm() {
				const name = document.forms["contactForm"]["name"].value;
				const email = document.forms["contactForm"]["email"].value;
				const message = document.forms["contactForm"]["message"].value;
		
				if (!name || !email || !message) {
					alert("Some fields are empty!");
					return false;
				}
				return true;
		    }
		</script>
		<style>
			.alert {
				padding: 10px;
				margin: 10px 0;
				border-radius: 4px;
			}
			.alert-success {
				background-color: #d4edda;
				color: #155724;
				border: 1px solid #c3e6cb;
			}
			.alert-error {
				background-color: #f8d7da;
				color: #721c24;
				border: 1px solid #f5c6cb;
			}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<h2>Contact Us</h2>
		
		<%-- Show success/error messages --%>
		<% if (request.getParameter("success") != null) { %>
			<div class="alert alert-success">
				Thank you for contacting us! We'll get back to you soon.
			</div>
		<% } %>
		
		<% if (request.getParameter("error") != null) { %>
			<div class="alert alert-error">
				Sorry, there was an error submitting your message. Please try again.
			</div>
		<% } %>
		
		<form name="contactForm" method="post" action="contact" onsubmit="return validateForm();">
			<label>Name:</label><br>
		    <input type="text" id="name" name="name" required><br><br>

		    <label>Email:</label><br>
		    <input type="email" id="email" name="email" required><br><br>

		    <label>Message:</label><br>
		    <textarea name="message" rows="5" cols="30" required></textarea><br><br>

		    <input type="submit" value="Submit">
		</form>
		
		<jsp:include page="footer.jsp"/>
	</body>
</html>