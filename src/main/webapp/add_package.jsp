<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.halabo.util.DatabaseConnection" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Add New Package - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<%
		    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
		    if (isAdmin == null || !isAdmin) {
		        response.sendRedirect("login.jsp?error=unauthorized");
		        return;
		    }
		%>
		
		<div class="form-container-admin">
		    <h2>Add Tour Package</h2>
		
		    <%
		        String message = (String) request.getAttribute("message");
		        String messageType = (String) request.getAttribute("messageType");
		        if (message != null) {
		    %>
		    <div class="form-message <%= messageType %>"><%= message %></div>
		    <% } %>
		
		    <form action="AddPackageServlet" method="post" enctype="multipart/form-data">
		        <label>Destination:</label>
		        <select name="destinationId" required>
		            <option value="">-- Select Destination --</option>
		            <%
		                try (Connection conn = DatabaseConnection.getConnection();
		                     PreparedStatement ps = conn.prepareStatement("SELECT id, destination_name FROM destinations");
		                     ResultSet rs = ps.executeQuery()) {
		                    while (rs.next()) {
		            %>
		                <option value="<%= rs.getInt("id") %>"><%= rs.getString("destination_name") %></option>
		            <%
		                    }
		                } catch (Exception e) {
		                    out.println("<option disabled>Error loading destinations</option>");
		                }
		            %>
		        </select>
		
		        <label>Package Name:</label>
		        <input type="text" name="packageName" required>
		
		        <label>Description:</label>
		        <textarea name="description" required></textarea>
		
		        <label>Itinerary:</label>
		        <textarea name="itinerary"></textarea>
		
		        <label>Price Details:</label>
		        <textarea name="priceDetails"></textarea>
		
		        <label>Hotel:</label>
		        <textarea name="hotel"></textarea>
		
		        <label>Remarks:</label>
		        <textarea name="remarks"></textarea>
		
		        <label>Tour Type:</label>
		        <input type="text" name="tourType" required>
		
		        <label>Tour Code:</label>
		        <input type="text" name="tourCode">
		
		        <label>Min People:</label>
		        <input type="text" name="minPeople">
		
		        <label>Duration:</label>
		        <input type="text" name="duration" required>
		
		        <label>Price:</label>
		        <input type="text" name="price" required>
		
		        <label>Upload Image:</label>
		        <input type="file" name="imageFile" accept="image/*" required>
		
		        <button type="submit">Add Package</button>
		    </form>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</body>
</html>
