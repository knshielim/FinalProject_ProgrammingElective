<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Borobudur Package 3 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>	
		
		<div class="package-container">
		    <h1>4D3N Borobudur (Cultural Luxury) – Borobudur Heritage Resort</h1>

			<div class="package-banner">
	    		<img src="../images/borobudur_p3.jpg" alt="Borobudur Cultural Luxury">
			</div>	

		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,799.00</p>
		        <p><strong>Duration:</strong> 4 Days, 3 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Luxury, Culture</p>
		        <p><strong>Tour Code:</strong> HALA-BORO-LUX</p>
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
		        <p>Indulge in the elegance and tranquility of Java with our Cultural Luxury package. This tour is curated for travelers seeking a high-end experience, featuring private guides, spa treatments, and exclusive access to cultural performances near Borobudur.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 3 nights at Borobudur Heritage Resort (5★)</li>
		            <li>✅ Daily breakfast & 2 deluxe dinners</li>
		            <li>✅ Private tour of Borobudur & Mendut Temple</li>
		            <li>✅ Traditional Javanese spa experience</li>
		            <li>✅ Evening cultural dance show (VIP seating)</li>
		            <li>❌ Flights and personal shopping</li>
		            <li>❌ Optional activities outside itinerary</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival, welcome mocktail, check-in at luxury resort</li>
		            <li><strong>Day 2:</strong> Guided Borobudur & Mendut tour, afternoon spa</li>
		            <li><strong>Day 3:</strong> Optional sunrise yoga, cultural dance performance</li>
		            <li><strong>Day 4:</strong> Breakfast and checkout</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>1,799</td></tr>
		            <tr><td>4-6 pax</td><td>1,699</td></tr>
		            <tr><td>7 pax and above</td><td>1,599</td></tr>
		        </table>
		        <p>Perfect for honeymoons or anniversary getaways. Add-ons available upon request.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Borobudur Heritage Resort – A 5-star luxury escape offering premium suites, infinity pool, gourmet dining, and panoramic views of Borobudur.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Bookings must be made 3 weeks in advance for VIP performance access.</li>
		            <li>Rates include taxes; optional gratuities not included.</li>
		            <li>Flexible date changes allowed up to 14 days before travel.</li>
		            <li>Deposit of 50% required upon confirmation.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="../enquiry.jsp?package=HALA-BORO-LUX">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="../footer.jsp"/>
		<script src="../tabs.js"></script>
	</body>
</html>
