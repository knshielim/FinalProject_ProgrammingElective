<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Add New Package - Halabo Indonesia Tour Admin</title>
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
	    </style>
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	
	    <div class="admin-form-container">
	        <h2>Add New Package</h2>
	        <form action="AddPackageServlet" method="post">
	            <!-- Basic Info -->
	            <label for="title">Package Title:</label>
	            <input type="text" id="title" name="title" placeholder="e.g. 3D2N Bali (Beach Getaway)" required>
	
	            <label for="image">Image Filename:</label>
	            <input type="text" id="image" name="image" placeholder="e.g. bali_p1.jpg" required>
	
	            <label for="price">Price (From):</label>
	            <input type="text" id="price" name="price" placeholder="e.g. RM1,099.00" required>
	
	            <label for="duration">Duration:</label>
	            <input type="text" id="duration" name="duration" placeholder="e.g. 3 Days, 2 Nights" required>
	
	            <label for="minPeople">Minimum People:</label>
	            <input type="text" id="minPeople" name="minPeople" required>
	
	            <label for="tourType">Tour Type:</label>
	            <input type="text" id="tourType" name="tourType" required>
	
	            <label for="tourCode">Tour Code:</label>
	            <input type="text" id="tourCode" name="tourCode" required>
	
	            <!-- Tab Contents -->
	            <label for="description">Description Tab Content:</label>
	            <textarea id="description" name="description" rows="5" required></textarea>
	
	            <label for="itinerary">Itinerary Tab Content:</label>
	            <textarea id="itinerary" name="itinerary" rows="5" required></textarea>
	
	            <label for="priceDetails">Price Tab Content:</label>
	            <textarea id="priceDetails" name="priceDetails" rows="5" required></textarea>
	
	            <label for="hotel">Hotel Tab Content:</label>
	            <textarea id="hotel" name="hotel" rows="4" required></textarea>
	
	            <label for="remarks">Remarks Tab Content:</label>
	            <textarea id="remarks" name="remarks" rows="4" required></textarea>
	
	            <button type="submit">Create Package</button>
	        </form>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>
