<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.halabo.util.DatabaseConnection" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
  int id = 0;
  try {
      String idParam = request.getParameter("id");
      if (idParam != null && !idParam.trim().isEmpty()) {
          id = Integer.parseInt(idParam);
      } else {
          out.println("<p class='error-message'>Error: Destination ID is missing or empty.</p>");
          return;
      }
  } catch (NumberFormatException e) {
      out.println("<p class='error-message'>Error: Invalid destination ID format. Please provide a valid number.</p>");
      return;
  }
%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Destination Details</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            margin: 0;
	            background-color: #f4f4f4;
	        }
	        .main-content {
	            padding: 20px;
	            max-width: 1200px;
	            margin: 20px auto;
	            background-color: #fff;
	            border-radius: 8px;
	            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
	        }
	        .destination-detail {
	            text-align: center;
	            margin-bottom: 40px;
	            padding-bottom: 20px;
	            border-bottom: 1px solid #eee;
	        }
	        .destination-detail h1 {
	            color: #333;
	            font-size: 2.5em;
	            margin-bottom: 10px;
	        }
	        .destination-main-image {
	            max-width: 100%;
	            height: auto;
	            border-radius: 8px;
	            margin-top: 20px;
	            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
	        }
	        .destination-caption {
	            font-style: italic;
	            color: #555;
	            margin-top: 15px;
	            font-size: 1.1em;
	        }
	        .destination-detail p {
	            color: #444;
	            line-height: 1.6;
	            text-align: left;
	            margin-top: 20px;
	        }
	
	        .packages-section {
	            margin-top: 40px;
	            padding-top: 20px;
	        }
	        .packages-section h2 {
	            text-align: center;
	            color: #007bff;
	            margin-bottom: 30px;
	            font-size: 2em;
	            border-bottom: 2px solid #007bff;
	            display: inline-block;
	            padding-bottom: 5px;
	            width: 100%;
	        }
	        .packages-grid {
	            display: grid;
	            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
	            gap: 25px;
	            justify-content: center;
	        }
	        .package-card {
	            background-color: #fff;
	            border: 1px solid #ddd;
	            border-radius: 10px;
	            box-shadow: 0 4px 8px rgba(0,0,0,0.08);
	            overflow: hidden;
	            text-align: center;
	            padding-bottom: 15px;
	            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
	            display: flex;
	            flex-direction: column;
	            justify-content: space-between;
	        }
	        .package-card:hover {
	            transform: translateY(-8px);
	            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
	        }
	        .package-card a {
	            text-decoration: none;
	            color: inherit;
	        }
	        .package-card img {
	            width: 100%;
	            height: 200px;
	            object-fit: cover;
	            border-bottom: 1px solid #eee;
	            margin-bottom: 10px;
	        }
	        .package-card h3 {
	            font-size: 1.4em;
	            margin: 10px 10px 5px;
	            color: #0056b3;
	            min-height: 2.8em;
	            display: -webkit-box;
	            -webkit-line-clamp: 2;
	            -webkit-box-orient: vertical;
	            overflow: hidden;
	            text-overflow: ellipsis;
	        }
	        .package-card p {
	            font-size: 0.95em;
	            color: #666;
	            margin: 5px 10px;
	        }
	        .back-home-button {
	            display: inline-block;
	            margin-top: 30px;
	            padding: 12px 25px;
	            background-color: #6c757d;
	            color: white;
	            text-decoration: none;
	            border-radius: 5px;
	            transition: background-color 0.3s ease;
	        }
	        .back-home-button:hover {
	            background-color: #5a6268;
	        }
	        .error-message, .not-found-message {
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
	      PreparedStatement psDestination = null;
	      ResultSet drs = null;
	      PreparedStatement psPackages = null;
	      ResultSet packageRs = null;
	
	      try {
	        conn = DatabaseConnection.getConnection();
	
	        // SELECT query for destination details - No longer need 'image_path' here
	        psDestination = conn.prepareStatement("SELECT destination_name, caption, description FROM destinations WHERE id=?");
	        psDestination.setInt(1, id);
	        drs = psDestination.executeQuery();
	
	        if(!drs.next()) {
	          out.println("<p class='not-found-message'>Destination not found with ID: " + id + ".</p>");
	          return;
	        }
	
	        String destinationName = drs.getString("destination_name");
	        String caption = drs.getString("caption");
	        String description = drs.getString("description");
	        // String imagePath = drs.getString("image_path"); // No longer retrieved directly here
	    %>
	        <div class="destination-detail">
	            <h1><%= destinationName %></h1>
	            <img src="${pageContext.request.contextPath}/GetDestinationImageServlet?id=<%= id %>" alt="<%= destinationName %>" class="destination-main-image">
	            <p class="destination-caption"><strong><%= caption %></strong></p>
	            <p><%= (description != null && !description.isEmpty()) ? description : "No detailed description available." %></p>
	        </div>
	
	        <div class="packages-section">
	            <h2>Available Packages for <%= destinationName %></h2>
	            <div class="packages-grid">
	            <%
	                // SELECT query for packages - Make sure to select 'id' for packages
	                // You'll need to add a BLOB column to your 'packages' table too,
	                // and create an 'AddPackageServlet' and 'GetPackageImageServlet' for packages.
	                psPackages = conn.prepareStatement("SELECT id, package_name, price, duration, tour_type FROM packages WHERE destination_id=?");
	                psPackages.setInt(1, id);
	                packageRs = psPackages.executeQuery();
	
	                if (!packageRs.next()) {
	                    out.println("<p>No packages found for this destination yet.</p>");
	                } else {
	                    do {
	                        int currentPackageId = packageRs.getInt("id");
	                        String currentPackageName = packageRs.getString("package_name");
	            %>
	                        <div class="package-card">
	                            <a href="package_details.jsp?package_id=<%= currentPackageId %>">
	                                <img src="${pageContext.request.contextPath}/GetPackageImageServlet?id=<%= currentPackageId %>" alt="<%= currentPackageName %>">
	                                <h3><%= currentPackageName %></h3>
	                                <p><strong>Price:</strong> <%= packageRs.getString("price") %></p>
	                                <p><strong>Duration:</strong> <%= packageRs.getString("duration") %></p>
	                                <p><strong>Type:</strong> <%= packageRs.getString("tour_type") %></p>
	                            </a>
	                        </div>
	            <%
	                    } while (packageRs.next());
	                }
	            %>
	            </div>
	        </div>
	
	    <%
	      } catch (SQLException e) {
	        e.printStackTrace();
	        out.println("<p class='error-message'>Error loading destination details. Please try again later.</p>");
	        out.println("<p class='error-message'>Developer Note: Database Error - " + e.getMessage() + "</p>");
	      } finally {
	        try { if (drs != null) drs.close(); } catch (SQLException e) { e.printStackTrace(); }
	        try { if (psDestination != null) psDestination.close(); } catch (SQLException e) { e.printStackTrace(); }
	        try { if (packageRs != null) packageRs.close(); } catch (SQLException e) { e.printStackTrace(); }
	        try { if (psPackages != null) psPackages.close(); } catch (SQLException e) { e.printStackTrace(); }
	        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	      }
	    %>
	    <div style="text-align: center; margin-top: 30px;">
	        <a href="index.jsp" class="back-home-button">Back to Home</a>
	    </div>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>