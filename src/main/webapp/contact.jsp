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
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<h2>Contact Us</h2>
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


