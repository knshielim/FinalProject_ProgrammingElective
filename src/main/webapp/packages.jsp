<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Tour Packages - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <style>
	        .package-page-container {
	            max-width: 1000px;
	            margin: auto;
	            padding: 40px 20px;
	        }
	
	        h1 {
	            text-align: center;
	            color: #d92662;
	        }
	
	        .destination-section {
	            margin-top: 40px;
	        }
	
	        .destination-title {
	            font-size: 24px;
	            margin-bottom: 15px;
	            color: #222;
	            border-bottom: 2px solid #d92662;
	            padding-bottom: 5px;
	        }
	
	        .package-links {
	            display: flex;
	            flex-wrap: wrap;
	            gap: 10px;
	        }
	
	        .package-links a {
	            display: inline-block;
	            padding: 10px 15px;
	            background-color: #d92662;
	            color: white;
	            text-decoration: none;
	            border-radius: 5px;
	            font-weight: bold;
	        }
	
	        .package-links a:hover {
	            background-color: #b71d4d;
	        }
	    </style>
	</head>
	<body>
	    <jsp:include page="header.jsp"/>
	
	    <div class="package-page-container">
	        <h1>Explore Our Tour Packages</h1>
	
	        <div class="destination-section">
	            <div class="destination-title">Borobudur Temple</div>
	            <div class="package-links">
	                <a href="attraction1_pack/borobudur_p1.jsp">Family Journey</a>
	                <a href="attraction1_pack/borobudur_p2.jsp">Adventure Trail</a>
	                <a href="attraction1_pack/borobudur_p3.jsp">Cultural Luxury</a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Bali Island</div>
	            <div class="package-links">
	                <a href="attraction2_pack/bali_p1.jsp">Beach Getaway</a>
	                <a href="attraction2_pack/bali_p2.jsp">Adventure Retreat</a>
	                <a href="attraction2_pack/bali_p3.jsp">Beachside Romance</a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Raja Ampat</div>
	            <div class="package-links">
	                <a href="attraction3_pack/rajaampat_p1.jsp">Marine Discovery</a>
	                <a href="attraction3_pack/rajaampat_p2.jsp">Eco Explorer</a>
	                <a href="attraction3_pack/rajaampat_p3.jsp">Luxury Dive Cruise</a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Mount Bromo</div>
	            <div class="package-links">
	            	<a href="attraction4_pack/mountbromo_p1.jsp">Sunrise Experience</a>
	                <a href="attraction4_pack/mountbromo_p2.jsp">Scenic Discovery</a>
	                <a href="attraction4_pack/mountbromo_p3.jsp">Crater Adventure</a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Lake Toba</div>
	            <div class="package-links">
	                <a href="attraction5_pack/laketoba_p1.jsp">Cultural Retreat</a>
	                <a href="attraction5_pack/laketoba_p2.jsp">Adventure Discovery</a>
	                <a href="attraction5_pack/laketoba_p3.jsp">Honeymoon Escape</a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Pulau Seribu</div>
	            <div class="package-links">
	                <a href="attraction6_pack/pulauseribu_p1.jsp">Island Escape</a>
	                <a href="attraction6_pack/pulauseribu_p2.jsp">Couple's Getaway</a>
	                <a href="attraction6_pack/pulauseribu_p3.jsp">Water Adventure</a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Monas National Monument</div>
	            <div class="package-links">
	                <a href="attraction7_pack/monas_p1.jsp">Historical Exploration</a>
	                <a href="attraction7_pack/monas_p2.jsp">Heritage Tour</a>
	                <a href="attraction7_pack/monas_p3.jsp">Night City Escape</a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Komodo Island</div>
	            <div class="package-links">
	                <a href="attraction8_pack/komodoisland_p1.jsp">Explorer Package</a>
	                <a href="attraction8_pack/komodoisland_p2.jsp">Wildlife Trek</a>
	                <a href="attraction8_pack/komodoisland_p3.jsp">Explorer's Escape</a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Labuan Bajo</div>
	            <div class="package-links">
	                <a href="attraction9_pack/labuanbajo_p1.jsp">Quick Adventure</a>
	                <a href="attraction9_pack/labuanbajo_p2.jsp">Island Discovery</a>
	                <a href="attraction9_pack/labuanbajo_p3.jsp">Romantic Escape</a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Prambanan Temple</div>
	            <div class="package-links">
	                <a href="attraction10_pack/prambanan_p1.jsp">Cultural Discovery</a>
	                <a href="attraction10_pack/prambanan_p2.jsp">Romantic Heritage Escape</a>
	                <a href="attraction10_pack/prambanan_p3.jsp">Budget Explorer</a>
	            </div>
	        </div>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>
