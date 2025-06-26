<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Monas Package 2 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		
		<div class="package-container">
		    <h1>2D1N Monas (Heritage Tour) – Jakarta City Stay</h1>
		    
		    <div class="package-banner">
    			<img src="../images/monas_p2.jpg" alt="Heritage Tour">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM589.00</p>
		        <p><strong>Duration:</strong> 2 Days, 1 Night</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Heritage, City</p>
		        <p><strong>Tour Code:</strong> HALA-MONAS-HER</p>
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
		        <p>This package is perfect for culture enthusiasts seeking a short yet immersive experience in Jakarta. Visit Monas, Indonesia's iconic National Monument, learn about its rich independence history, and enjoy traditional cuisine in the heart of the capital city.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 1-night stay at Jakarta City Stay hotel</li>
		            <li>✅ Monas entrance tickets</li>
		            <li>✅ Guided historical walk & city tour</li>
		            <li>✅ Traditional lunch at a heritage restaurant</li>
		            <li>✅ Transportation for tour duration</li>
		            <li>❌ Flights to Jakarta</li>
		            <li>❌ Personal shopping expenses</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival in Jakarta, hotel check-in, Monas guided visit, museum walk, traditional dinner</li>
		            <li><strong>Day 2:</strong> Cultural city tour (Kota Tua), Batavia café brunch, transfer to airport</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>589</td></tr>
		            <tr><td>4-6 pax</td><td>549</td></tr>
		            <tr><td>7 pax and above</td><td>529</td></tr>
		        </table>
		        <p>Note: Ideal for weekend getaways or short city breaks. Private tours available upon request.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Jakarta City Stay – A well-connected city hotel located near Monas with easy access to major city attractions and authentic Indonesian eateries.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Tour timings may vary based on local traffic and events.</li>
		            <li>Advance booking required at least 5 days before travel.</li>
		            <li>No refunds for missed attractions due to late arrivals or personal delays.</li>
		            <li>Itinerary can be customized for private groups.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-MONAS-HER">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="../footer.jsp"/>
		<script src="../tabs.js"></script>
	</body>
</html>