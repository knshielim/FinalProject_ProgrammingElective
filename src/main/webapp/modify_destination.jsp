<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Modify Destination - Halabo Indonesia Tour Admin</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        .admin-form-container {
	            max-width: 600px;
	            margin: 40px auto;
	            padding: 30px;
	            background-color: #fefefe;
	            border-radius: 10px;
	            box-shadow: 0 0 8px rgba(0,0,0,0.1);
	        }
	
	        .admin-form-container h2 {
	            color: #d92662;
	            text-align: center;
	            margin-bottom: 25px;
	        }
	
	        .admin-form-container label {
	            font-weight: bold;
	            display: block;
	            margin: 15px 0 5px;
	        }
	
	        .admin-form-container input,
	        .admin-form-container textarea {
	            width: 100%;
	            padding: 10px;
	            border: 1px solid #aaa;
	            border-radius: 5px;
	            font-size: 16px;
	        }
	
	        .admin-form-container button {
	            margin-top: 20px;
	            width: 100%;
	            background-color: #d92662;
	            color: white;
	            border: none;
	            padding: 12px;
	            font-size: 16px;
	            border-radius: 5px;
	            cursor: pointer;
	        }
	
	        .admin-form-container button:hover {
	            background-color: #b71c4c;
	        }
	
	        .admin-form-container .message {
	            text-align: center;
	            margin-top: 20px;
	            font-weight: bold;
	        }
	
	        .success {
	            color: green;
	        }
	
	        .error {
	            color: red;
	        }
	
	        .destination-list {
	            margin-bottom: 30px;
	        }
	
	        .destination-item {
	            padding: 15px;
	            margin: 10px 0;
	            background-color: #f9f9f9;
	            border-radius: 5px;
	            border-left: 4px solid #d92662;
	        }
	
	        .destination-item h4 {
	            margin: 0 0 5px 0;
	            color: #333;
	        }
	
	        .destination-item p {
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
	            margin-top: 10px;
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
	            margin-top: 10px;
	            margin-left: 10px;
	        }
	
	        .delete-btn:hover {
	            background-color: #c82333;
	        }
	    </style>
	</head>
	<body>
	
	    <jsp:include page="header.jsp"/>
	
	    <div class="admin-form-container">
	        <h2>Modify Destinations</h2>
	
	        <!-- Display existing destinations -->
	        <div class="destination-list">
	            <h3>Existing Destinations:</h3>
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
	                    resultSet = statement.executeQuery("SELECT * FROM destinations ORDER BY id DESC");
	                    
	                    while (resultSet.next()) {
	                        int id = resultSet.getInt("id");
	                        String name = resultSet.getString("name");
	                        String location = resultSet.getString("location");
	                        String description = resultSet.getString("description");
	            %>
	                        <div class="destination-item">
	                            <h4><%= name %></h4>
	                            <p><strong>Location:</strong> <%= location %></p>
	                            <p><strong>Description:</strong> <%= description.length() > 100 ? description.substring(0, 100) + "..." : description %></p>
	                            <button class="edit-btn" onclick="editDestination(<%= id %>, '<%= name.replace("'", "\\'") %>', '<%= location.replace("'", "\\'") %>', '<%= description.replace("'", "\\'").replace("\n", "\\n") %>')">Edit</button>
	                            <button class="delete-btn" onclick="deleteDestination(<%= id %>)">Delete</button>
	                        </div>
	            <%
	                    }
	                } catch (Exception e) {
	                    out.println("<p class='error'>Error loading destinations: " + e.getMessage() + "</p>");
	                } finally {
	                    if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {}
	                    if (statement != null) try { statement.close(); } catch (SQLException e) {}
	                    if (connection != null) try { connection.close(); } catch (SQLException e) {}
	                }
	            %>
	        </div>
	
	        <!-- Edit form (initially hidden) -->
	        <div id="editForm" style="display: none;">
	            <h3>Edit Destination</h3>
	            <form action="${pageContext.request.contextPath}/ModifyDestinationServlet" method="post">
	                <input type="hidden" id="editId" name="id">
	                
	                <label for="editName">Destination Name:</label>
	                <input type="text" id="editName" name="name" required>
	
	                <label for="editLocation">Location:</label>
	                <input type="text" id="editLocation" name="location" required>
	
	                <label for="editDescription">Description:</label>
	                <textarea id="editDescription" name="description" rows="5" required></textarea>
	
	                <button type="submit" name="action" value="update">Update Destination</button>
	                <button type="button" onclick="cancelEdit()" style="background-color: #6c757d; margin-left: 10px;">Cancel</button>
	            </form>
	        </div>
	
	        <!-- Delete form (hidden) -->
	        <form id="deleteForm" action="${pageContext.request.contextPath}/ModifyDestinationServlet" method="post" style="display: none;">
	            <input type="hidden" id="deleteId" name="id">
	            <input type="hidden" name="action" value="delete">
	        </form>
	
	        <%-- Success/failure message --%>
	        <%
	            String status = request.getParameter("status");
	            if ("updated".equals(status)) {
	        %>
	            <div class="message success">Destination updated successfully!</div>
	        <%
	            } else if ("deleted".equals(status)) {
	        %>
	            <div class="message success">Destination deleted successfully!</div>
	        <%
	            } else if ("error".equals(status)) {
	        %>
	            <div class="message error">Operation failed. Please try again.</div>
	        <%
	            }
	        %>
	    </div>
	
	    <script>
	        function editDestination(id, name, location, description) {
	            document.getElementById('editId').value = id;
	            document.getElementById('editName').value = name;
	            document.getElementById('editLocation').value = location;
	            document.getElementById('editDescription').value = description;
	            document.getElementById('editForm').style.display = 'block';
	            document.getElementById('editForm').scrollIntoView();
	        }
	
	        function cancelEdit() {
	            document.getElementById('editForm').style.display = 'none';
	        }
	
	        function deleteDestination(id) {
	            if (confirm('Are you sure you want to delete this destination? This action cannot be undone.')) {
	                document.getElementById('deleteId').value = id;
	                document.getElementById('deleteForm').submit();
	            }
	        }
	    </script>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>