<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%
    String selectedPackage = request.getParameter("package") != null ? URLDecoder.decode(request.getParameter("package"), "UTF-8") : "";
%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Enquiry - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <script src="enquiry.js" defer></script>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		
		<div class="form-container">
		    <h2>Send Us Your Enquiry</h2>
		    
		    <%-- Show success/error messages --%>
			<% if (request.getParameter("success") != null) { %>
				<div class="alert alert-success">
					Thank you for your enquiry! We'll contact you soon with more details.
				</div>
			<% } %>
			
			<% if (request.getParameter("error") != null) { %>
				<div class="alert alert-error">
					Sorry, there was an error submitting your enquiry. Please try again.
				</div>
			<% } %>
		    
		    <form action="enquiry" method="post">
		        <label>Full Name:</label>
		        <input type="text" name="fullname" required>
		
		        <label>Email:</label>
		        <input type="email" name="email" required>
		
		        <label>Select Destination:</label>
		        <select id="select-destination" name="destination" required>
		            <option value="">-- Choose Destination --</option>
		            <option value="Borobudur Temple">Borobudur Temple</option>
		            <option value="Bali Island">Bali Island</option>
		            <option value="Raja Ampat">Raja Ampat</option>
		            <option value="Mount Bromo">Mount Bromo</option>
		            <option value="Lake Toba">Lake Toba</option>
		            <option value="Pulau Seribu">Pulau Seribu</option>
		            <option value="Monas National Monument">Monas National Monument</option>
		            <option value="Komodo Island">Komodo Island</option>
		            <option value="Labuan Bajo">Labuan Bajo</option>
		            <option value="Prambanan Temple">Prambanan Temple</option>
		        </select>
		
		        <label>Select Package:</label>
		        <select id="select-package" name="package" required>
		            <option value="">-- Choose Package --</option>
		        </select>
		
		        <label>Message:</label>
		        <textarea name="message" rows="4" placeholder="Any questions or custom requests?"></textarea>
		
		        <button type="submit">Submit Enquiry</button>
		    </form>
		</div>
		
		<jsp:include page="footer.jsp"/>
		<script>
		    const preSelectedPackage = "<%= selectedPackage %>";
		</script>
	</body>
</html>