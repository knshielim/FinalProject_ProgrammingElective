<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Lake Toba Package 3 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>5D4N Lake Toba (Honeymoon Escape) – Samosir Romantic Villas</h1>
		    
		    <div class="package-banner">
    			<img src="images/laketoba_p3.jpg" alt="Honeymoon Escape">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1299.00</p>
		        <p><strong>Duration:</strong> 5 Days, 4 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Romance, Relaxation</p>
		        <p><strong>Tour Code:</strong> HALA-TOBA-HONEY</p>
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
		        <p>Celebrate love and tranquility in this specially curated honeymoon escape. With romantic lakeside stays, candlelight dinners, spa indulgence, and private tours, this is the perfect getaway for newlyweds or couples seeking peace and intimacy by nature’s beauty.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 4 nights’ stay in honeymoon villa at Samosir Romantic Villas</li>
		            <li>✅ Private return land & boat transfers</li>
		            <li>✅ Candlelight dinner & floating breakfast</li>
		            <li>✅ 1-hour couple’s massage session</li>
		            <li>✅ Daily breakfast & 2 special dinners</li>
		            <li>✅ Local sightseeing in a private car</li>
		            <li>❌ Domestic flights to Medan</li>
		            <li>❌ Additional spa treatments or alcoholic beverages</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival in Medan, scenic transfer to Lake Toba, welcome drink and villa check-in</li>
		            <li><strong>Day 2:</strong> Leisure breakfast, spa therapy, romantic dinner under the stars</li>
		            <li><strong>Day 3:</strong> Samosir Island tour, visit to romantic viewpoints, lunch by the lake</li>
		            <li><strong>Day 4:</strong> Free day for couples’ activities or optional lake cruise</li>
		            <li><strong>Day 5:</strong> Floating breakfast, check-out, return transfer to Medan airport</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Total per Couple (RM)</th></tr>
		            <tr><td>Standard Honeymoon</td><td>1299</td></tr>
		            <tr><td>Deluxe Villa Upgrade</td><td>1499</td></tr>
		            <tr><td>Luxury Suite Package</td><td>1799</td></tr>
		        </table>
		        <p>Note: Honeymoon decorations included. Add-on photo session available upon request.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Samosir Romantic Villas – Private villas designed for couples with open-air bathtubs, panoramic lake views, and tailored romantic services including breakfast-in-bed and floral arrangements.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Package valid for couples only (honeymoon or anniversary proof may be requested).</li>
		            <li>Upgrade options subject to availability upon booking.</li>
		            <li>Booking must be confirmed at least 14 days before arrival.</li>
		            <li>Non-refundable within 7 days of departure. 50% deposit required at time of booking.</li>
		        </ul>
		    </div>
		
			<div class="back-button">
		    	<button onclick="history.back()" class="back-btn">← Back</button>
			</div>
			<div class="booking-button">
		    	<a href="booking.jsp?package=Honeymoon Escape">Book Now</a>
		    </div>
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=Honeymoon Escape">Enquire Now</a>
		    </div>
		</div>
		
		<jsp:include page="footer.jsp"/>		
		<script src="tabs.js"></script>
	</body>
</html>
