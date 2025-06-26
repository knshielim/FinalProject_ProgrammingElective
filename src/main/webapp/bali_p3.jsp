<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Bali Package 3 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>3D2N Bali (Beachside Romance) – Seminyak Bliss Resort</h1>
		    
		    <div class="package-banner">
    			<img src="images/bali_p3.jpg" alt="Beachside Romance">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,099.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Couple, Relaxation</p>
		        <p><strong>Tour Code:</strong> HALA-BALI-ROM</p>
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
		        <p>Perfect for couples, this romantic Bali escape features beachfront dinners, sunset views, spa relaxation, and leisure time by the sea. A dreamy experience to reconnect and rejuvenate amidst the beauty of Seminyak.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 2 nights at Seminyak Bliss Resort (4★)</li>
		            <li>✅ Romantic beachfront dinner</li>
		            <li>✅ 60-minute couples spa session</li>
		            <li>✅ Daily breakfast</li>
		            <li>✅ Free time for leisure and optional island tour</li>
		            <li>❌ Flights and alcohol beverages</li>
		            <li>❌ Travel insurance and optional excursions</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival, check-in, couples massage, romantic dinner</li>
		            <li><strong>Day 2:</strong> Free day for beach, shopping, or optional Uluwatu tour</li>
		            <li><strong>Day 3:</strong> Breakfast, checkout, airport transfer</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Couple (RM)</th></tr>
		            <tr><td>2 pax</td><td>1,099</td></tr>
		            <tr><td>4 pax</td><td>1,049</td></tr>
		            <tr><td>6 pax and above</td><td>999</td></tr>
		        </table>
		        <p>Great for anniversaries or honeymooners. Ask about optional flower bed setup and custom arrangements.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Seminyak Bliss Resort – A stylish 4-star property by the beach, offering spa services, sunset views, private pools, and beach access within walking distance.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Package available for couples only.</li>
		            <li>Must book at least 10 days in advance.</li>
		            <li>Seasonal surcharge may apply during festive periods.</li>
		            <li>Free airport transfer included in the price.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-BALI-ROM">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
		    <button onclick="history.back()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="footer.jsp"/>
		<script src="tabs.js"></script>
	</body>
</html>
