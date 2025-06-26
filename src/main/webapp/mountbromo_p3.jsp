<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Mount Bromo Package 3 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<div class="package-container">
		    <h1>4D3N Mount Bromo & Ijen (Crater Adventure) – Volcanic Trekker's Delight</h1>
		    
		    <div class="package-banner">
    			<img src="images/mountbromo_p3.jpg" alt="Crater Adventure">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1099.00</p>
		        <p><strong>Duration:</strong> 4 Days, 3 Nights</p>
		        <p><strong>Min People:</strong> 4</p>
		        <p><strong>Tour Type:</strong> Adventure, Nature</p>
		        <p><strong>Tour Code:</strong> HALA-BROMO-IJEN</p>
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
		        <p>This adrenaline-fueled volcanic expedition is ideal for nature enthusiasts and trekkers seeking raw beauty. Experience both Mount Bromo and the mesmerizing blue fire of Ijen Crater in a single package. Perfect for small groups and backpackers ready for physical challenges.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 3 nights’ accommodation (mixed lodges near Bromo & Ijen)</li>
		            <li>✅ All ground transportation with driver</li>
		            <li>✅ Guided sunrise trek to Mount Bromo & Ijen Crater</li>
		            <li>✅ Entrance fees to both national parks</li>
		            <li>✅ Daily breakfast, 1 local lunch, 1 BBQ dinner</li>
		            <li>✅ Gas mask for Ijen Crater climb</li>
		            <li>❌ Flight or train to Probolinggo/Banyuwangi</li>
		            <li>❌ Travel insurance</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrive Probolinggo, transfer to lodge near Bromo, evening bonfire</li>
		            <li><strong>Day 2:</strong> Sunrise trek to Mount Bromo, explore caldera, scenic drive to Banyuwangi</li>
		            <li><strong>Day 3:</strong> Midnight trek to Ijen Crater, blue flame viewing, descent & rest</li>
		            <li><strong>Day 4:</strong> Breakfast and return transfer to Banyuwangi/Surabaya</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>4-5 pax</td><td>1099</td></tr>
		            <tr><td>6-8 pax</td><td>999</td></tr>
		            <tr><td>9 pax and above</td><td>949</td></tr>
		        </table>
		        <p>Note: Suitable only for guests with moderate fitness. Travel insurance strongly recommended.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Mix of rustic lodges – Lava View Lodge near Bromo and Ketapang Indah Hotel in Banyuwangi. Basic amenities with proximity to trekking routes.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Blue fire at Ijen is visible only during early morning hours under clear skies.</li>
		            <li>Proper trekking shoes and jackets required.</li>
		            <li>Itinerary may be adjusted due to weather or volcanic conditions.</li>
		            <li>This tour is not recommended for children under 10 or elderly with mobility issues.</li>
		        </ul>
		    </div>
		
			<div class="back-button">
		    	<button onclick="history.back()" class="back-btn">← Back</button>
			</div>
			<div class="booking-button">
		    	<a href="booking.jsp?package=Crater Adventure">Book Now</a>
		    </div>
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=Crater Adventure">Enquire Now</a>
		    </div>
		</div>
		
		<jsp:include page="footer.jsp"/>
		<script src="tabs.js"></script>
</html>
