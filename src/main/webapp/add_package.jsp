<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.halabo.model.Destination" %> <%-- Import Destination model for dropdown --%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Add New Package - Admin</title>
	    <link rel="stylesheet" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        /* Reuse form-container-admin styles from add_destination.jsp */
	        /* You can move these to styles.css if you haven't already */
	        .form-container-admin {
	            max-width: 800px; /* Slightly wider for package form */
	            margin: 50px auto;
	            padding: 30px;
	            background-color: #f9f9f9;
	            border-radius: 8px;
	            box-shadow: 0 0 15px rgba(0,0,0,0.1);
	        }
	        .form-container-admin h2 {
	            text-align: center;
	            color: #d92662;
	            margin-bottom: 30px;
	        }
	        .form-container-admin label {
	            display: block;
	            margin-bottom: 8px;
	            font-weight: bold;
	            color: #555;
	        }
	        .form-container-admin input[type="text"],
	        .form-container-admin textarea,
	        .form-container-admin select {
	            width: calc(100% - 20px);
	            padding: 10px;
	            margin-bottom: 20px;
	            border: 1px solid #ccc;
	            border-radius: 5px;
	            font-size: 1em;
	            box-sizing: border-box;
	        }
	        .form-container-admin textarea {
	            min-height: 80px; /* Adjust height as needed */
	            resize: vertical;
	        }
	        .form-container-admin button[type="submit"] {
	            display: block;
	            width: 100%;
	            padding: 12px;
	            background-color: #28a745; /* Green for submit */
	            color: white;
	            border: none;
	            border-radius: 5px;
	            font-size: 1.1em;
	            cursor: pointer;
	            transition: background-color 0.3s ease;
	        }
	        .form-container-admin button[type="submit"]:hover {
	            background-color: #218838;
	        }
	        .form-message {
	            margin-top: 15px;
	            padding: 10px;
	            border-radius: 5px;
	            font-weight: bold;
	            text-align: center;
	        }
	        .form-message.success {
	            background-color: #d4edda;
	            color: #155724;
	            border: 1px solid #c3e6cb;
	        }
	        .form-message.error {
	            background-color: #f8d7da;
	            color: #721c24;
	            border: 1px solid #f5c6cb;
	        }
	    </style>
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	
	    <%
	        // Basic access control for this specific page
	        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
	        if (isAdmin == null || !isAdmin) {
	            response.sendRedirect("login.jsp?error=unauthorized");
	            return;
	        }
	
	        // Retrieve the list of destinations from the request scope
	        List<Destination> destinations = (List<Destination>) request.getAttribute("destinations");
	    %>
	
	    <div class="form-container-admin">
	        <h2>Add New Package</h2>
	
	        <%-- Display success or error messages --%>
	        <%
	            String message = (String) request.getAttribute("message");
	            String messageType = (String) request.getAttribute("messageType");
	            if (message != null) {
	        %>
	            <div class="form-message <%= messageType %>">
	                <%= message %>
	            </div>
	        <%
	            }
	        %>
	
	        <form action="addPackage" method="post">
	            <label for="destinationId">Select Destination:</label>
	            <select id="destinationId" name="destinationId" required>
	                <option value="">-- Choose Destination --</option>
	                <%
	                    if (destinations != null && !destinations.isEmpty()) {
	                        for (Destination dest : destinations) {
	                %>
	                            <option value="<%= dest.getId() %>"><%= dest.getName() %></option>
	                <%
	                        }
	                    } else {
	                %>
	                        <option value="" disabled>No destinations available. Add one first!</option>
	                <%
	                    }
	                %>
	            </select>
	
	            <label for="packageName">Package Name:</label>
	            <input type="text" id="packageName" name="packageName" required>
	
	            <label for="imagePath">Image Path (e.g., /images/package_img.jpg):</label>
	            <input type="text" id="imagePath" name="imagePath">
	            <small style="display: block; margin-top: -15px; margin-bottom: 20px; color: #777;">
	                Remember to upload the actual image file to your /images/ folder!
	            </small>
	
	            <label for="price">Price (e.g., IDR 5,500,000 / person):</label>
	            <input type="text" id="price" name="price" required>
	
	            <label for="duration">Duration (e.g., 5 Days / 4 Nights):</label>
	            <input type="text" id="duration" name="duration" required>
	
	            <label for="minPeople">Minimum Travelers (e.g., 2):</label>
	            <input type="text" id="minPeople" name="minPeople" required>
	
	            <label for="tourType">Tour Type (e.g., Adventure, Culture):</label>
	            <input type="text" id="tourType" name="tourType">
	
	            <label for="tourCode">Tour Code (e.g., BALI-AE-001):</label>
	            <input type="text" id="tourCode" name="tourCode">
	
	            <label for="description">Description (HTML allowed):</label>
	            <textarea id="description" name="description"></textarea>
	
	            <label for="itinerary">Itinerary (HTML allowed):</label>
	            <textarea id="itinerary" name="itinerary"></textarea>
	
	            <label for="priceDetails">Price Details (HTML allowed):</label>
	            <textarea id="priceDetails" name="priceDetails"></textarea>
	
	            <label for="hotel">Hotel Info (HTML allowed):</label>
	            <textarea id="hotel" name="hotel"></textarea>
	
	            <label for="remarks">Remarks (HTML allowed):</label>
	            <textarea id="remarks" name="remarks"></textarea>
	
	            <button type="submit">Add Package</button>
	        </form>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>