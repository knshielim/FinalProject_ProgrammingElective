<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Komodo Package 1 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		
		<div class="package-container">
		    <h1>3D2N Komodo Encounter (Explorer Package) – Labuan Bajo Stay</h1>
		    
		    <div class="package-banner">
    			<img src="../images/komodoisland_p1.jpg" alt="Explorer Package">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1099.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Wildlife, Adventure</p>
		        <p><strong>Tour Code:</strong> HALA-KMD-EXP</p>
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
		        <p>This Explorer Package offers a thrilling short expedition to Komodo Island, perfect for travelers looking for a mix of wildlife, boat trips, and stunning scenery. You'll track the legendary Komodo dragons with an expert guide, snorkel at Pink Beach, and unwind with sunset views from Padar Island.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 2 nights' hotel accommodation in Labuan Bajo</li>
		            <li>✅ Full-day Komodo Island boat trip</li>
		            <li>✅ Park ranger and island entrance fees</li>
		            <li>✅ Snorkeling gear & boat transport</li>
		            <li>✅ Daily breakfast, 1 packed lunch</li>
		            <li>❌ Domestic flight to Labuan Bajo</li>
		            <li>❌ Personal expenses, tips</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrive in Labuan Bajo, check-in and explore harborfront</li>
		            <li><strong>Day 2:</strong> Komodo boat tour: Komodo dragon trek, snorkel at Pink Beach, hike Padar Island</li>
		            <li><strong>Day 3:</strong> Leisure morning, souvenir shopping, transfer to airport</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>1099</td></tr>
		            <tr><td>4-6 pax</td><td>1049</td></tr>
		            <tr><td>7 pax and above</td><td>999</td></tr>
		        </table>
		        <p>Note: Additional conservation tax applies at entrance. Children under 10 are not allowed on Komodo trek for safety reasons.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Labuan Bajo Stay – A breezy hilltop hotel offering scenic sea views, air-conditioned rooms, and shuttle access to the harbor.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Tour availability is subject to weather and park regulations.</li>
		            <li>Wear sturdy footwear and sun protection during island trek.</li>
		            <li>Bookings should be confirmed 7 days in advance with 50% deposit.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-KMD-EXP">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="../footer.jsp"/>
		<script src="../tabs.js"></script>
	</body>
</html>
