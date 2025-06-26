<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Bali Package 2 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>5D4N Bali (Adventure Retreat) – Ubud Jungle Lodge</h1>
		    
		    <div class="package-banner">
    			<img src="images/bali_p2.jpg" alt="Adventure Retreat">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,299.00</p>
		        <p><strong>Duration:</strong> 5 Days, 4 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Adventure, Nature</p>
		        <p><strong>Tour Code:</strong> HALA-BALI-ADV</p>
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
		        <p>This action-packed adventure is ideal for thrill-seekers and nature lovers. Explore Bali's rugged terrains, waterfalls, and jungles with guided treks, rafting experiences, and an unforgettable sunrise hike to Mount Batur.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 4 nights at Ubud Jungle Lodge (3★)</li>
		            <li>✅ Daily breakfast & 2 adventure lunches</li>
		            <li>✅ Mount Batur sunrise hike & rafting tour</li>
		            <li>✅ Trekking guide and safety equipment</li>
		            <li>✅ Bali nature park access</li>
		            <li>❌ Flights & personal gear</li>
		            <li>❌ Meals not mentioned in the itinerary</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival and check-in at Ubud Jungle Lodge</li>
		            <li><strong>Day 2:</strong> Jungle trek and local village exploration</li>
		            <li><strong>Day 3:</strong> White-water rafting and riverside lunch</li>
		            <li><strong>Day 4:</strong> Mount Batur sunrise hike, hot spring soak</li>
		            <li><strong>Day 5:</strong> Free day, checkout, departure</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>1,299</td></tr>
		            <tr><td>4-6 pax</td><td>1,249</td></tr>
		            <tr><td>7 pax and above</td><td>1,199</td></tr>
		        </table>
		        <p>Gear rentals available upon request. Children under 12 not recommended for this package.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Ubud Jungle Lodge – Nestled in the rainforest with eco-friendly rooms, this 3-star lodge features forest views, organic cuisine, and an in-house adventure concierge.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Physical fitness required for hiking and rafting activities.</li>
		            <li>Insurance coverage for adventure activities is advisable.</li>
		            <li>Itinerary is weather dependent and may be adjusted for safety.</li>
		            <li>Advance booking of at least 2 weeks required.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-BALI-ADV">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
		    <button onclick="history.back()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="footer.jsp"/>
		<script src="tabs.js"></script>
	</body>
</html>