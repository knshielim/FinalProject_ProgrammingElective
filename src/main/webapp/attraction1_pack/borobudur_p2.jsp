<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Borobudur Package 2 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		
		<div class="package-container">
			<h1>3D2N Borobudur (Adventure Trail) – Sunrise & Trek</h1>
			
			<div class="package-banner">
    			<img src="../images/borobudur_p2.jpg" alt="Borobudur Adventure Trail">
			</div>
			
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,099.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Adventure, Culture</p>
		        <p><strong>Tour Code:</strong> HALA-BORO-ADV</p>
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
		        <p>For thrill-seekers and nature lovers, this adventurous package is designed to provide unforgettable moments around Borobudur. Begin with an early morning sunrise trek to Punthuk Setumbu Hill, followed by a cycling tour to nearby villages, temple visits, and cultural immersion.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ Sunrise trekking to Punthuk Setumbu</li>
		            <li>✅ Borobudur entry tickets and guide</li>
		            <li>✅ Village cycling tour with local guide</li>
		            <li>✅ 2 nights stay at local eco lodge</li>
		            <li>✅ Breakfast & 1 local lunch</li>
		            <li>❌ Airfare to Yogyakarta</li>
		            <li>❌ Personal shopping or gratuities</li>
		            <li>❌ Travel insurance</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrive Yogyakarta, hotel check-in, welcome orientation</li>
		            <li><strong>Day 2:</strong> Sunrise trek, local breakfast, cycling tour, Borobudur temple tour</li>
		            <li><strong>Day 3:</strong> Leisure morning, explore local art stalls, return trip</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>1,099</td></tr>
		            <tr><td>4-6 pax</td><td>1,059</td></tr>
		            <tr><td>7 pax and above</td><td>1,019</td></tr>
		        </table>
		        <p>Discounts available for students and groups of 10+. Minimum age for trekking: 12 years old.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Jogja Eco Retreat – A charming eco-lodge surrounded by rice fields and forest trails. Perfect for an authentic and nature-friendly stay.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Booking is based on availability; early booking recommended during peak season.</li>
		            <li>Adventurous activities require a moderate fitness level.</li>
		            <li>Itinerary may shift due to weather conditions or temple regulations.</li>
		            <li>All cancellation policies apply as per Halabo Indonesia Tour policy guide.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="../enquiry.jsp?package=HALA-BORO-ADV">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="../footer.jsp"/>
		<script src="../tabs.js"></script>
	</body>
</html>
