<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.halabo.util.DatabaseConnection" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
  int packageId = 0;
  int destinationId = 0; // Initialize destinationId
  try {
      String packageIdParam = request.getParameter("package_id");
      if (packageIdParam != null && !packageIdParam.trim().isEmpty()) {
          packageId = Integer.parseInt(packageIdParam);
      } else {
          out.println("<p class='error-message'>Invalid package ID provided: Parameter is missing or empty.</p>");
          return;
      }
  } catch (NumberFormatException e) {
      out.println("<p class='error-message'>Invalid package ID provided: Value is not a valid number.</p>");
      return;
  }
%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Package Details</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <style>
	        /* General Layout */
	        .main-content {
	            padding: 20px;
	            max-width: 900px; /* Adjust as needed */
	            margin: 20px auto;
	            background-color: #f9f9f9;
	            border-radius: 8px;
	            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
	        }
	        .package-header {
	            text-align: center;
	            margin-bottom: 20px;
	        }
	        .package-header h1 {
	            font-size: 2.2em;
	            color: #333;
	            margin-bottom: 10px;
	        }
	        .package-image {
	            max-width: 100%;
	            height: auto;
	            border-radius: 8px;
	            margin-bottom: 20px;
	        }
	        .key-info {
	            display: flex;
	            justify-content: space-around;
	            flex-wrap: wrap;
	            gap: 15px;
	            padding: 15px 0;
	            border-top: 1px solid #eee;
	            border-bottom: 1px solid #eee;
	            margin-bottom: 20px;
	        }
	        .key-info-item {
	            text-align: center;
	            flex: 1;
	            min-width: 120px;
	        }
	        .key-info-item strong {
	            display: block;
	            font-size: 1.1em;
	            color: #007bff;
	        }
	        .key-info-item span {
	            font-size: 0.9em;
	            color: #666;
	        }
	        /* Tab Styles */
	        .tab-buttons {
	            display: flex;
	            justify-content: flex-start;
	            margin-top: 30px;
	            margin-bottom: 0;
	            border-bottom: 1px solid #ddd;
	            width: 100%;
	            overflow-x: auto;
	            -webkit-overflow-scrolling: touch;
	        }
	        .tab-btn {
	            padding: 12px 20px;
	            cursor: pointer;
	            border: none;
	            background-color: transparent;
	            font-size: 1em;
	            color: #555;
	            transition: all 0.3s ease;
	            border-bottom: 3px solid transparent;
	            white-space: nowrap;
	            text-transform: uppercase;
	            font-weight: bold;
	        }
	        .tab-btn:hover {
	            color: #007bff;
	            border-color: #eee;
	        }
	        .tab-btn.active {
	            color: #007bff;
	            border-color: #007bff;
	        }
	        .tab-content {
	            display: none;
	            padding: 20px;
	            border: 1px solid #ddd;
	            border-top: none;
	            border-radius: 0 0 8px 8px;
	            background-color: #fff;
	        }
	        .tab-content.active {
	            display: block;
	        }
	        .tab-content h2 {
	            font-size: 1.5em;
	            color: #333;
	            margin-top: 0;
	            margin-bottom: 15px;
	        }
	        /* Styles for included/excluded lists in Description tab */
	        .included-excluded {
	            display: flex;
	            flex-wrap: wrap;
	            gap: 20px;
	            margin-top: 20px;
	        }
	        .included-excluded .col {
	            flex: 1 1 45%;
	            min-width: 280px;
	        }
	        .included-excluded ul {
	            list-style: none;
	            padding: 0;
	            margin: 0;
	        }
	        .included-excluded li {
	            margin-bottom: 8px;
	            padding-left: 25px;
	            position: relative;
	        }
	        .included-excluded li::before {
	            content: '';
	            position: absolute;
	            left: 0;
	            top: 50%;
	            transform: translateY(-50%);
	            width: 18px;
	            height: 18px;
	            background-size: contain;
	            background-repeat: no-repeat;
	        }
	        .included-excluded li.included::before {
	            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%2328a745"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>'); /* Green check */
	        }
	        .included-excluded li.excluded::before {
	            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23dc3545"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/></svg>'); /* Red X */
	        }
	
	        /* Button styles */
	        .action-buttons {
	            margin-top: 20px;
	            text-align: center; /* Center the buttons */
	        }
	        .back-button, .book-now-button {
	            display: inline-block;
	            padding: 10px 20px;
	            color: white;
	            text-decoration: none;
	            border-radius: 5px;
	            transition: background-color 0.3s ease;
	            margin: 0 5px; /* Space between buttons */
	        }
	        .back-button {
	            background-color: #007bff;
	        }
	        .back-button:hover {
	            background-color: #0056b3;
	        }
	        .book-now-button {
	            background-color: #28a745; /* Green color for Book Now */
	        }
	        .book-now-button:hover {
	            background-color: #218838;
	        }
	        .error-message {
	            text-align: center;
	            color: red;
	            font-weight: bold;
	            margin-top: 20px;
	            padding: 15px;
	            border: 1px solid red;
	            background-color: #ffe6e6;
	            border-radius: 5px;
	        }
	    </style>
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	
	    <div class="main-content">
	    <%
	      Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	      try {
	        conn = DatabaseConnection.getConnection();
	        ps = conn.prepareStatement("SELECT * FROM packages WHERE id = ?");
	        ps.setInt(1, packageId);
	        rs = ps.executeQuery();
	
	        if (rs.next()) {
	          String packageName = rs.getString("package_name");
	          String imagePath = rs.getString("image_path");
	          String price = rs.getString("price");
	          String duration = rs.getString("duration");
	          String minPeople = rs.getString("min_people");
	          String tourType = rs.getString("tour_type");
	          String tourCode = rs.getString("tour_code");
	          String description = rs.getString("description");
	          String itinerary = rs.getString("itinerary");
	          String priceDetails = rs.getString("price_details");
	          String hotel = rs.getString("hotel");
	          String remarks = rs.getString("remarks");
	          destinationId = rs.getInt("destination_id"); // Assign value to destinationId
	    %>
	            <div class="package-header">
	                <h1><%= packageName %></h1>
	                <img src="<%= imagePath %>" alt="<%= packageName %>" class="package-image">
	
	                <div class="key-info">
	                    <div class="key-info-item">
	                        <span>Price</span>
	                        <strong><%= price %></strong>
	                    </div>
	                    <div class="key-info-item">
	                        <span>Duration</span>
	                        <strong><%= duration %></strong>
	                    </div>
	                    <div class="key-info-item">
	                        <span>Min People</span>
	                        <strong><%= minPeople %></strong>
	                    </div>
	                    <div class="key-info-item">
	                        <span>Tour Type</span>
	                        <strong><%= tourType %></strong>
	                    </div>
	                    <div class="key-info-item">
	                        <span>Tour Code</span>
	                        <strong><%= tourCode %></strong>
	                    </div>
	                </div>
	            </div>
	
	            <div class="tab-buttons">
	                <button class="tab-btn active" data-tab="description-tab">Description</button>
	                <button class="tab-btn" data-tab="itinerary-tab">Itinerary</button>
	                <button class="tab-btn" data-tab="price-tab">Price</button>
	                <button class="tab-btn" data-tab="hotel-tab">Hotel</button>
	                <% if (remarks != null && !remarks.trim().isEmpty()) { %>
	                    <button class="tab-btn" data-tab="remarks-tab">Remarks</button>
	                <% } %>
	            </div>
	
	            <div id="description-tab" class="tab-content active">
	                <%= (description != null && !description.isEmpty()) ? description : "<p>No description available.</p>" %>
	            </div>
	            <div id="itinerary-tab" class="tab-content">
	                <%= (itinerary != null && !itinerary.isEmpty()) ? itinerary : "<p>No itinerary available.</p>" %>
	            </div>
	            <div id="price-tab" class="tab-content">
	                <%= (priceDetails != null && !priceDetails.isEmpty()) ? priceDetails : "<p>No price details available.</p>" %>
	            </div>
	            <div id="hotel-tab" class="tab-content">
	                <h2>Hotel / Accommodation</h2>
	                <p><%= (hotel != null && !hotel.isEmpty()) ? hotel : "No hotel information available." %></p>
	            </div>
	            <% if (remarks != null && !remarks.trim().isEmpty()) { %>
	                <div id="remarks-tab" class="tab-content">
	                    <%= remarks %>
	                </div>
	            <% } %>
	
	            <div class="action-buttons">
	                <a href="booking.jsp?packageId=<%= packageId %>&destinationId=<%= destinationId %>" class="book-now-button">Book Now</a>
	                <a href="destination.jsp?id=<%= destinationId %>" class="back-button">Back to Destination</a>
	            </div>
	
	    <%
	        } else {
	            out.println("<p class='error-message'>Package not found with ID: " + packageId + ".</p>");
	        }
	
	      } catch (SQLException e) {
	        e.printStackTrace();
	        out.println("<p class='error-message'>Error loading package details. Please try again later.</p>");
	        out.println("<p class='error-message'>Developer Note: Database Error - " + e.getMessage() + "</p>");
	      } finally {
	        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
	        try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
	        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	      }
	    %>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	
	    <script>
	        document.addEventListener("DOMContentLoaded", function () {
	            const tabButtons = document.querySelectorAll(".tab-btn");
	            const tabContents = document.querySelectorAll(".tab-content");
	
	            tabButtons.forEach((button) => {
	                button.addEventListener("click", () => {
	                    tabButtons.forEach(btn => btn.classList.remove("active"));
	                    tabContents.forEach(tab => tab.classList.remove("active"));
	
	                    button.classList.add("active");
	
	                    const targetTabId = button.dataset.tab;
	                    document.getElementById(targetTabId).classList.add("active");
	                    window.location.hash = targetTabId; // Update URL hash for direct links/refresh
	                });
	            });
	
	            // Initial tab activation based on URL hash or default to first tab
	            const initialTabId = window.location.hash ? window.location.hash.substring(1) : (tabButtons.length > 0 ? tabButtons[0].dataset.tab : null);
	            if (initialTabId) {
	                const initialButton = document.querySelector(`.tab-btn[data-tab="${initialTabId}"]`);
	                const initialContent = document.getElementById(initialTabId);
	
	                if (initialButton && initialContent) {
	                    initialButton.click(); // Simulate a click to activate the tab
	                } else if (tabButtons.length > 0) {
	                    tabButtons[0].click(); // Fallback to first tab if hash is invalid
	                }
	            }
	        });
	    </script>
	</body>
</html>