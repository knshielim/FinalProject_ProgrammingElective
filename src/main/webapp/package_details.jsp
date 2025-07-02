<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.halabo.util.DatabaseConnection" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    int packageId = 0;
    int destinationId = 0;
    try {
        String packageIdParam = request.getParameter("package_id");
        if (packageIdParam != null && !packageIdParam.trim().isEmpty()) {
            packageId = Integer.parseInt(packageIdParam);
        } else {
            out.println("<p class='error-message'>Invalid package ID: Parameter missing.</p>");
            return;
        }
    } catch (NumberFormatException e) {
        out.println("<p class='error-message'>Invalid package ID format.</p>");
        return;
    }
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Package Details</title>
	    <link rel="stylesheet" href="styles.css">
	    <style>
	        .package-image {
	            max-width: 100%;
	            height: auto;
	            border-radius: 8px;
	            margin-bottom: 20px;
	            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
	        }
	        .key-info {
	            margin-top: 20px;
	            font-size: 1.1em;
	        }
	        .tab-buttons {
	            display: flex;
	            justify-content: center;
	            margin-top: 30px;
	            gap: 10px;
	        }
	        .tab-btn {
	            padding: 10px 20px;
	            border: none;
	            background-color: #eee;
	            cursor: pointer;
	            border-radius: 4px;
	        }
	        .tab-btn.active {
	            background-color: #007bff;
	            color: white;
	        }
	        .tab-content {
	            display: none;
	            margin-top: 20px;
	            line-height: 1.6;
	        }
	        .tab-content.active {
	            display: block;
	        }
	        .action-buttons {
	            text-align: center;
	            margin-top: 30px;
	        }
	        .action-buttons a {
	            display: inline-block;
	            padding: 10px 20px;
	            margin: 5px;
	            color: white;
	            text-decoration: none;
	            border-radius: 5px;
	        }
	        .book-now-button {
	            background-color: #28a745;
	        }
	        .back-button {
	            background-color: #007bff;
	        }
	    </style>
	</head>
	<body>
	
		<jsp:include page="header.jsp" />
		
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
		            destinationId = rs.getInt("destination_id");
		%>
		
		    <div class="package-header">
		        <h1><%= packageName %></h1>
		        <img src="<%= request.getContextPath() + "/" + imagePath %>" alt="<%= packageName %>" class="package-image"
		             onerror="this.style.display='none'; this.nextElementSibling.style.display='inline';" />
		        <span style="display:none;">Image not found</span>
		
		        <div class="key-info">
		            <div><strong>Price:</strong> <%= price %></div>
		            <div><strong>Duration:</strong> <%= duration %></div>
		            <div><strong>Min People:</strong> <%= minPeople %></div>
		            <div><strong>Tour Type:</strong> <%= tourType %></div>
		            <div><strong>Tour Code:</strong> <%= tourCode %></div>
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
		
		    <div id="description-tab" class="tab-content active"><%= (description != null && !description.isEmpty()) ? description : "No description available." %></div>
		    <div id="itinerary-tab" class="tab-content"><%= (itinerary != null && !itinerary.isEmpty()) ? itinerary : "No itinerary available." %></div>
		    <div id="price-tab" class="tab-content"><%= (priceDetails != null && !priceDetails.isEmpty()) ? priceDetails : "No price details available." %></div>
		    <div id="hotel-tab" class="tab-content"><%= (hotel != null && !hotel.isEmpty()) ? hotel : "No hotel info available." %></div>
		    <% if (remarks != null && !remarks.trim().isEmpty()) { %>
		        <div id="remarks-tab" class="tab-content"><%= remarks %></div>
		    <% } %>
		
		    <div class="action-buttons">
		        <a href="booking.jsp?destinationId=<%= destinationId %>&packageId=<%= packageId %>" class="book-now-button">Book Now</a>
		        <a href="destination.jsp?id=<%= destinationId %>" class="back-button">Back to Destination</a>
		    </div>
		
		<%
		        } else {
		            out.println("<p class='error-message'>Package not found.</p>");
		        }
		    } catch (SQLException e) {
		        out.println("<p class='error-message'>Error retrieving package: " + e.getMessage() + "</p>");
		    } finally {
		        try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
		        try { if (ps != null) ps.close(); } catch (SQLException ignored) {}
		        try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
		    }
		%>
		</div>
		
		<jsp:include page="footer.jsp" />
		
		<script>
		    document.addEventListener("DOMContentLoaded", () => {
		        const tabButtons = document.querySelectorAll(".tab-btn");
		        const tabContents = document.querySelectorAll(".tab-content");
		
		        tabButtons.forEach(btn => {
		            btn.addEventListener("click", () => {
		                tabButtons.forEach(b => b.classList.remove("active"));
		                tabContents.forEach(c => c.classList.remove("active"));
		
		                btn.classList.add("active");
		                document.getElementById(btn.dataset.tab).classList.add("active");
		                window.location.hash = btn.dataset.tab;
		            });
		        });
		
		        const hash = window.location.hash?.substring(1);
		        if (hash) {
		            document.querySelector(`.tab-btn[data-tab="${hash}"]`)?.click();
		        }
		    });
		</script>
	
	</body>
</html>
