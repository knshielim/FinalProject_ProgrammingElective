<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Mount Bromo Package 2 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		
		<div class="package-container">
		    <h1>3D2N Mount Bromo (Scenic Discovery) – Lava View Resort</h1>
		    
		    <div class="package-banner">
    			<img src="../images/mountbromo_p2.jpg" alt="Scenic Discovery">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM899.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Nature, Photography</p>
		        <p><strong>Tour Code:</strong> HALA-BROMO-DISC</p>
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
		        <p>This extended Mount Bromo experience is tailored for travelers who want to fully immerse in the dramatic landscape. Enjoy both sunrise and sunset views, visit the Whispering Sands, and explore nearby Madakaripura Waterfall in one scenic package.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 2 nights stay at Lava View Resort (3★)</li>
		            <li>✅ 2 breakfasts and 1 local lunch</li>
		            <li>✅ Mount Bromo National Park entrance & jeep tour</li>
		            <li>✅ Guided trek to Madakaripura Waterfall</li>
		            <li>✅ Local English-speaking guide</li>
		            <li>❌ Travel insurance</li>
		            <li>❌ Meals not listed</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival, sunset viewing at Mount Bromo rim, overnight at resort</li>
		            <li><strong>Day 2:</strong> Sunrise tour via jeep, crater walk, visit Whispering Sands, local lunch</li>
		            <li><strong>Day 3:</strong> Madakaripura Waterfall trek, return and checkout</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>899</td></tr>
		            <tr><td>4-6 pax</td><td>859</td></tr>
		            <tr><td>7 pax and above</td><td>829</td></tr>
		        </table>
		        <p>Children aged 5–11 enjoy 30% off. Trekking shoes recommended for the waterfall trail.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Lava View Resort – Located at the Bromo crater edge, this resort offers direct volcano views, cozy cottages, and traditional Indonesian meals with bonfire nights.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>All activities subject to weather and volcanic conditions.</li>
		            <li>Not suitable for guests with mobility issues due to uneven trails.</li>
		            <li>Book at least 1 week in advance for optimal planning.</li>
		            <li>Guests should bring waterproof jackets and walking shoes.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-BROMO-DISC">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="../footer.jsp"/>
		<script src="../tabs.js"></script>
	</body>
</html>
