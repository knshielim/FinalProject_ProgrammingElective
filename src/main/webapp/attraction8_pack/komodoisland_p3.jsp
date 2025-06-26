<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Komodo Package 3 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		
		<div class="package-container">
		    <h1>4D3N Komodo (Explorer's Escape) – Ocean Breeze Resort</h1>
		    
		    <div class="package-banner">
    			<img src="../images/komodoisland_p3.jpg" alt="Explorer's Escape">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,399.00</p>
		        <p><strong>Duration:</strong> 4 Days, 3 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Exploration, Wildlife, Marine</p>
		        <p><strong>Tour Code:</strong> HALA-KOM-EXP</p>
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
		        <p>For those who crave deeper exploration, this package offers multi-island visits, marine experiences, and the opportunity to spot Komodo dragons in their full glory. Dive into adventure with island-hopping, sunset cruises, and guided ranger walks through pristine natural trails.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 3 nights’ stay at Ocean Breeze Resort</li>
		            <li>✅ Island-hopping tour to Komodo, Rinca, and Padar Islands</li>
		            <li>✅ Pink Beach snorkeling and manta ray watching</li>
		            <li>✅ Daily breakfast, 2 lunches, 1 sunset cruise dinner</li>
		            <li>✅ Entrance and conservation fees</li>
		            <li>❌ Domestic flights</li>
		            <li>❌ Optional scuba diving experience</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival and resort check-in, free time, sunset dinner cruise</li>
		            <li><strong>Day 2:</strong> Komodo Island and Rinca trek with ranger, beach lunch</li>
		            <li><strong>Day 3:</strong> Padar Island hike, Pink Beach snorkeling, Manta Point boat visit</li>
		            <li><strong>Day 4:</strong> Leisure morning, resort breakfast, transfer to airport</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>1,399</td></tr>
		            <tr><td>4-6 pax</td><td>1,349</td></tr>
		            <tr><td>7 pax and above</td><td>1,299</td></tr>
		        </table>
		        <p>Note: Life jackets and snorkeling gear provided. Guests are advised to carry reef-safe sunscreen and light hiking shoes.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Ocean Breeze Resort – Nestled by the waterfront, this resort features panoramic ocean views, sea breeze suites, eco-friendly architecture, and seamless island transfer service.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Excursions are subject to weather and tidal conditions.</li>
		            <li>Tour slots are limited; early booking is recommended (at least 2 weeks prior).</li>
		            <li>Children under 10 not allowed on Padar Island hike due to terrain.</li>
		            <li>All national park regulations apply strictly.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-KOM-EXP">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<script src="../tabs.js"></script>
	</body>
</html>