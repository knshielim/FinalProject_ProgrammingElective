<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Raja Ampat Package 3 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>6D5N Raja Ampat (Luxury Dive Cruise) – Ocean Pearl Explorer</h1>
		    
		    <div class="package-banner">
    			<img src="images/rajaampat_p3.jpg" alt="Luxury Dive Cruise">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM4,899.00</p>
		        <p><strong>Duration:</strong> 6 Days, 5 Nights</p>
		        <p><strong>Min People:</strong> 4</p>
		        <p><strong>Tour Type:</strong> Luxury, Diving, Cruise</p>
		        <p><strong>Tour Code:</strong> HALA-RAJA-LUX</p>
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
		        <p>Indulge in a premium diving experience aboard a private liveaboard yacht. This luxury package offers full-board meals, guided underwater tours with professional divemasters, and access to some of the world's most stunning coral reefs and marine life.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 5 nights on Ocean Pearl Explorer liveaboard</li>
		            <li>✅ Full-board gourmet meals & refreshments</li>
		            <li>✅ Up to 3 dives per day with certified divemaster</li>
		            <li>✅ Airport and pier transfers</li>
		            <li>✅ National marine park fees</li>
		            <li>❌ Dive insurance</li>
		            <li>❌ Dive gear rental (available on request)</li>
		            <li>❌ Flights to Sorong</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival in Sorong, transfer to pier, welcome onboard</li>
		            <li><strong>Day 2:</strong> Dive at Manta Sandy, relax on deck</li>
		            <li><strong>Day 3:</strong> Dive at Cape Kri and Blue Magic</li>
		            <li><strong>Day 4:</strong> Dive and snorkeling around Arborek Island</li>
		            <li><strong>Day 5:</strong> Final dives, sunset cruise celebration</li>
		            <li><strong>Day 6:</strong> Return to Sorong, disembarkation, airport transfer</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>4-6 pax</td><td>4,899</td></tr>
		            <tr><td>7-10 pax</td><td>4,699</td></tr>
		            <tr><td>11 pax and above</td><td>4,499</td></tr>
		        </table>
		        <p>Dive gear rental is RM300 per person for full trip. Discounts apply for group bookings of 8 or more.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Ocean Pearl Explorer – A luxury dive cruise boat with ensuite cabins, onboard spa, sundeck lounge, and expert dive team for a premium experience at sea.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Participants must have valid open-water dive certification.</li>
		            <li>Medical clearance is recommended for diving activities.</li>
		            <li>Payment in full is required 45 days before departure.</li>
		            <li>Limited slots available – early booking is encouraged.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-RAJA-LUX">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
		    <button onclick="history.back()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="footer.jsp"/>
		<script src="tabs.js"></script>
	</body>
</html>
