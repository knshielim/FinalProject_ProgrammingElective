<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Prambanan Package 1 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		
		<div class="package-container">
		    <h1>3D2N Prambanan (Cultural Discovery) – Candi Garden Hotel</h1>
		    
		    <div class="package-banner">
    			<img src="../images/prambanan_p1.jpg" alt="Prambanan Cultural Discovery">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM889.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Heritage, Cultural</p>
		        <p><strong>Tour Code:</strong> HALA-PRAM-CULT</p>
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
		        <p>This package offers a rich cultural immersion centered around the magnificent Prambanan Temple. Discover the temple’s historic significance, explore surrounding Javanese heritage villages, and enjoy traditional performances that showcase Indonesia’s ancient traditions.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 2 nights’ stay at Candi Garden Hotel</li>
		            <li>✅ Guided Prambanan Temple entrance & tour</li>
		            <li>✅ Traditional dance show tickets</li>
		            <li>✅ Daily breakfast, 1 lunch at a local restaurant</li>
		            <li>✅ Transport & entrance fees included</li>
		            <li>❌ Airfare not included</li>
		            <li>❌ Personal expenses</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival in Yogyakarta, check-in, welcome dinner, stroll around Malioboro Street</li>
		            <li><strong>Day 2:</strong> Full-day Prambanan tour with guide, traditional dance show in the evening</li>
		            <li><strong>Day 3:</strong> Cultural workshop (optional), visit local market, transfer to airport</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>889</td></tr>
		            <tr><td>4-6 pax</td><td>849</td></tr>
		            <tr><td>7 pax and above</td><td>819</td></tr>
		        </table>
		        <p>Note: Cultural show timings may vary. Please book in advance to ensure reserved seats.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Candi Garden Hotel – Nestled near Prambanan, this charming boutique stay offers Javanese-style rooms, garden views, and complimentary shuttle service to the temple site.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Tour bookings must be made at least 10 days in advance.</li>
		            <li>Prices are subject to availability and high season surcharges.</li>
		            <li>Minimum 2 participants per booking.</li>
		            <li>Travel insurance is recommended but not included.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="../enquiry.jsp?package=HALA-PRAM-CULT">Enquire Now</a>
		    </div>
		</div>

		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="../footer.jsp"/>
		<script src="../tabs.js"></script>
	</body>
</html>
