<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Pulau Seribu Package 1 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
			
		<div class="package-container">
		    <h1>2D1N Pulau Seribu (Island Escape) – Tidung Serenity Resort</h1>
		    
		    <div class="package-banner">
    			<img src="images/pulauseribu_p1.jpg" alt="Island Escape">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM399.00</p>
		        <p><strong>Duration:</strong> 2 Days, 1 Night</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Island Leisure</p>
		        <p><strong>Tour Code:</strong> HALA-SERIBU-ECO</p>
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
		        <p>Perfect for weekend getaways, this short and sweet Pulau Seribu escape includes white sandy beaches, crystal waters, snorkeling tours, and fresh island seafood. A relaxed and carefree time awaits just a short boat ride from Jakarta.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ Return boat transfers from Marina Ancol</li>
		            <li>✅ 1 night’s stay at Tidung Serenity Resort</li>
		            <li>✅ Snorkeling tour with guide & gear</li>
		            <li>✅ 3 meals: 1 breakfast, 1 lunch, 1 dinner</li>
		            <li>✅ Bicycle rental to explore island</li>
		            <li>❌ Personal expenses</li>
		            <li>❌ Travel insurance</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Depart Marina Ancol, arrive at Tidung Island, check-in, snorkeling, sunset bike tour, seafood dinner</li>
		            <li><strong>Day 2:</strong> Island walk, leisure breakfast, free time at the beach, return to Marina Ancol</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>399</td></tr>
		            <tr><td>4-6 pax</td><td>379</td></tr>
		            <tr><td>7 pax and above</td><td>359</td></tr>
		        </table>
		        <p>Note: Child rate (5-11 yrs) available at RM299. Children under 5 stay free (no extra bed).</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Tidung Serenity Resort – Cozy beachfront resort with fan and AC options, local island charm, and easy access to the jetty and snorkel spots.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Subject to availability and weather conditions for sea travel.</li>
		            <li>Minimum 2 pax per booking, max 10 per villa unit.</li>
		            <li>Bookings must be confirmed at least 5 days prior to travel.</li>
		            <li>No refunds for late arrival or early return.</li>
		        </ul>
		    </div>
		
			<div class="back-button">
		    	<button onclick="history.back()" class="back-btn">← Back</button>
			</div>
			<div class="booking-button">
		    	<a href="booking.jsp?package=Island Escape">Book Now</a>
		    </div>
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=Island Escape">Enquire Now</a>
		    </div>
		</div>
		
		<jsp:include page="footer.jsp"/>		
		<script src="tabs.js"></script>
	</body>
</html>
