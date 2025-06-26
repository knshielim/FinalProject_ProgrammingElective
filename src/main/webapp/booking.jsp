<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%
    String selectedPackage = request.getParameter("package") != null ? URLDecoder.decode(request.getParameter("package"), "UTF-8") : "";
%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Booking - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <script src="booking.js" defer></script>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body>
	    <jsp:include page="header.jsp" />
	    <div class="form-container">
	        <h2>Complete Your Booking</h2>
	        <form action="payment.jsp" method="get">
	            <label>Full Name:</label>
	            <input type="text" name="name" required>
	            <label>Email:</label>
	            <input type="email" name="email" required>
	            <label>Phone Number:</label>
	            <input type="tel" name="phone" required>
	
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
	
	            <label>Number of Travelers:</label>
	            <select name="travelers" required>
	                <option value="">Select</option>
	                <option>1</option>
	                <option>2</option>
	                <option>3</option>
	                <option>4</option>
	                <option>5+</option>
	            </select>
	
	            <label>Preferred Travel Date:</label>
	            <input type="date" name="date" required>
	
	            <button type="submit">Proceed to Payment</button>
	        </form>
	    </div>
	    <jsp:include page="footer.jsp" />
	    <script>
	        const preSelectedPackage = "<%= selectedPackage %>";
	    </script>
	</body>
</html>
