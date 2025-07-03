<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.halabo.model.User" %>
<%
    if (session == null || session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("login.jsp?error=not_logged_in");
        return;
    }

    User loggedInUser = (User) session.getAttribute("loggedInUser");
    boolean isLoggedIn = (loggedInUser != null);

    String autoName = isLoggedIn ? loggedInUser.getFullName() : "";
    String autoEmail = isLoggedIn ? loggedInUser.getEmail() : "";
    String autoPhone = isLoggedIn ? loggedInUser.getPhone() : "";

    String preselectedDestinationId = request.getParameter("destinationId");
    String preselectedPackageId = request.getParameter("packageId");
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Booking - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body>
		<jsp:include page="header.jsp" />
		
		<div class="form-container">
		    <h2>Complete Your Booking</h2>
		
		    <% if (isLoggedIn) { %>
		       	<div class="autofill-wrapper">
			        <div class="autofill-prompt">
			            You're logged in as <strong><%= autoName %></strong>. Auto-fill your details?
			            <button type="button" id="autofill-yes">Yes</button>
			            <button type="button" id="autofill-no">No</button>
			        </div>
			    </div>
		    <% } %>
		
		    <form action="payment.jsp" method="post" id="bookingForm">
		        <label for="fullName">Full Name:</label>
		        <input type="text" id="fullName" name="name" required>
		
		        <label for="email">Email:</label>
		        <input type="email" id="email" name="email" required>
		
		        <label for="phone">Phone Number:</label>
		        <input type="tel" id="phone" name="phone" required>
		
		        <label for="select-destination">Select Destination:</label>
		        <select id="select-destination" name="destination" required>
		            <option value="">-- Loading Destinations --</option>
		        </select>
		
		        <label for="select-package">Select Package:</label>
		        <select id="select-package" name="package" required>
		            <option value="">-- Select Destination First --</option>
		        </select>
		
		        <label for="travelers">Number of Travelers:</label>
		        <input type="number" id="travelers" name="travelers" min="1" value="1" required>
		
		        <label for="date">Preferred Travel Date:</label>
		        <input type="date" id="date" name="date" required>
		
		        <input type="hidden" id="booking-destination-id" name="destinationId" value="<%= preselectedDestinationId != null ? preselectedDestinationId : "" %>">
		        <input type="hidden" id="booking-package-id" name="packageId" value="<%= preselectedPackageId != null ? preselectedPackageId : "" %>">
				
				<div class="total-price-display">
				    <p><strong>Total Price: </strong><span id="total-price">RM 0</span></p>
				</div>
				
				<input type="hidden" id="totalPriceInput" name="total_price" value="0">
				<input type="hidden" name="destination_name" id="destinationNameInput">
				<input type="hidden" name="package_name" id="packageNameInput">
				
		        <button type="submit">Proceed to Payment</button>
		    </form>
		</div>
		
		<jsp:include page="footer.jsp" />
		
		<script>
		    const preselectedDestinationId = "<%= preselectedDestinationId != null ? preselectedDestinationId : "" %>";
		    const preselectedPackageId = "<%= preselectedPackageId != null ? preselectedPackageId : "" %>";
		</script>
		
		<script>
		    document.addEventListener("DOMContentLoaded", function () {
		        const yesBtn = document.getElementById("autofill-yes");
		        const noBtn = document.getElementById("autofill-no");
		
		        <% if (isLoggedIn) { %>
		            yesBtn?.addEventListener("click", () => {
		                document.getElementById("fullName").value = "<%= autoName %>";
		                document.getElementById("email").value = "<%= autoEmail %>";
		                document.getElementById("phone").value = "<%= autoPhone %>";
		            });
		
		            noBtn?.addEventListener("click", () => {
		                document.getElementById("fullName").value = "";
		                document.getElementById("email").value = "";
		                document.getElementById("phone").value = "";
		            });
		        <% } %>
		    });
		</script>
		
		<script src="booking.js"></script>
	</body>
</html>
