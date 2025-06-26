<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Lake Toba Package 2 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>4D3N Lake Toba (Adventure Discovery) – Summit Eco Lodge</h1>
		    
		    <div class="package-banner">
    			<img src="images/laketoba_p2.jpg" alt="Adventure Discovery">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM999.00</p>
		        <p><strong>Duration:</strong> 4 Days, 3 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Adventure, Nature</p>
		        <p><strong>Tour Code:</strong> HALA-TOBA-ADV</p>
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
		        <p>This package is tailored for adventure seekers wanting to explore the raw beauty of Lake Toba. Hike scenic trails, kayak on the lake, and discover hidden waterfalls while still enjoying local hospitality and traditions.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 3 nights at Summit Eco Lodge</li>
		            <li>✅ Guided jungle trek and waterfall visit</li>
		            <li>✅ Kayaking experience on Lake Toba</li>
		            <li>✅ 3 breakfasts, 2 lunches, and 1 dinner</li>
		            <li>✅ Entrance fees to eco-parks</li>
		            <li>❌ Flights to Medan</li>
		            <li>❌ Extra meals and drinks</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrive in Medan, transfer to lodge, welcome dinner and campfire</li>
		            <li><strong>Day 2:</strong> Jungle hike to Sipiso-Piso Waterfall, picnic lunch, return and rest</li>
		            <li><strong>Day 3:</strong> Morning kayak on the lake, cultural exploration in local village</li>
		            <li><strong>Day 4:</strong> Sunrise lakefront breakfast, transfer to Medan airport</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>999</td></tr>
		            <tr><td>4-6 pax</td><td>959</td></tr>
		            <tr><td>7 pax and above</td><td>929</td></tr>
		        </table>
		        <p>Note: Adventure gear (boots, kayak) provided. Participants must be physically fit for moderate hiking.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Summit Eco Lodge – Located on a hillside near Lake Toba, this eco-friendly lodge blends comfort and sustainability with guided tours and green dining experiences.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Eco tours are subject to availability based on weather.</li>
		            <li>Minimum age: 12 years old for trekking and kayaking activities.</li>
		            <li>Bookings require confirmation 10 days prior to travel.</li>
		            <li>50% deposit needed. Cancellation within 7 days forfeits deposit.</li>
		        </ul>
		    </div>
		
			<div class="back-button">
		    	<button onclick="history.back()" class="back-btn">← Back</button>
			</div>
			<div class="booking-button">
		    	<a href="booking.jsp?package=Adventure Discovery">Book Now</a>
		    </div>
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=Adventure Discovery">Enquire Now</a>
		    </div>
		</div>
		
		<jsp:include page="footer.jsp"/>
		<script src="tabs.js"></script>
	</body>
</html>
