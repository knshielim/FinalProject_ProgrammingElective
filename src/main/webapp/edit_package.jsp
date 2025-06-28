<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Edit Package</title>
	    <link rel="stylesheet" href="css/style.css"> <%-- Adjust path to your CSS --%>
	    <style>
	        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
	        .container { max-width: 700px; margin: 0 auto; padding: 25px; background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
	        h1 { text-align: center; color: #333; margin-bottom: 25px; }
	        .form-group { margin-bottom: 15px; }
	        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; color: #555; }
	        .form-group input[type="text"],
	        .form-group input[type="number"],
	        .form-group textarea,
	        .form-group select {
	            width: calc(100% - 22px); /* Account for padding and border */
	            padding: 10px;
	            border: 1px solid #ccc;
	            border-radius: 4px;
	            font-size: 16px;
	        }
	        .form-group textarea { resize: vertical; min-height: 80px; }
	        .form-actions { text-align: center; margin-top: 30px; }
	        .form-actions button {
	            background-color: #007bff;
	            color: white;
	            padding: 12px 25px;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 18px;
	            transition: background-color 0.3s ease;
	            margin: 0 10px;
	        }
	        .form-actions button:hover { background-color: #0056b3; }
	        .form-actions a.button {
	            background-color: #6c757d;
	            color: white;
	            padding: 12px 25px;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 18px;
	            text-decoration: none;
	            transition: background-color 0.3s ease;
	        }
	        .form-actions a.button:hover { background-color: #5a6268; }
	        .message { padding: 10px; margin-bottom: 15px; border-radius: 5px; }
	        .message.success { background-color: #d4edda; color: #155724; border-color: #c3e6cb; }
	        .message.error { background-color: #f8d7da; color: #721c24; border-color: #f5c6cb; }
	    </style>
	</head>
	<body>
	    <div class="container">
	        <h1>Edit Package</h1>
	
	        <%-- Display messages --%>
	        <c:if test="${not empty requestScope.message}">
	            <div class="message ${requestScope.messageType}">${requestScope.message}</div>
	        </c:if>
	
	        <c:if test="${empty packageToEdit}">
	            <p>Package not found or invalid ID. Please return to the <a href="modifyPackage">package list</a>.</p>
	        </c:if>
	
	        <c:if test="${not empty packageToEdit}">
	            <form action="modifyPackage" method="post">
	                <input type="hidden" name="action" value="update">
	                <input type="hidden" name="id" value="${packageToEdit.id}">
	
	                <div class="form-group">
	                    <label for="packageName">Package Name:</label>
	                    <input type="text" id="packageName" name="packageName" value="${packageToEdit.packageName}" required>
	                </div>
	
	                <div class="form-group">
	                    <label for="destinationId">Destination:</label>
	                    <select id="destinationId" name="destinationId" required>
	                        <option value="">-- Select Destination --</option>
	                        <c:forEach var="dest" items="${destinations}">
	                            <option value="${dest.id}" <c:if test="${dest.id == packageToEdit.destinationId}">selected</c:if>>
	                                <c:out value="${dest.name}"/>
	                            </option>
	                        </c:forEach>
	                    </select>
	                </div>
	
	                <div class="form-group">
	                    <label for="imagePath">Image Path:</label>
	                    <input type="text" id="imagePath" name="imagePath" value="${packageToEdit.imagePath}">
	                </div>
	
	                <div class="form-group">
	                    <label for="price">Price:</label>
	                    <input type="text" id="price" name="price" value="${packageToEdit.price}">
	                </div>
	
	                <div class="form-group">
	                    <label for="duration">Duration:</label>
	                    <input type="text" id="duration" name="duration" value="${packageToEdit.duration}">
	                </div>
	
	                <div class="form-group">
	                    <label for="minPeople">Min. People:</label>
	                    <input type="text" id="minPeople" name="minPeople" value="${packageToEdit.minPeople}">
	                </div>
	
	                <div class="form-group">
	                    <label for="tourType">Tour Type:</label>
	                    <input type="text" id="tourType" name="tourType" value="${packageToEdit.tourType}">
	                </div>
	
	                <div class="form-group">
	                    <label for="tourCode">Tour Code:</label>
	                    <input type="text" id="tourCode" name="tourCode" value="${packageToEdit.tourCode}">
	                </div>
	
	                <div class="form-group">
	                    <label for="description">Description:</label>
	                    <textarea id="description" name="description">${packageToEdit.description}</textarea>
	                </div>
	
	                <div class="form-group">
	                    <label for="itinerary">Itinerary:</label>
	                    <textarea id="itinerary" name="itinerary">${packageToEdit.itinerary}</textarea>
	                </div>
	
	                <div class="form-group">
	                    <label for="priceDetails">Price Details:</label>
	                    <textarea id="priceDetails" name="priceDetails">${packageToEdit.priceDetails}</textarea>
	                </div>
	
	                <div class="form-group">
	                    <label for="hotel">Hotel:</label>
	                    <textarea id="hotel" name="hotel">${packageToEdit.hotel}</textarea>
	                </div>
	
	                <div class="form-group">
	                    <label for="remarks">Remarks:</label>
	                    <textarea id="remarks" name="remarks">${packageToEdit.remarks}</textarea>
	                </div>
	
	                <div class="form-actions">
	                    <button type="submit">Update Package</button>
	                    <a href="modifyPackage" class="button">Cancel</a>
	                </div>
	            </form>
	        </c:if>
	    </div>
	</body>
</html>