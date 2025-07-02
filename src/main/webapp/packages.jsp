<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.halabo.util.DatabaseConnection" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Tour Packages - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	    <style>
	        .package-page-container { max-width: 1000px; margin: auto; padding: 40px 20px; }
	        h1 { text-align: center; color: #d92662; margin-bottom: 40px; }
	        .destination-section { margin-top: 40px; padding-bottom: 20px; border-bottom: 1px solid #eee; }
	        .destination-title {
	            font-size: 28px; margin-bottom: 20px; color: #222;
	            border-bottom: 2px solid #d92662; padding-bottom: 8px;
	        }
	        .package-links {
	            display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;
	        }
	        .package-links a {
	            display: flex; flex-direction: column; align-items: center;
	            width: 180px; padding: 15px; background-color: #fff; border: 1px solid #ddd;
	            border-radius: 8px; text-decoration: none; color: #333; font-weight: bold;
	            box-shadow: 0 2px 5px rgba(0,0,0,0.05); transition: transform 0.2s ease, box-shadow 0.2s ease;
	        }
	        .package-links a:hover {
	            transform: translateY(-5px); box-shadow: 0 4px 10px rgba(0,0,0,0.1); color: #d92662;
	        }
	        .package-links img {
	            width: 100%; height: 120px; object-fit: cover;
	            border-radius: 4px; margin-bottom: 10px;
	        }
	        .no-packages-found, .error-message {
	            text-align: center; margin-top: 15px; color: #777; font-style: italic;
	        }
	        .error-message {
	            color: red; font-weight: bold; background: #ffe6e6; padding: 10px;
	            border: 1px solid red; border-radius: 5px;
	        }
	    </style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		<div class="package-page-container">
		    <h1>Explore Our Tour Packages</h1>
		<%
		    Connection conn = null;
		    PreparedStatement psDest = null, psPkg = null;
		    ResultSet rsDest = null, rsPkg = null;
		
		    try {
		        conn = DatabaseConnection.getConnection();
		        psDest = conn.prepareStatement("SELECT id, destination_name FROM destinations ORDER BY destination_name ASC");
		        rsDest = psDest.executeQuery();
		
		        while (rsDest.next()) {
		            int destId = rsDest.getInt("id");
		            String destName = rsDest.getString("destination_name");
		%>
		    <div class="destination-section">
		        <div class="destination-title"><%= destName %></div>
		        <div class="package-links">
		<%
		            psPkg = conn.prepareStatement("SELECT id, package_name, image_path FROM packages WHERE destination_id = ?");
		            psPkg.setInt(1, destId);
		            rsPkg = psPkg.executeQuery();
		
		            boolean found = false;
		            while (rsPkg.next()) {
		                found = true;
		                int pkgId = rsPkg.getInt("id");
		                String pkgName = rsPkg.getString("package_name");
		                String imgPath = rsPkg.getString("image_path");
		                String fullImageURL = request.getContextPath() + "/" + imgPath;
		%>
		            <a href="package_details.jsp?package_id=<%= pkgId %>">
		                <img src="<%= fullImageURL %>" alt="Image of <%= pkgName %>"
		                     onerror="this.style.display='none'; this.nextElementSibling.style.display='inline';" />
		                <span style="display:none;">Image not found</span>
		                <%= pkgName %>
		            </a>
		<%
		            }
		            if (!found) {
		%>
		            <p class="no-packages-found">No packages available for this destination.</p>
		<%
		            }
		            if (rsPkg != null) rsPkg.close();
		            if (psPkg != null) psPkg.close();
		%>
		        </div>
		    </div>
		<%
		        } // end while destination
		    } catch (SQLException e) {
		        out.println("<p class='error-message'>Database error: " + e.getMessage() + "</p>");
		    } finally {
		        if (rsDest != null) rsDest.close();
		        if (psDest != null) psDest.close();
		        if (conn != null) conn.close();
		    }
		%>
		</div>
		<jsp:include page="footer.jsp"/>
	</body>
</html>
