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
	                <a href="borobudur_p1.jsp">
	                	<img src="images/borobudur_p1.jpg" alt="Family Journey">
	                	Family Journey
	                </a>
	                <a href="borobudur_p2.jsp">
	                	<img src="images/borobudur_p2.jpg" alt="Adventure Trail">
	                	Adventure Trail
	                </a>
	                <a href="borobudur_p3.jsp">
	                	<img src="images/borobudur_p3.jpg" alt="Cultural Luxury">
	                	Cultural Luxury
	                </a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Bali Island</div>
	            <div class="package-links">
	                <a href="bali_p1.jsp">
	                	<img src="images/bali_p1.jpg" alt="Beach Getaway">
	                	Beach Getaway
	                </a>
	                <a href="bali_p2.jsp">
	                	<img src="images/bali_p2.jpg" alt="Adventure Retreat">
	                	Adventure Retreat
	                </a>
	                <a href="bali_p3.jsp">
		                <img src="images/bali_p3.jpg" alt="Beachside Romance">
		                Beachside Romance
	                </a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Raja Ampat</div>
	            <div class="package-links">
	                <a href="rajaampat_p1.jsp">
	                	<img src="images/rajaampat_p1.jpg" alt="Marine Discovery">
	                	Marine Discovery
	                </a>
	                <a href="rajaampat_p2.jsp">
	                	<img src="images/rajaampat_p2.jpg" alt="Eco Explorer">
	                	Eco Explorer
	                </a>
	                <a href="rajaampat_p3.jsp">
	                	<img src="images/rajaampat_p3.jpg" alt="Luxury Dive Cruise">
	                	Luxury Dive Cruise
	                </a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Mount Bromo</div>
	            <div class="package-links">
	            	<a href="mountbromo_p1.jsp">
	            		<img src="images/mountbromo_p1.jpg" alt="Sunrise Experience">
	            		Sunrise Experience
	            	</a>
	                <a href="mountbromo_p2.jsp">
	                	<img src="images/mountbromo_p2.jpg" alt="Scenic Discovery">
	                	Scenic Discovery
	                </a>
	                <a href="mountbromo_p3.jsp">
	                	<img src="images/mountbromo_p3.jpg" alt="Crater Adventure">
	                	Crater Adventure
	                </a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Lake Toba</div>
	            <div class="package-links">
	                <a href="laketoba_p1.jsp">
	                	<img src="images/laketoba_p1.jpg" alt="Cultural Retreat">
	                	Cultural Retreat
	                </a>
	                <a href="laketoba_p2.jsp">
	                	<img src="images/laketoba_p2.jpg" alt="Adventure Discovery">
	                	Adventure Discovery
	                </a>
	                <a href="laketoba_p3.jsp">
	                	<img src="images/laketoba_p3.jpg" alt="Honeymoon Escape">
	                	Honeymoon Escape
	                </a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Pulau Seribu</div>
	            <div class="package-links">
	                <a href="pulauseribu_p1.jsp">
	                	<img src="images/pulauseribu_p1.jpg" alt="Island Escape">
	                	Island Escape
	                </a>
	                <a href="pulauseribu_p2.jsp">
	                	<img src="images/pulauseribu_p2.jpg" alt="Couple's Getaway">
	                	Couple's Getaway
	                </a>
	                <a href="pulauseribu_p3.jsp">
	                	<img src="images/pulauseribu_p3.jpg" alt="Water Adventure">
	                	Water Adventure
	                </a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Monas National Monument</div>
	            <div class="package-links">
	                <a href="monas_p1.jsp">
	                	<img src="images/monas_p1.jpg" alt="Historical Exploration">
	                	Historical Exploration
	                </a>
	                <a href="monas_p2.jsp">
	                	<img src="images/monas_p2.jpg" alt="Heritage Tour">
	                	Heritage Tour
	                </a>
	                <a href="monas_p3.jsp">
	                	<img src="images/monas_p3.jpg" alt="Night City Escape">
	                	Night City Escape
	                </a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Komodo Island</div>
	            <div class="package-links">
	                <a href="komodoisland_p1.jsp">
	                	<img src="images/komodoisland_p1.jpg" alt="Explorer Package">
	                	Explorer Package
	                </a>
	                <a href="komodoisland_p2.jsp">
	                	<img src="images/komodoisland_p2.jpg" alt="Wildlife Trek">
	                	Wildlife Trek
	                </a>
	                <a href="komodoisland_p3.jsp">
	                	<img src="images/komodoisland_p3.jpg" alt="Explorer's Escape">
	                	Explorer's Escape
	                </a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Labuan Bajo</div>
	            <div class="package-links">
	                <a href="labuanbajo_p1.jsp">
	                	<img src="images/labuanbajo_p1.jpg" alt="Quick Adventure">
	                	Quick Adventure
	                </a>
	                <a href="labuanbajo_p2.jsp">
	                	<img src="images/labuanbajo_p2.jpg" alt="Island Discovery">
	                	Island Discovery
	                </a>
	                <a href="labuanbajo_p3.jsp">
	                	<img src="images/labuanbajo_p3.jpg" alt="Romantic Escape">
	                	Romantic Escape
	                </a>
	            </div>
	        </div>
	
	        <div class="destination-section">
	            <div class="destination-title">Prambanan Temple</div>
	            <div class="package-links">
	                <a href="prambanan_p1.jsp">
	                	<img src="images/prambanan_p1.jpg" alt="Cultural Discovery">
	                	Cultural Discovery
	                </a>
	                <a href="prambanan_p2.jsp">
	                	<img src="images/prambanan_p2.jpg" alt="Romantic Heritage Escape">
	                	Romantic Heritage Escape
	                </a>
	                <a href="prambanan_p3.jsp">
	                	<img src="images/prambanan_p3.jpg" alt="Budget Explorer">
	                	Budget Explorer
	                </a>
	            </div>
	        </div>
	    </div>
	
	    <jsp:include page="footer.jsp"/>
	</body>
</html>
