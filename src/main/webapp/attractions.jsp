<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Attractions - Halabo Indonesia Tour</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<h2>Top Attractions in Indonesia</h2>
		<div class="attractions-grid">
		    <div class="attraction-card">
		        <a href="attraction1.jsp">
		            <img src="images/borobudur1.jpg" alt="Borobudur Temple">
		        </a>
		        <p>The world’s largest Buddhist temple, rich with ancient history.</p>
		    </div>
		    <div class="attraction-card">
		        <a href="attraction2.jsp">
		            <img src="images/bali2.jpg" alt="Bali Island">
		        </a>
		        <p>Beautiful beaches, temples, and a unique spiritual vibe.</p>
		    </div>
		    <div class="attraction-card">
		        <a href="attraction3.jsp">
		            <img src="images/rajaampat3.jpg" alt="Raja Ampat">
		        </a>
		        <p>A diver’s paradise with stunning marine biodiversity.</p>
		    </div>
		    <div class="attraction-card">
		        <a href="attraction4.jsp">
		            <img src="images/bromo4.jpg" alt="Mount Bromo">
		        </a>
		        <p>Witness a sunrise over one of Indonesia’s iconic volcanoes.</p>
		    </div>
		    <div class="attraction-card">
		        <a href="attraction5.jsp">
		            <img src="images/toba5.jpg" alt="Lake Toba">
		        </a>
		        <p>The largest volcanic lake in the world, nestled in North Sumatra.</p>
		    </div>
		    <div class="attraction-card">
		        <a href="attraction6.jsp">
		            <img src="images/pulauseribu6.jpg" alt="Pulau Seribu">
		        </a>
		        <p>A chain of tropical islands near Jakarta, perfect for snorkeling and beach getaways.</p>
		    </div>
		    <div class="attraction-card">
		        <a href="attraction7.jsp">
		            <img src="images/monas7.jpg" alt="Monas">
		        </a>
		        <p>A symbol of Indonesia's independence in the heart of Jakarta.</p>
		    </div>
		    <div class="attraction-card">
		        <a href="attraction8.jsp">
		            <img src="images/komodo8.jpg" alt="Komodo Island">
		        </a>
		        <p>Home to the world-famous Komodo dragons and vibrant marine life.</p>
		    </div>
		    <div class="attraction-card">
		        <a href="attraction9.jsp">
		            <img src="images/labuanbajo9.jpg" alt="Labuan Bajo">
		        </a>
		        <p>A charming harbor town and gateway to Komodo National Park.</p>
		    </div>
		    <div class="attraction-card">
		        <a href="attraction10.jsp">
		            <img src="images/prambanan10.jpg" alt="Prambanan Temple">
		        </a>
		        <p>A majestic Hindu temple complex with stunning architecture and history.</p>
		    </div>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</body>
</html>