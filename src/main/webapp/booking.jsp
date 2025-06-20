<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    session.setAttribute("name", request.getParameter("name"));
    session.setAttribute("email", request.getParameter("email"));
    session.setAttribute("phone", request.getParameter("phone"));
    session.setAttribute("destination", request.getParameter("destination"));
    session.setAttribute("package", request.getParameter("package"));
    session.setAttribute("travelers", request.getParameter("travelers"));
    session.setAttribute("date", request.getParameter("date"));
%>
    
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Booking - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	    <script src="bookings.js" defer></script>
	    <style>
	        .form-container { max-width: 600px; margin: auto; padding: 20px; }
	        .form-group { margin-bottom: 1rem; }
	        .form-group label { display: block; margin-bottom: 0.5rem; }
	        .form-group input, .form-group select { width: 100%; padding: 8px; }
	        .btn-primary { background-color: #d92662; color: white; padding: 12px; border: none; border-radius: 4px; cursor: pointer; }
	        .btn-primary:hover { background-color: #ba1c4e; }
	    </style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="container">
		    <div class="form-container">
		        <h2 style="text-align: center; margin-bottom: 2rem;">Complete Your Booking</h2>
		        <form action="payment.jsp" method="get">
		            <div class="form-group">
		                <label for="booking-name">Full Name</label>
		                <input type="text" id="booking-name" name="name" required>
		            </div>
		            <div class="form-group">
		                <label for="booking-email">Email</label>
		                <input type="email" id="booking-email" name="email" required>
		            </div>
		            <div class="form-group">
		                <label for="booking-phone">Phone Number</label>
		                <input type="tel" id="booking-phone" name="phone" required>
		            </div>
		
		            <!-- Destination Dropdown -->
		            <div class="form-group">
		                <label for="select-destination">Select Destination</label>
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
		            </div>
		
		            <!-- Package Dropdown -->
		            <div class="form-group">
		                <label for="select-package">Select Package</label>
		                <select id="select-package" name="package" required>
		                    <option value="">-- Choose Package --</option>
		                </select>
		            </div>
		
		            <div class="form-group">
		                <label for="booking-travelers">Number of Travelers</label>
		                <select id="booking-travelers" name="travelers" required>
		                    <option value="">Select number</option>
		                    <option value="1">1 Person</option>
		                    <option value="2">2 People</option>
		                    <option value="3">3 People</option>
		                    <option value="4">4 People</option>
		                    <option value="5+">5+ People</option>
		                </select>
		            </div>
		            <div class="form-group">
		                <label for="booking-date">Preferred Travel Date</label>
		                <input type="date" id="booking-date" name="date" required>
		            </div>
		
		            <button type="submit" class="btn-primary">Proceed to Payment</button>
		        </form>
		    </div>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</body>
</html>
