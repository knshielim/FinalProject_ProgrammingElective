<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- Removed import com.halabo.model.User as we're using session strings directly --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Booking - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <script src="booking.js" defer></script>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        /* Your existing .form-container and input styles here */
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
                width: calc(100% - 20px); /* Account for padding */
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 1em;
                box-sizing: border-box; /* Include padding in width */
            }
            .form-container button[type="submit"] {
                display: block;
                width: 100%;
                padding: 12px;
                background-color: #d92662;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 1.1em;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .form-container button[type="submit"]:hover {
                background-color: #b71d4d;
            }

            /* Added styles for auto-fill prompt */
            .autofill-prompt {
                background-color: #e9f7ef; /* Light green background */
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
                transition: background-color 0.3s ease;
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

            <%
                // Retrieve session attributes. Use "" for null to prevent "null" string in JS.
                String userFullName = (String) session.getAttribute("name");
                String userEmail = (String) session.getAttribute("email");
                String userPhoneNumber = (String) session.getAttribute("phone");

                // Check if the user is considered logged in based on your servlet's session attributes
                boolean isLoggedIn = (session.getAttribute("isLoggedIn") != null && (Boolean)session.getAttribute("isLoggedIn"));

                // Ensure non-null values for JavaScript
                userFullName = (userFullName != null) ? userFullName : "";
                userEmail = (userEmail != null) ? userEmail : "";
                userPhoneNumber = (userPhoneNumber != null) ? userPhoneNumber : "";

                if (isLoggedIn) {
            %>
                <div class="autofill-prompt" id="autofillPrompt">
                    It looks like you're logged in as **<%= userFullName %>**.
                    Would you like to auto-fill your details?
                    <button type="button" id="autofillButton">Yes, auto-fill</button>
                    <button type="button" id="skipAutofillButton">No, thank you</button>
                </div>
            <%
                }
            %>

	        <form action="payment.jsp" method="get" id="bookingForm">
	            <label for="name">Full Name:</label>
	            <input type="text" id="name" name="name" value="" required>
	            <label for="email">Email:</label>
	            <input type="email" id="email" name="email" value="" required>
	            <label for="phone">Phone Number:</label>
	            <input type="tel" id="phone" name="phone" value="" required>
	
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
	
	            <input type="hidden" id="booking-destination-id" name="destinationId">
	            <input type="hidden" id="booking-package-id" name="packageId">
	
	            <button type="submit">Proceed to Payment</button>
	        </form>
	    </div>
	    <jsp:include page="footer.jsp" />
	    <script>
	        // These variables will be used by booking.js to pre-select dropdowns
	        const preselectedDestinationId = "<%= request.getParameter("destinationId") %>";
	        const preselectedPackageId = "<%= request.getParameter("packageId") %>";

            // User data for auto-fill, directly from session attributes
            const isLoggedIn = <%= isLoggedIn %>;
            const loggedInUser = {
                fullName: "<%= userFullName %>",
                email: "<%= userEmail %>",
                phoneNumber: "<%= userPhoneNumber %>"
            };
	    </script>
	</body>
</html>