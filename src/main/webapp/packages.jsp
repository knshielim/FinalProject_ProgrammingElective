<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.halabo.util.DatabaseConnection" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>All Packages - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
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
		        } 
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
