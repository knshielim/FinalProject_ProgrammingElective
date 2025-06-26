<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Labuan Bajo Package 3 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>3D2N Labuan Bajo (Romantic Escape) – Sunset View Villas</h1>
		    
		    <div class="package-banner">
    			<img src="images/labuanbajo_p3.jpg" alt="Romantic Escape">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,399.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Honeymoon, Relaxation</p>
		        <p><strong>Tour Code:</strong> HALA-LAB-ROM</p>
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
		        <p>This package is crafted for couples seeking a romantic and peaceful retreat. From sunset cruises and candlelit dinners to island strolls and private snorkeling, every detail is planned to offer a dreamy and memorable escape in the heart of Labuan Bajo’s paradise.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 2 nights’ stay at Sunset View Villas (honeymoon suite)</li>
		            <li>✅ Welcome flower arrangement and mocktail</li>
		            <li>✅ Sunset cruise with light snacks</li>
		            <li>✅ Guided island walk and snorkeling trip</li>
		            <li>✅ Daily breakfast and 1 candlelight dinner</li>
		            <li>❌ Flights to Labuan Bajo</li>
		            <li>❌ Additional meals and optional spa treatments</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival, romantic room setup, evening cruise on Flores Sea</li>
		            <li><strong>Day 2:</strong> Leisure breakfast, guided trip to Seraya Island for private snorkeling, candlelight dinner by the sea</li>
		            <li><strong>Day 3:</strong> Free morning for spa or beach walk, check-out and airport transfer</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Couple (RM)</th></tr>
		            <tr><td>Standard Rate</td><td>1,399</td></tr>
		            <tr><td>With Spa Add-on</td><td>1,599</td></tr>
		            <tr><td>Premium Suite Upgrade</td><td>1,749</td></tr>
		        </table>
		        <p>Note: Romantic cruise is subject to favorable weather. Flexible rescheduling available in case of rain.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Sunset View Villas – Elegant cliffside resort offering premium suites with ocean views, romantic setups, private balconies, and in-room dining service. Perfect for honeymooners and special occasions.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Honeymoon packages are available year-round, but peak season surcharges apply during major holidays.</li>
		            <li>Non-refundable 60% deposit required to confirm honeymoon suite reservation.</li>
		            <li>Custom photography or spa packages available on request.</li>
		            <li>Early check-in and late check-out requests are subject to availability.</li>
		        </ul>
		    </div>
		
			<div class="back-button">
		    	<button onclick="history.back()" class="back-btn">← Back</button>
			</div>
			<div class="booking-button">
		    	<a href="booking.jsp?package=Romantic Escape">Book Now</a>
		    </div>
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=Romantic Escape">Enquire Now</a>
		    </div>
		</div>
		
		<jsp:include page="footer.jsp"/>		
		<script src="tabs.js"></script>
	</body>
</html>
