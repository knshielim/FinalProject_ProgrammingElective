<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.halabo.util.DatabaseConnection" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    int id = 0;
    try {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.trim().isEmpty()) {
            id = Integer.parseInt(idParam);
        } else {
            out.println("<p class='error-message'>Error: Destination ID is missing.</p>");
            return;
        }
    } catch (NumberFormatException e) {
        out.println("<p class='error-message'>Invalid destination ID.</p>");
        return;
    }
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Destination Details - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="main-content">
		<%
		    Connection conn = null;
		    PreparedStatement psDestination = null, psPackages = null;
		    ResultSet drs = null, packageRs = null;
		
		    try {
		        conn = DatabaseConnection.getConnection();
		        psDestination = conn.prepareStatement("SELECT destination_name, caption, description, image_path FROM destinations WHERE id=?");
		        psDestination.setInt(1, id);
		        drs = psDestination.executeQuery();
		
		        if (!drs.next()) {
		            out.println("<p class='error-message'>Destination not found.</p>");
		            return;
		        }
		
		        String destinationName = drs.getString("destination_name");
		        String caption = drs.getString("caption");
		        String description = drs.getString("description");
		        String imagePath = drs.getString("image_path");
		        String fullImageURL = request.getContextPath() + "/" + imagePath;
		%>
		
		    <div class="destination-detail">
		        <h1><%= destinationName %></h1>
		        <img src="<%= fullImageURL %>" alt="Image of <%= destinationName %>" class="destination-main-image"
		             onerror="this.style.display='none'; this.nextElementSibling.style.display='inline';" />
		        <span style="display:none;">Image not found</span>
		        <p><i><%= caption %></i></p>
		        <p><%= description %></p>
		    </div>
		
		    <div class="packages-section">
		        <h2>Available Packages</h2>
		        <div class="packages-grid">
		        <%
		            psPackages = conn.prepareStatement("SELECT id, package_name, image_path, price, duration, tour_type FROM packages WHERE destination_id=?");
		            psPackages.setInt(1, id);
		            packageRs = psPackages.executeQuery();
		
		            boolean hasPackages = false;
		            while (packageRs.next()) {
		                hasPackages = true;
		                int pkgId = packageRs.getInt("id");
		                String pkgName = packageRs.getString("package_name");
		                String pkgImagePath = packageRs.getString("image_path");
		                String pkgImageURL = request.getContextPath() + "/" + pkgImagePath;
		        %>
		            <div class="package-card">
		                <a href="package_details.jsp?package_id=<%= pkgId %>">
		                    <img src="<%= pkgImageURL %>" alt="Image of <%= pkgName %>"
		                         onerror="this.style.display='none'; this.nextElementSibling.style.display='inline';" />
		                    <span style="display:none;">Image not found</span>
		                    <h3><%= pkgName %></h3>
		                    <p><strong>Price:</strong> <%= packageRs.getString("price") %></p>
		                    <p><strong>Duration:</strong> <%= packageRs.getString("duration") %></p>
		                    <p><strong>Type:</strong> <%= packageRs.getString("tour_type") %></p>
		                </a>
		            </div>
		        <%
		            }
		            if (!hasPackages) {
		                out.println("<p>No packages found for this destination.</p>");
		            }
		        %>
		        </div>
		    </div>
		
		<%
		    } catch (SQLException e) {
		        out.println("<p class='error-message'>Database error: " + e.getMessage() + "</p>");
		    } finally {
		        if (drs != null) drs.close();
		        if (psDestination != null) psDestination.close();
		        if (packageRs != null) packageRs.close();
		        if (psPackages != null) psPackages.close();
		        if (conn != null) conn.close();
		    }
		%>
		
		    <div style="text-align: center; margin-top: 30px;">
		        <a href="index.jsp" class="back-home-button">Back to Home</a>
		    </div>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</body>
</html>
