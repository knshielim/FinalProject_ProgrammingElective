<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.halabo.model.User" %>
<%
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
	    <style>
	        .form-container {
	            max-width: 600px;
	            margin: 50px auto;
	            padding: 30px;
	            background-color: #f9f9f9;
	            border-radius: 8px;
	            box-shadow: 0 0 15px rgba(0,0,0,0.1);
	        }
	        .form-container h2 {
	            text-align: center;
	            color: #333;
	            margin-bottom: 30px;
	        }
	        .form-container label {
	            display: block;
	            margin-bottom: 8px;
	            font-weight: bold;
	            color: #555;
	        }
	        .form-container input[type="text"],
	        .form-container input[type="email"],
	        .form-container input[type="tel"],
	        .form-container input[type="date"],
	        .form-container select {
	            width: 100%;
	            padding: 10px;
	            margin-bottom: 20px;
	            border: 1px solid #ccc;
	            border-radius: 5px;
	            font-size: 1em;
	            box-sizing: border-box;
	        }
	        .form-container button[type="submit"] {
	            width: 100%;
	            padding: 12px;
	            background-color: #d92662;
	            color: white;
	            border: none;
	            border-radius: 5px;
	            font-size: 1.1em;
	            cursor: pointer;
	        }
	        .form-container button[type="submit"]:hover {
	            background-color: #b71d4d;
	        }
	        .autofill-prompt {
	            background-color: #e9f7ef;
	            border: 1px solid #d4edda;
	            border-radius: 5px;
	            padding: 15px;
	            margin-bottom: 20px;
	            text-align: center;
	            font-size: 0.95em;
	            color: #155724;
	        }
	        .autofill-prompt button {
	            background-color: #28a745;
	            color: white;
	            border: none;
	            padding: 8px 15px;
	            border-radius: 4px;
	            cursor: pointer;
	            margin-left: 10px;
	        }
	        .autofill-prompt button:hover {
	            background-color: #218838;
	        }
	    </style>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		
		<div class="form-container">
		    <h2>Complete Your Booking</h2>
		
		    <% if (isLoggedIn) { %>
		        <div class="autofill-prompt">
		            You're logged in as <strong><%= autoName %></strong>. Auto-fill your details?
		            <button type="button" id="autofill-yes">Yes</button>
		            <button type="button" id="autofill-no">No</button>
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
		        <select id="select-destination" name="destination_name" required>
		            <option value="">-- Loading Destinations --</option>
		        </select>
		
		        <label for="select-package">Select Package:</label>
		        <select id="select-package" name="package_name" required>
		            <option value="">-- Select Destination First --</option>
		        </select>
		
		        <label for="travelers">Number of Travelers:</label>
		        <select id="travelers" name="travelers" required>
		            <option value="">Select</option>
		            <option>1</option>
		            <option>2</option>
		            <option>3</option>
		            <option>4</option>
		            <option>5+</option>
		        </select>
		
		        <label for="date">Preferred Travel Date:</label>
		        <input type="date" id="date" name="date" required>
		
		        <input type="hidden" id="booking-destination-id" name="destinationId" value="<%= preselectedDestinationId != null ? preselectedDestinationId : "" %>">
		        <input type="hidden" id="booking-package-id" name="packageId" value="<%= preselectedPackageId != null ? preselectedPackageId : "" %>">
		
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
