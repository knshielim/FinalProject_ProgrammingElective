<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Pulau Seribu Package 3 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		
		<div class="package-container">
		    <h1>3D2N Pulau Seribu (Water Adventure) – Marina Dive Lodge</h1>
		    
		    <div class="package-banner">
    			<img src="../images/pulauseribu_p3.jpg" alt="Water Adventure">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,099.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 4</p>
		        <p><strong>Tour Type:</strong> Water Sports, Group</p>
		        <p><strong>Tour Code:</strong> HALA-PULAU-WADV</p>
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
		        <p>This action-packed water adventure package is ideal for thrill-seekers and ocean lovers. Enjoy island hopping, snorkeling, banana boat rides, and jet skiing while soaking up the sun in the stunning Pulau Seribu archipelago.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 2 nights stay at Marina Dive Lodge</li>
		            <li>✅ Roundtrip speedboat transfer from Marina Ancol</li>
		            <li>✅ Snorkeling gear and guided sessions</li>
		            <li>✅ Banana boat & jet ski experience</li>
		            <li>✅ Island hopping tour (3 islands)</li>
		            <li>✅ 2 breakfasts, 2 lunches, 1 dinner</li>
		            <li>❌ Underwater camera rental</li>
		            <li>❌ Insurance and optional diving sessions</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Speedboat to Pulau Seribu, check-in, snorkeling at sunset point, welcome BBQ</li>
		            <li><strong>Day 2:</strong> Island hopping (Kelor, Onrust, and Cipir), banana boat & jet ski rides</li>
		            <li><strong>Day 3:</strong> Morning leisure time, souvenir shopping, speedboat back to Jakarta</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>4-5 pax</td><td>1,099</td></tr>
		            <tr><td>6-9 pax</td><td>1,049</td></tr>
		            <tr><td>10 pax and above</td><td>999</td></tr>
		        </table>
		        <p>Note: Life jackets included. Additional water activities (diving, night kayaking) available at surcharge.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Marina Dive Lodge – A beachfront retreat with direct access to water sports, in-house dive center, and lively beach bonfire area for nightly gatherings.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Minimum 4 participants required. Children under 12 not recommended due to water safety.</li>
		            <li>Subject to weather conditions; alternate activities will be arranged in case of bad weather.</li>
		            <li>Bookings must be confirmed 7 days before departure. No refund for missed boat departure.</li>
		            <li>Cancellation charges apply based on notice period: 30% if within 5 days, 50% within 3 days.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-PULAU-WADV">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="../footer.jsp"/>		
		<script src="../tabs.js"></script>
	</body>
</html>