<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Prambanan Package 3 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>2D1N Prambanan (Budget Explorer) – Taman Yogyakarta Guesthouse</h1>
		    
		    <div class="package-banner">
    			<img src="images/prambanan_p3.jpg" alt="Budget Explorer">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM499.00</p>
		        <p><strong>Duration:</strong> 2 Days, 1 Night</p>
		        <p><strong>Min People:</strong> 1</p>
		        <p><strong>Tour Type:</strong> Backpacker, Heritage</p>
		        <p><strong>Tour Code:</strong> HALA-PRAM-BUDG</p>
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
		        <p>This compact cultural package is designed for solo travelers or students who want a cost-effective yet enriching experience. Explore the stunning Prambanan Temple complex, meet locals at traditional markets, and rest comfortably at a budget-friendly guesthouse.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 1 night stay at Taman Yogyakarta Guesthouse</li>
		            <li>✅ Entry ticket to Prambanan Temple</li>
		            <li>✅ One-way local transport to Prambanan</li>
		            <li>✅ Breakfast included</li>
		            <li>❌ Airport transfers</li>
		            <li>❌ Guided tour (available as add-on)</li>
		            <li>❌ Meals (other than breakfast)</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival and check-in at guesthouse, explore local eateries, optional batik market walk</li>
		            <li><strong>Day 2:</strong> Visit Prambanan Temple in the morning, return and check-out before noon</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>1 pax</td><td>499</td></tr>
		            <tr><td>2-3 pax</td><td>479</td></tr>
		            <tr><td>4 pax and above</td><td>459</td></tr>
		        </table>
		        <p>Note: Add-on options include bike rental, guided tour (+RM50), or shared shuttle to additional temples (+RM30).</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Taman Yogyakarta Guesthouse – A cozy, backpacker-style stay with shared and private rooms, communal kitchen, and walkable access to local cafes and transport routes.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Package is ideal for short stays or DIY travelers.</li>
		            <li>Late check-out may be subject to additional charges.</li>
		            <li>Guests are responsible for arranging their own transport to/from guesthouse.</li>
		            <li>Optional activities available at additional cost; inquire in advance.</li>
		        </ul>
		    </div>
		
			<div class="back-button">
		    	<button onclick="history.back()" class="back-btn">← Back</button>
			</div>
			<div class="booking-button">
		    	<a href="booking.jsp?package=Budget Explorer">Book Now</a>
		    </div>
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=Budget Explorer">Enquire Now</a>
		    </div>
		</div>

		<jsp:include page="footer.jsp"/>
		<script src="tabs.js"></script>
	</body>
</html>
