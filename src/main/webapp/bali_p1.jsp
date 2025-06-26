<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Bali Package 1 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
	
		<div class="package-container">
		    <h1>3D2N Bali (Beach Getaway) – Ocean Breeze Hotel</h1>
		    
		    <div class="package-banner">
    			<img src="images/bali_p1.jpg" alt="Beach Getaway">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,099.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Leisure, Scenic</p>
		        <p><strong>Tour Code:</strong> HALA-BALI-ESC</p>
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
		        <p>Escape to the magical island of Bali where azure waters meet white sand beaches. This leisure package offers a laid-back island holiday with time for local cuisine, gentle beach walks, and scenic temple visits perfect for couples or friends.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 2 nights at Ocean Breeze Hotel (4★)</li>
		            <li>✅ Daily breakfast and one beachside dinner</li>
		            <li>✅ Sunset Uluwatu Temple tour</li>
		            <li>✅ Roundtrip airport transfers</li>
		            <li>❌ Flights to/from Bali</li>
		            <li>❌ Personal travel insurance</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival in Bali, check-in, sunset beach stroll</li>
		            <li><strong>Day 2:</strong> Morning leisure time, Uluwatu Temple tour, beachside dinner</li>
		            <li><strong>Day 3:</strong> Local craft market visit, return transfer</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>1,099</td></tr>
		            <tr><td>4-6 pax</td><td>1,059</td></tr>
		            <tr><td>7 pax and above</td><td>999</td></tr>
		        </table>
		        <p>Ask us about honeymoon room decorations or Balinese massage add-ons!</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Ocean Breeze Hotel – A beachfront 4-star escape with scenic views, tropical gardens, and direct access to Legian Beach. Amenities include a pool bar, yoga corner, and spa lounge.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Rates are valid for the mentioned travel period only.</li>
		            <li>Bookings subject to room availability at time of reservation.</li>
		            <li>Deposit of 50% is required to confirm your reservation.</li>
		            <li>Cancellation policy applies with tiered penalties based on advance notice.</li>
		        </ul>
		    </div>
			
			<div class="back-button">
		    	<button onclick="history.back()" class="back-btn">← Back</button>
			</div>
			<div class="booking-button">
		    	<a href="booking.jsp?package=Beach Getaway">Book Now</a>
		    </div>
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=Beach Getaway">Enquire Now</a>
		    </div>
		</div>
		
		<jsp:include page="footer.jsp"/>
		<script src="tabs.js"></script>
	</body>
</html>
