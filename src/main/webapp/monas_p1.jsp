<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Monas Package 1 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>2D1N Monas (Historical Exploration) – Jakarta Heritage Hotel</h1>
		    
		    <div class="package-banner">
    			<img src="images/monas_p1.jpg" alt="Historical Exploration">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM549.00</p>
		        <p><strong>Duration:</strong> 2 Days, 1 Night</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> History, City</p>
		        <p><strong>Tour Code:</strong> HALA-MONAS-HIST</p>
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
		        <p>Discover Jakarta's rich historical legacy with this short yet insightful city tour centered around Monas. Learn about Indonesia's journey to independence, visit surrounding museums, and enjoy a relaxed urban stay.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 1 night stay at Jakarta Heritage Hotel</li>
		            <li>✅ Monas tower entrance ticket & museum tour</li>
		            <li>✅ Local city guide for a half-day tour</li>
		            <li>✅ 1 breakfast and 1 lunch included</li>
		            <li>❌ Dinner</li>
		            <li>❌ Airport transfer (can be arranged upon request)</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Check-in, Monas tower visit, National Museum and Freedom Square tour</li>
		            <li><strong>Day 2:</strong> Morning local walking tour, souvenir stop, check-out</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>549</td></tr>
		            <tr><td>4-6 pax</td><td>519</td></tr>
		            <tr><td>7 pax and above</td><td>499</td></tr>
		        </table>
		        <p>Note: Children aged 5 and below can join for free without meals. Group rates available for institutions and schools.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Jakarta Heritage Hotel – A historical-style hotel in the heart of Jakarta with colonial decor, complimentary breakfast, and museum shuttle service.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Monas tower access subject to weather and government regulations.</li>
		            <li>Bookings require confirmation 5 days in advance.</li>
		            <li>Additional nights or airport pickup available upon request with extra charge.</li>
		            <li>50% deposit required. Cancellation less than 48 hours before departure forfeits deposit.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-MONAS-HIST">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
		    <button onclick="history.back()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="footer.jsp"/>
		<script src="tabs.js"></script>
	</body>
</html>
