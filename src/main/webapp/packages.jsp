<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.halabo.util.DatabaseConnection" %> <%-- Adjust this path if your DatabaseConnection class is in a different package --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Tour Packages - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        .package-page-container {
	            max-width: 1000px;
	            margin: auto;
	            padding: 40px 20px;
	        }
	
	        h1 {
	            text-align: center;
	            color: #d92662;
	            margin-bottom: 40px;
	        }
	
	        .destination-section {
	            margin-top: 40px;
	            padding-bottom: 20px;
	            border-bottom: 1px solid #eee; /* Light separator */
	        }
            .destination-section:last-child {
                border-bottom: none; /* No border for the last section */
            }
	
	        .destination-title {
	            font-size: 28px; /* Slightly larger title */
	            margin-bottom: 20px; /* More space below title */
	            color: #222;
	            border-bottom: 2px solid #d92662;
	            padding-bottom: 8px;
	            display: inline-block; /* Makes border only as wide as text */
	            width: 100%; /* For centering or left align */
	            text-align: left; /* Keep title left-aligned */
	        }
	
	        .package-links {
	            display: flex;
	            flex-wrap: wrap;
	            gap: 20px; /* Increased gap */
	            justify-content: center; /* Center packages within section */
	        }
	
	        .package-links a {
	            display: flex; /* Use flexbox for vertical alignment of img and text */
	            flex-direction: column; /* Stack image and text */
	            align-items: center; /* Center content horizontally */
	            width: 180px; /* Fixed width for each package link */
	            padding: 15px; /* More padding */
	            background-color: #fff; /* White background for cards */
	            border: 1px solid #ddd; /* Light border */
	            border-radius: 8px; /* Rounded corners for card effect */
	            text-decoration: none;
	            color: #333; /* Darker text color */
	            font-weight: bold;
	            box-shadow: 0 2px 5px rgba(0,0,0,0.05); /* Subtle shadow */
	            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
	        }
	
	        .package-links a:hover {
	            transform: translateY(-5px); /* Lift effect on hover */
	            box-shadow: 0 4px 10px rgba(0,0,0,0.1); /* Stronger shadow on hover */
	            color: #d92662; /* Highlight text on hover */
	        }
	
	        .package-links img {
	            width: 100%; /* Image takes full width of its container */
	            height: 120px; /* Fixed height for images */
	            object-fit: cover; /* Crop images to fit */
	            border-radius: 4px; /* Slightly rounded image corners */
	            margin-bottom: 10px; /* Space between image and text */
	        }
	        .no-packages-found {
	            text-align: center;
	            color: #777;
	            font-style: italic;
	            margin-top: 15px;
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
	
	    <div class="package-page-container">
	        <h1>Explore Our Tour Packages</h1>
	
	        <%
	            Connection conn = null;
	            PreparedStatement psDestinations = null;
	            ResultSet rsDestinations = null;
	            PreparedStatement psPackages = null;
	            ResultSet rsPackages = null;
	
	            try {
	                conn = DatabaseConnection.getConnection();
	
	                // 1. Fetch all destinations
	                // Assuming 'destinations' table has 'id' and 'destination_name'
	                String sqlDestinations = "SELECT id, destination_name FROM destinations ORDER BY destination_name ASC";
	                psDestinations = conn.prepareStatement(sqlDestinations);
	                rsDestinations = psDestinations.executeQuery();
	
	                boolean destinationsFound = false;
	
	                // Loop through each destination
	                while (rsDestinations.next()) {
	                    destinationsFound = true;
	                    int destinationId = rsDestinations.getInt("id");
	                    String destinationName = rsDestinations.getString("destination_name");
	        %>
	                    <div class="destination-section">
	                        <div class="destination-title"><%= destinationName %></div>
	                        <div class="package-links">
	                        <%
	                            // 2. For each destination, fetch its packages
	                            String sqlPackages = "SELECT id, package_name, image_path FROM packages WHERE destination_id = ? ORDER BY package_name ASC";
	                            psPackages = conn.prepareStatement(sqlPackages);
	                            psPackages.setInt(1, destinationId);
	                            rsPackages = psPackages.executeQuery();
	
	                            boolean packagesForDestinationFound = false;
	
	                            if (!rsPackages.next()) {
	                                // No packages found for this specific destination
	                                out.println("<p class='no-packages-found'>No packages found for " + destinationName + " yet.</p>");
	                            } else {
	                                // Packages found, loop and display them
	                                packagesForDestinationFound = true;
	                                do {
	                                    int packageId = rsPackages.getInt("id");
	                                    String packageName = rsPackages.getString("package_name");
	                                    String imagePath = rsPackages.getString("image_path");
	                        %>
	                                    <a href="package_details.jsp?package_id=<%= packageId %>">
	                                        <img src="<%= imagePath %>" alt="<%= packageName %>">
	                                        <%= packageName %>
	                                    </a>
	                        <%
	                                } while (rsPackages.next());
	                            }
	                            // Close rsPackages and psPackages after each destination loop
	                            if (rsPackages != null) rsPackages.close();
	                            if (psPackages != null) psPackages.close();
	                        %>
	                        </div>
	                    </div>
	        <%
	                } // End of while (rsDestinations.next()) loop
	
	                if (!destinationsFound) {
	                    out.println("<p class='no-packages-found'>No destinations found in the database.</p>");
	                }
	
	            } catch (SQLException e) {
	                e.printStackTrace();
	                out.println("<p class='error-message'>Error loading tour packages. Please try again later.</p>");
	                out.println("<p class='error-message'>Developer Note: Database Error - " + e.getMessage() + "</p>");
	            } finally {
	                // Close all JDBC resources in the reverse order of creation
	                try { if (rsDestinations != null) rsDestinations.close(); } catch (SQLException e) { e.printStackTrace(); }
	                try { if (psDestinations != null) psDestinations.close(); } catch (SQLException e) { e.printStackTrace(); }
	                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	                // psPackages and rsPackages are closed inside the loop for each destination
	            }
	        %>
	
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>