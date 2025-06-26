<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Komodo Package 2 - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="../styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<jsp:include page="../header.jsp"/>
		
		<div class="package-container">
		    <h1>3D2N Komodo (Wildlife Trek) – Komodo Hillside Inn</h1>
		    
		    <div class="package-banner">
    			<img src="../images/komodoisland_p2.jpg" alt="Wildlife Trek">
			</div>
		    
		    <div class="package-meta">
		        <p><strong>Price:</strong> From RM1,199.00</p>
		        <p><strong>Duration:</strong> 3 Days, 2 Nights</p>
		        <p><strong>Min People:</strong> 2</p>
		        <p><strong>Tour Type:</strong> Wildlife, Nature</p>
		        <p><strong>Tour Code:</strong> HALA-KOM-WILD</p>
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
		        <p>Get up close with nature on this adventurous wildlife-focused journey. Trek the rugged terrain of Komodo Island, encounter the legendary Komodo dragons in their natural habitat, and enjoy serene views over coastal hills. This tour is perfect for travelers seeking wild beauty and island exploration.</p>
		        <h2>Included / Excluded</h2>
		        <ul>
		            <li>✅ 2 nights stay at Komodo Hillside Inn</li>
		            <li>✅ Guided Komodo dragon trekking tour</li>
		            <li>✅ Entrance fees to Komodo National Park</li>
		            <li>✅ Daily breakfast, 1 lunch during trekking</li>
		            <li>✅ Speedboat transfers from Labuan Bajo</li>
		            <li>❌ Flights to Labuan Bajo</li>
		            <li>❌ Dinner and extra personal expenses</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Itinerary</h2>
		        <ul>
		            <li><strong>Day 1:</strong> Arrival in Labuan Bajo, check-in, sunset view from Bukit Sylvia</li>
		            <li><strong>Day 2:</strong> Early morning boat to Komodo Island, ranger-guided trek to spot Komodo dragons, lunch picnic, Pink Beach snorkeling</li>
		            <li><strong>Day 3:</strong> Free morning, souvenir shopping, transfer to airport</li>
		        </ul>
		    </div>
		
		    <div class="tab-content">
		        <h2>Price Breakdown</h2>
		        <table>
		            <tr><th>Category</th><th>Per Pax (RM)</th></tr>
		            <tr><td>2-3 pax</td><td>1,199</td></tr>
		            <tr><td>4-6 pax</td><td>1,159</td></tr>
		            <tr><td>7 pax and above</td><td>1,129</td></tr>
		        </table>
		        <p>Note: Komodo trek includes basic safety gear. Visitors must follow park ranger instructions at all times for safety.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Hotel</h2>
		        <p>Komodo Hillside Inn – A comfortable guesthouse located on a peaceful hill in Labuan Bajo, offering panoramic views, clean facilities, and warm local hospitality. Ideal base for exploring Komodo Island.</p>
		    </div>
		
		    <div class="tab-content">
		        <h2>Remarks</h2>
		        <ul>
		            <li>Visitors must be physically fit for moderate hiking.</li>
		            <li>Tours depend on weather and sea conditions. Alternative routes may be used during rough weather.</li>
		            <li>Non-refundable deposit of 40% required to confirm booking.</li>
		            <li>No refunds for missed activities due to personal reasons or delay in arrival.</li>
		        </ul>
		    </div>
		
		    <div class="enquiry-button">
		        <a href="enquiry.jsp?package=HALA-KOM-WILD">Enquire Now</a>
		    </div>
		</div>
		
		<div class="back-button-container" style="margin-top: 20px;">
    		<button onclick="goBackToPreviousTab()" class="back-btn">← Back</button>
		</div>
		
		<jsp:include page="../footer.jsp"/>
		<script src="../tabs.js"></script>
	</body>
</html>
