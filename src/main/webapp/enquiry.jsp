<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String selectedPackage = request.getParameter("package");
    if (selectedPackage == null) {
        selectedPackage = "";
    }
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Enquiry - Halabo Indonesia Tour</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="enquiry.js" defer></script>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
	
	    <div class="enquiry-form-container">
	        <h1>Tour Package Enquiry</h1>
	        <form action="submit_enquiry.jsp" method="post">
	            <label for="destination">Destination:</label>
	            <select id="destination" name="destination" required>
	                <option value="">-- Select Destination --</option>
	                <option value="Borobudur">Borobudur</option>
	                <option value="Bali">Bali</option>
	                <option value="Raja Ampat">Raja Ampat</option>
	                <option value="Mount Bromo">Mount Bromo</option>
	                <option value="Lake Toba">Lake Toba</option>
	                <option value="Pulau Seribu">Pulau Seribu</option>
	                <option value="Monas">Monas</option>
	                <option value="Komodo Island">Komodo Island</option>
	                <option value="Labuan Bajo">Labuan Bajo</option>
	                <option value="Prambanan Temple">Prambanan Temple</option>
	            </select>
	
	            <label for="package">Package:</label>
	            <select id="package" name="package" required>
	                <option value="">-- Select Package --</option>
	            </select>
	
	            <label for="fullname">Full Name:</label>
	            <input type="text" id="fullname" name="fullname" required>
	
	            <label for="email">Email Address:</label>
	            <input type="email" id="email" name="email" required>
	
	            <label for="message">Message:</label>
	            <textarea id="message" name="message" rows="4" placeholder="Any additional request or questions?"></textarea>
	
	            <button type="submit">Submit Enquiry</button>
	            
	            <jsp:include page="footer.jsp"/>
	        </form>
	    </div>
	</body>
</html>