<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Raja Ampat Package 1 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		
		<div class="package-container">
		    <h1>4D3N Raja Ampat (Marine Discovery) – Coral Reef Lodge</h1>
		    
		    <div class="package-banner">
    			<img src="../images/rajaampat_p1.jpg" alt="Marine Discovery">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM2,499.00</p>
		        <p><strong>Duration:</strong> 4 Days, 3 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Nature, Marine, Leisure</p>
		        <p><strong>Tour Code:</strong> HALA-RAJA-MAR</p>
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
		        <p>Embark on a once-in-a-lifetime marine journey across Raja Ampat, one of the most biodiverse marine ecosystems in the world. Snorkel with manta rays, explore vibrant coral reefs, and relax on remote paradise beaches.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 3 nights’ stay at Coral Reef Lodge (3★ beachfront)</li>
		            <li>✅ Daily breakfast & 2 seafood lunches</li>
		            <li>✅ Guided snorkeling tour & boat transfers</li>
		            <li>✅ Marine park permits</li>
		            <li>✅ Beach barbecue dinner</li>
		            <li>❌ Flights to Sorong</li>
		            <li>❌ Equipment rental (available at additional charge)</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival in Sorong, speedboat to resort, welcome dinner</li>
		            <li><strong>Day 2:</strong> Island-hopping tour, snorkel at Friwen Wall and Yenbuba</li>
		            <li><strong>Day 3:</strong> Morning snorkeling trip, beach barbecue, free leisure time</li>
		            <li><strong>Day 4:</strong> Sunrise beach walk, check-out and return transfer</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>2,499</td></tr>
		            <tr><td>4-6 pax</td><td>2,399</td></tr>
		            <tr><td>7 pax and above</td><td>2,299</td></tr>
		        </table>
		        <p>Note: Equipment rental (fins, snorkel mask) is available for RM50 per person per day.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Coral Reef Lodge – A serene beachfront stay with traditional wooden huts, private verandas, eco-sustainable practices, and close proximity to snorkel spots.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Best travel season: October to April (dry season)</li>
		            <li>All tours depend on sea conditions; flexibility is required</li>
		            <li>Advance booking required due to remote access</li>
		            <li>Guests must follow conservation guidelines in marine park</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-RAJA-MAR">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="../footer.jsp"/>
		<script src="../tabs.js"></script>
	</body>
</html>