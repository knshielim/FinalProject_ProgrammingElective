<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Pulau Seribu Package 2 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>3D2N Pulau Seribu (Couple's Getaway) – Coral Bliss Resort</h1>
		    
		    <div class="package-banner">
    			<img src="images/pulauseribu_p2.jpg" alt="Couple's Getaway">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,099.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Romantic, Island</p>
		        <p><strong>Tour Code:</strong> HALA-PULAU-COUP</p>
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
		        <p>Perfect for couples, this romantic island escape in Pulau Seribu offers a serene tropical setting, complete with sunset cruises, candlelit beach dinners, and relaxing spa moments. Ideal for honeymoons or anniversaries.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ Return speedboat transfer from Jakarta</li>
		            <li>✅ 2 nights at Coral Bliss Resort (Seaview Room)</li>
		            <li>✅ Breakfasts and 1 romantic dinner on the beach</li>
		            <li>✅ Sunset sailing cruise</li>
		            <li>✅ Couple’s spa session</li>
		            <li>❌ Flights to Jakarta</li>
		            <li>❌ Optional island hopping fees</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrive at Jakarta, speedboat to Pulau Seribu, resort check-in, evening beach walk</li>
		            <li><strong>Day 2:</strong> Leisure morning, sunset sailing, romantic candlelight dinner</li>
		            <li><strong>Day 3:</strong> Spa session, farewell breakfast, return transfer</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Couple (RM)</th></tr>
		            <tr><td>2 pax</td><td>1,099</td></tr>
		            <tr><td>4 pax (2 couples)</td><td>1,049</td></tr>
		            <tr><td>6 pax and above</td><td>999</td></tr>
		        </table>
		        <p>Note: Prices based on couple sharing. Special honeymoon decorations available upon request.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Coral Bliss Resort – A luxurious beachfront resort offering panoramic ocean views, private decks, romantic amenities, and impeccable hospitality for couples.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Check-in time: 2:00 PM; check-out time: 12:00 PM</li>
		            <li>Couples are advised to bring sunscreen and appropriate beachwear</li>
		            <li>All bookings must be confirmed at least 7 days before departure</li>
		            <li>Full payment required upon confirmation</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-PULAU-COUP">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
		    <button onclick="history.back()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="footer.jsp"/>		
		<script src="tabs.js"></script>
	</body>
</html>
