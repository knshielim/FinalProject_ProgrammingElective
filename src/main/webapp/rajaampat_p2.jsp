<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Raja Ampat Package 2 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>6D5N Raja Ampat (Eco Explorer) – Coral Reef Resort</h1>
		    
		    <div class="package-banner">
    			<img src="images/rajaampat_p2.jpg" alt="Eco Explorer">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM2,899.00</p>
		        <p><strong>Duration:</strong> 6 Days, 5 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Eco, Marine</p>
		        <p><strong>Tour Code:</strong> HALA-RAJA-ECO</p>
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
		        <p>Perfect for eco-conscious travelers, this journey offers snorkeling, reef education, and low-impact island hopping in one of the world's richest marine ecosystems. Includes environmental talks and village tours.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 5 nights at Coral Reef Resort (Eco-certified)</li>
		            <li>✅ Daily meals (Breakfast, Lunch, Dinner)</li>
		            <li>✅ Snorkeling sessions and reef preservation tour</li>
		            <li>✅ Local village and conservation project visits</li>
		            <li>✅ Marine park entry fee</li>
		            <li>❌ Flights to Sorong</li>
		            <li>❌ Alcoholic drinks</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival in Sorong, boat to resort, orientation</li>
		            <li><strong>Day 2:</strong> Snorkeling tour, reef preservation session</li>
		            <li><strong>Day 3:</strong> Visit local village and beach clean-up activity</li>
		            <li><strong>Day 4:</strong> Island hopping (Gam, Mansuar), sunset cruise</li>
		            <li><strong>Day 5:</strong> Leisure at resort, marine lecture with local expert</li>
		            <li><strong>Day 6:</strong> Return to Sorong and departure</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>2,899</td></tr>
		            <tr><td>4-6 pax</td><td>2,799</td></tr>
		            <tr><td>7 pax and above</td><td>2,699</td></tr>
		        </table>
		        <p>Optional dive packages available. Single traveler surcharge RM400.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Coral Reef Resort – A sustainable resort nestled among coral islets with eco-villas, rainwater harvesting, and locally sourced meals. Recognized by marine conservation bodies.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>This is a low-impact, conservation-focused tour. Respect local customs and wildlife.</li>
		            <li>Bring reef-safe sunscreen and reusable bottles.</li>
		            <li>Booking recommended 1 month in advance due to limited access permits.</li>
		            <li>All schedules are weather-permitting and may change with notice.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-RAJA-ECO">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
		    <button onclick="history.back()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="footer.jsp"/>
		<script src="tabs.js"></script>
	</body>
</html>
