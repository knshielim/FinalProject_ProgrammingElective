<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.halabo.util.DatabaseConnection" %>

<%
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }

    int packageId = 0;
    String idParam = request.getParameter("package_id");
    if (idParam != null) {
        try {
            packageId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("modify_package.jsp?message=Invalid+Package+ID&messageType=error");
            return;
        }
    }

    Connection conn = null;
    PreparedStatement ps = null, psDest = null;
    ResultSet rs = null, destinationRs = null;

    String packageName = "", duration = "", minPeople = "", tourType = "", tourCode = "", description = "", itinerary = "", priceDetails = "", hotel = "", remarks = "", price = "", imagePath = "";
    int destinationId = 0;
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Edit Package - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	</head>
	<body>
	
	<jsp:include page="header.jsp"/>
	
	<div class="form-container-admin">
	    <h2>Edit Tour Package</h2>
	
	    <%
	        try {
	            conn = DatabaseConnection.getConnection();
	            ps = conn.prepareStatement("SELECT * FROM packages WHERE id = ?");
	            ps.setInt(1, packageId);
	            rs = ps.executeQuery();
	
	            if (rs.next()) {
	                packageName = rs.getString("package_name");
	                destinationId = rs.getInt("destination_id");
	                imagePath = rs.getString("image_path");
	                price = rs.getString("price");
	                duration = rs.getString("duration");
	                minPeople = rs.getString("min_people");
	                tourType = rs.getString("tour_type");
	                tourCode = rs.getString("tour_code");
	                description = rs.getString("description");
	                itinerary = rs.getString("itinerary");
	                priceDetails = rs.getString("price_details");
	                hotel = rs.getString("hotel");
	                remarks = rs.getString("remarks");
	            } else {
	                out.println("<div class='form-message error'>Package not found.</div>");
	            }
	    %>
	
	    <form action="ModifyPackageServlet" method="post" enctype="multipart/form-data">
	        <input type="hidden" name="packageId" value="<%= packageId %>">
	
	        <label for="destinationId">Destination:</label>
	        <select name="destinationId" id="destinationId" required>
	            <option value="">-- Select Destination --</option>
	            <%
	                psDest = conn.prepareStatement("SELECT id, destination_name FROM destinations");
	                destinationRs = psDest.executeQuery();
	                while (destinationRs.next()) {
	                    int destId = destinationRs.getInt("id");
	                    String destName = destinationRs.getString("destination_name");
	                    String selected = (destId == destinationId) ? "selected" : "";
	            %>
	                <option value="<%= destId %>" <%= selected %>><%= destName %></option>
	            <%
	                }
	            %>
	        </select>
	
	        <label>Package Name:</label>
	        <input type="text" name="packageName" value="<%= packageName %>" required>
	
	        <label>Description:</label>
	        <textarea name="description" required><%= description %></textarea>
	
	        <label>Itinerary:</label>
	        <textarea name="itinerary"><%= itinerary %></textarea>
	
	        <label>Price Details:</label>
	        <textarea name="priceDetails"><%= priceDetails %></textarea>
	
	        <label>Hotel:</label>
	        <textarea name="hotel"><%= hotel %></textarea>
	
	        <label>Remarks:</label>
	        <textarea name="remarks"><%= remarks %></textarea>
	
	        <label>Tour Type:</label>
	        <input type="text" name="tourType" value="<%= tourType %>">
	
	        <label>Tour Code:</label>
	        <input type="text" name="tourCode" value="<%= tourCode %>">
	
	        <label>Min People:</label>
	        <input type="text" name="minPeople" value="<%= minPeople %>">
	
	        <label>Duration:</label>
	        <input type="text" name="duration" value="<%= duration %>" required>
	
	        <label>Price (RM):</label>
	        <input type="text" name="price" value="<%= price %>" required>
	
	        <label>Current Image:</label>
	        <img src="<%= request.getContextPath() + "/" + imagePath %>" alt="Current Image" class="image-preview"
	             onerror="this.style.display='none'; this.nextElementSibling.style.display='inline';" />
	        <span style="display:none;">Image not found</span>
	
	        <label>Change Image:</label>
	        <input type="file" name="imageFile" accept="image/*">
	
	        <button type="submit">Update Package</button>
	    </form>
	
	    <a href="modify_package.jsp" class="back-link">← Back to Package List</a>
	
	</div>
	
	<%
	        } catch (Exception e) {
	            out.println("<div class='form-message error'>Error loading package: " + e.getMessage() + "</div>");
	        } finally {
	            if (rs != null) try { rs.close(); } catch (Exception ignored) {}
	            if (ps != null) try { ps.close(); } catch (Exception ignored) {}
	            if (destinationRs != null) try { destinationRs.close(); } catch (Exception ignored) {}
	            if (psDest != null) try { psDest.close(); } catch (Exception ignored) {}
	            if (conn != null) try { conn.close(); } catch (Exception ignored) {}
	        }
	%>
	
	<jsp:include page="footer.jsp"/>
	</body>
</html>
