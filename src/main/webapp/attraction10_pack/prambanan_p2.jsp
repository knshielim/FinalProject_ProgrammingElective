<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Prambanan Package 2 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		
		<div class="package-container">
		    <h1>3D2N Prambanan (Romantic Heritage Escape) – Svarna Heritage Lodge</h1>
		    
		    <div class="package-banner">
    			<img src="../images/prambanan_p2.jpg" alt="Romantic Heritage Escape">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,099.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Honeymoon, Culture</p>
		        <p><strong>Tour Code:</strong> HALA-PRAM-LOVE</p>
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
		        <p>This romantic getaway blends history and intimacy, perfect for couples seeking cultural charm and quiet time together. Visit the ancient Prambanan Temple at sunrise, take a private horse-drawn carriage tour through heritage trails, and enjoy a candlelit dinner under the stars.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 2 nights stay at Svarna Heritage Lodge (Romantic Suite)</li>
		            <li>✅ Private Prambanan tour with sunrise view</li>
		            <li>✅ Romantic candlelit dinner for two</li>
		            <li>✅ Daily breakfast + 1 local lunch</li>
		            <li>✅ Horse-drawn carriage heritage trail tour</li>
		            <li>❌ Flights to Yogyakarta</li>
		            <li>❌ Travel insurance</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival, hotel check-in, spa session, candlelit dinner at garden terrace</li>
		            <li><strong>Day 2:</strong> Early sunrise at Prambanan Temple, heritage carriage ride, free leisure time, lunch at romantic cafe</li>
		            <li><strong>Day 3:</strong> Visit Yogyakarta art market, check-out, airport transfer</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Couple (RM)</th></tr>
		            <tr><td>2 pax (1 couple)</td><td>1,099</td></tr>
		            <tr><td>4 pax (2 couples)</td><td>1,059</td></tr>
		            <tr><td>6 pax (3 couples)</td><td>1,029</td></tr>
		        </table>
		        <p>Note: Add-ons such as photography or spa massage are available upon request.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Svarna Heritage Lodge – A rustic yet elegant boutique stay designed for romance, with serene temple views, antique furnishings, and personalized couple experiences.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>This package is ideal for anniversaries, honeymoons, or romantic holidays.</li>
		            <li>Early morning tours require punctual wake-up and readiness for sunrise moments.</li>
		            <li>Package includes basic transport within itinerary only.</li>
		            <li>Optional extensions available for Bali or Borobudur connection.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="../enquiry.jsp?package=HALA-PRAM-LOVE">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="../footer.jsp"/>
		<script src="../tabs.js"></script>
	</body>
</html>
