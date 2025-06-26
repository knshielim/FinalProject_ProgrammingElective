<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Modify Package - Halabo Indonesia Tour Admin</title>
	    <link rel="stylesheet" href="styles.css">
	    <style>
	        .admin-form-container {
	            max-width: 900px;
	            margin: 40px auto;
	            padding: 30px;
	            background: #fff;
	            box-shadow: 0 0 8px rgba(0,0,0,0.1);
	            border-radius: 10px;
	        }
	
	        .admin-form-container h2 {
	            color: #d92662;
	            text-align: center;
	        }
	
	        .admin-form-container label {
	            display: block;
	            margin-top: 15px;
	            font-weight: bold;
	        }
	
	        .admin-form-container input[type="text"],
	        .admin-form-container textarea {
	            width: 100%;
	            padding: 10px;
	            font-size: 15px;
	            margin-top: 5px;
	            border: 1px solid #ccc;
	            border-radius: 6px;
	        }
	
	        .admin-form-container button {
	            margin-top: 25px;
	            width: 100%;
	            background-color: #d92662;
	            color: white;
	            border: none;
	            padding: 12px;
	            font-size: 16px;
	            border-radius: 6px;
	            cursor: pointer;
	        }
	
	        .admin-form-container button:hover {
	            background-color: #b71c4c;
	        }
	
	        .package-list {
	            margin-bottom: 30px;
	        }
	
	        .package-item {
	            padding: 20px;
	            margin: 15px 0;
	            background-color: #f8f9fa;
	            border-radius: 5px;
	            border-left: 4px solid #d92662;
	        }
	
	        .package-item h4 {
	            margin: 0 0 10px 0;
	            color: #333;
	            font-size: 18px;
	        }
	
	        .package-info {
	            display: grid;
	            grid-template-columns: 1fr 1fr;
	            gap: 10px;
	            margin-bottom: 15px;
	        }
	
	        .package-info p {
	            margin: 5px 0;
	            color: #666;
	        }
	
	        .edit-btn {
	            background-color: #28a745;
	            color: white;
	            padding: 8px 15px;
	            border: none;
	            border-radius: 4px;
	            cursor: pointer;
	            font-size: 14px;
	            margin-right: 10px;
	        }
	
	        .edit-btn:hover {
	            background-color: #218838;
	        }
	
	        .delete-btn {
	            background-color: #dc3545;
	            color: white;
	            padding: 8px 15px;
	            border: none;
	            border-radius: 4px;
	            cursor: pointer;
	            font-size: 14px;
	        }
	
	        .delete-btn:hover {
	            background-color: #c82333;
	        }
	
	        .message {
	            text-align: center;
	            margin: 20px 0;
	            font-weight: bold;
	        }
	
	        .success {
	            color: green;
	        }
	
	        .error {
	            color: red;
	        }
	
	        #editForm {
	            border-top: 2px solid #d92662;
	            padding-top: 30px;
	            margin-top: 30px;
	        }
	    </style>
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	
	    <div class="admin-form-container">
	        <h2>Modify Packages</h2>
	
	        <!-- Display existing packages -->
	        <div class="package-list">
	            <h3>Existing Packages:</h3>
	            <%
	                // Database connection parameters - adjust these to your database
	                String jdbcURL = "jdbc:mysql://localhost:3306/halabo_tour";
	                String dbUser = "root";
	                String dbPassword = "";
	                
	                Connection connection = null;
	                Statement statement = null;
	                ResultSet resultSet = null;
	                
	                try {
	                    Class.forName("com.mysql.cj.jdbc.Driver");
	                    connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	                    statement = connection.createStatement();
	                    resultSet = statement.executeQuery("SELECT * FROM packages ORDER BY id DESC");
	                    
	                    while (resultSet.next()) {
	                        int id = resultSet.getInt("id");
	                        String title = resultSet.getString("title");
	                        String image = resultSet.getString("image");
	                        String price = resultSet.getString("price");
	                        String duration = resultSet.getString("duration");
	                        String minPeople = resultSet.getString("min_people");
	                        String tourType = resultSet.getString("tour_type");
	                        String tourCode = resultSet.getString("tour_code");
	                        String description = resultSet.getString("description");
	                        String itinerary = resultSet.getString("itinerary");
	                        String priceDetails = resultSet.getString("price_details");
	                        String hotel = resultSet.getString("hotel");
	                        String remarks = resultSet.getString("remarks");
	            %>
	                        <div class="package-item">
	                            <h4><%= title %></h4>
	                            <div class="package-info">
	                                <p><strong>Price:</strong> <%= price %></p>
	                                <p><strong>Duration:</strong> <%= duration %></p>
	                                <p><strong>Min People:</strong> <%= minPeople %></p>
	                                <p><strong>Tour Type:</strong> <%= tourType %></p>
	                                <p><strong>Tour Code:</strong> <%= tourCode %></p>
	                                <p><strong>Image:</strong> <%= image %></p>
	                            </div>
	                            <p><strong>Description:</strong> <%= description != null && description.length() > 150 ? description.substring(0, 150) + "..." : (description != null ? description : "") %></p>
	                            <div style="margin-top: 15px;">
	                                <button class="edit-btn" onclick="editPackage(<%= id %>, 
	                                    '<%= title.replace("'", "\\'") %>', 
	                                    '<%= image.replace("'", "\\'") %>', 
	                                    '<%= price.replace("'", "\\'") %>', 
	                                    '<%= duration.replace("'", "\\'") %>', 
	                                    '<%= minPeople.replace("'", "\\'") %>', 
	                                    '<%= tourType.replace("'", "\\'") %>', 
	                                    '<%= tourCode.replace("'", "\\'") %>', 
	                                    '<%= description != null ? description.replace("'", "\\'").replace("\n", "\\n") : "" %>', 
	                                    '<%= itinerary != null ? itinerary.replace("'", "\\'").replace("\n", "\\n") : "" %>', 
	                                    '<%= priceDetails != null ? priceDetails.replace("'", "\\'").replace("\n", "\\n") : "" %>', 
	                                    '<%= hotel != null ? hotel.replace("'", "\\'").replace("\n", "\\n") : "" %>', 
	                                    '<%= remarks != null ? remarks.replace("'", "\\'").replace("\n", "\\n") : "" %>')">Edit</button>
	                                <button class="delete-btn" onclick="deletePackage(<%= id %>)">Delete</button>
	                            </div>
	                        </div>
	            <%
	                    }
	                } catch (Exception e) {
	                    out.println("<p class='error'>Error loading packages: " + e.getMessage() + "</p>");
	                } finally {
	                    if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {}
	                    if (statement != null) try { statement.close(); } catch (SQLException e) {}
	                    if (connection != null) try { connection.close(); } catch (SQLException e) {}
	                }
	            %>
	        </div>
	
	        <!-- Edit form (initially hidden) -->
	        <div id="editForm" style="display: none;">
	            <h3>Edit Package</h3>
	            <form action="${pageContext.request.contextPath}/ModifyPackageServlet" method="post">
	                <input type="hidden" id="editId" name="id">
	                
	                <!-- Basic Info -->
	                <label for="editTitle">Package Title:</label>
	                <input type="text" id="editTitle" name="title" required>
	
	                <label for="editImage">Image Filename:</label>
	                <input type="text" id="editImage" name="image" required>
	
	                <label for="editPrice">Price (From):</label>
	                <input type="text" id="editPrice" name="price" required>
	
	                <label for="editDuration">Duration:</label>
	                <input type="text" id="editDuration" name="duration" required>
	
	                <label for="editMinPeople">Minimum People:</label>
	                <input type="text" id="editMinPeople" name="minPeople" required>
	
	                <label for="editTourType">Tour Type:</label>
	                <input type="text" id="editTourType" name="tourType" required>
	
	                <label for="editTourCode">Tour Code:</label>
	                <input type="text" id="editTourCode" name="tourCode" required>
	
	                <!-- Tab Contents -->
	                <label for="editDescription">Description Tab Content:</label>
	                <textarea id="editDescription" name="description" rows="5" required></textarea>
	
	                <label for="editItinerary">Itinerary Tab Content:</label>
	                <textarea id="editItinerary" name="itinerary" rows="5" required></textarea>
	
	                <label for="editPriceDetails">Price Tab Content:</label>
	                <textarea id="editPriceDetails" name="priceDetails" rows="5" required></textarea>
	
	                <label for="editHotel">Hotel Tab Content:</label>
	                <textarea id="editHotel" name="hotel" rows="4" required></textarea>
	
	                <label for="editRemarks">Remarks Tab Content:</label>
	                <textarea id="editRemarks" name="remarks" rows="4" required></textarea>
	
	                <button type="submit" name="action" value="update">Update Package</button>
	                <button type="button" onclick="cancelEdit()" style="background-color: #6c757d; margin-left: 10px; width: auto; padding: 12px 20px;">Cancel</button>
	            </form>
	        </div>
	
	        <!-- Delete form (hidden) -->
	        <form id="deleteForm" action="${pageContext.request.contextPath}/ModifyPackageServlet" method="post" style="display: none;">
	            <input type="hidden" id="deleteId" name="id">
	            <input type="hidden" name="action" value="delete">
	        </form>
	
	        <%-- Success/failure message --%>
	        <%
	            String status = request.getParameter("status");
	            if ("updated".equals(status)) {
	        %>
	            <div class="message success">Package updated successfully!</div>
	        <%
	            } else if ("deleted".equals(status)) {
	        %>
	            <div class="message success">Package deleted successfully!</div>
	        <%
	            } else if ("error".equals(status)) {
	        %>
	            <div class="message error">Operation failed. Please try again.</div>
	        <%
	            }
	        %>
	    </div>
	
	    <script>
	        function editPackage(id, title, image, price, duration, minPeople, tourType, tourCode, description, itinerary, priceDetails, hotel, remarks) {
	            document.getElementById('editId').value = id;
	            document.getElementById('editTitle').value = title;
	            document.getElementById('editImage').value = image;
	            document.getElementById('editPrice').value = price;
	            document.getElementById('editDuration').value = duration;
	            document.getElementById('editMinPeople').value = minPeople;
	            document.getElementById('editTourType').value = tourType;
	            document.getElementById('editTourCode').value = tourCode;
	            document.getElementById('editDescription').value = description;
	            document.getElementById('editItinerary').value = itinerary;
	            document.getElementById('editPriceDetails').value = priceDetails;
	            document.getElementById('editHotel').value = hotel;
	            document.getElementById('editRemarks').value = remarks;
	            document.getElementById('editForm').style.display = 'block';
	            document.getElementById('editForm').scrollIntoView();
	        }
	
	        function cancelEdit() {
	            document.getElementById('editForm').style.display = 'none';
	        }
	
	        function deletePackage(id) {
	            if (confirm('Are you sure you want to delete this package? This action cannot be undone.')) {
	                document.getElementById('deleteId').value = id;
	                document.getElementById('deleteForm').submit();
	            }
	        }
	    </script>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>