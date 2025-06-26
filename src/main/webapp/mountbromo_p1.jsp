<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Mount Bromo Package 1 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>2D1N Mount Bromo (Sunrise Experience) – Bromo Hillside Lodge</h1>
		    
		    <div class="package-banner">
    			<img src="images/mountbromo_p1.jpg" alt="Sunrise Experience">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM599.00</p>
		        <p><strong>Duration:</strong> 2 Days, 1 Night</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Nature, Scenic</p>
		        <p><strong>Tour Code:</strong> HALA-BROMO-SUN</p>
		    </div>
		
		    <div class="tabs">
		        <button class="tab-btn active">Description</button>
		        <button class="tab-btn">Itinerary</button>
		        <button class="tab-btn">Price</button>
		        <button class="tab-btn">Hotel</button>
		        <button class="tab-btn">Remarks</button>
		    </div>
		
		    <div class="tab-content active">
		        <h2>Overview</h2>
		        <p>This quick getaway is perfect for travelers seeking an awe-inspiring sunrise view of Mount Bromo. The package includes a scenic 4WD jeep ride across the Tengger Caldera and a brief hike to the sunrise viewpoint, followed by crater exploration.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 1 night stay at Bromo Hillside Lodge (2★)</li>
		            <li>✅ Return 4WD jeep transfer to sunrise point</li>
		            <li>✅ Entrance to Mount Bromo National Park</li>
		            <li>✅ Local guide service</li>
		            <li>✅ Breakfast after sunrise tour</li>
		            <li>❌ Meals not mentioned in itinerary</li>
		            <li>❌ Travel insurance</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival at Bromo Hillside Lodge, rest & dinner at leisure</li>
		            <li><strong>Day 2:</strong> 3AM jeep transfer to viewpoint, sunrise tour, crater visit, breakfast, departure</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>599</td></tr>
		            <tr><td>4-6 pax</td><td>549</td></tr>
		            <tr><td>7 pax and above</td><td>529</td></tr>
		        </table>
		        <p>Children under 5 years old travel free (no bed). Optional horse ride to crater rim available on-site.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Bromo Hillside Lodge – A basic but scenic 2-star stay near Mount Bromo, featuring warm bedding, local meals, and panoramic views of the volcano range.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Tour timing is weather dependent and may change due to volcanic activity.</li>
		            <li>Warm clothing is highly recommended for early morning tours.</li>
		            <li>Advance booking required for weekends and public holidays.</li>
		            <li>Minimum 2 persons per booking.</li>
		        </ul>
		    </div>
		
			<div class="back-button">
		    	<button onclick="history.back()" class="back-btn">← Back</button>
			</div>
			<div class="booking-button">
		    	<a href="booking.jsp?package=Sunrise Experience">Book Now</a>
		    </div>
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=Sunrise Experience">Enquire Now</a>
		    </div>
		</div>
		
		<jsp:include page="footer.jsp"/>
		<script src="tabs.js"></script>
	</body>
</html>
