<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Bali Island - Halabo Indonesia Tour</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
	    <h1>Bali Island</h1>
	    <p> <i>Friday, 16 February 2024</i><br><br>
	    <img src="images/bali2.jpg" class="img-size" alt="Bali Island">
	    <h4><i>Beautiful beaches, temples, and a unique spiritual vibe.</i></h4>
	    
	    <section class="about-p">
		    <p>
			    Bali is Indonesia’s most popular tourist island, known for its breathtaking beaches, vibrant culture, and picturesque rice terraces. 
			    Visitors can explore ancient temples like Uluwatu and Tanah Lot, experience traditional Balinese dance performances, and indulge in wellness retreats. 
			    The island also offers world-class surfing, diving, and snorkeling opportunities. 
			    With its rich artistic heritage and spiritual atmosphere, Bali provides an unforgettable travel experience for every kind of traveler.
			</p>
		</section>
		
		<section class="package-options">
		    <h3>Choose Your Package:</h3>
		    <div class="package-grid">
		        <div class="package-card">
		            <a href="attraction2_pack/bali_p1.jsp">
		                <img src="images/bali_p1.jpg" alt="Beach Getaway">
		                <p>Beach Getaway</p>
		            </a>
		        </div>
		        <div class="package-card">
		            <a href="attraction2_pack/bali_p2.jsp">
		                <img src="images/bali_p2.jpg" alt="Adventure Retreat">
		                <p>Adventure Retreat</p>
		            </a>
		        </div>
		        <div class="package-card">
		            <a href="attraction2_pack/bali_p3.jsp">
		                <img src="images/bali_p3.jpg" alt="Beachside Romance">
		                <p>Beachside Romance</p>
		            </a>
		        </div>
		    </div>
		</section>
		
		<section class="bottom-nav">
			<a href="attraction1.jsp">< Previous</a>
			<a href="home.jsp">Back to Home</a>
			<a href="attraction3.jsp">Next ></a>
		</section>
	    
	    <jsp:include page="footer.jsp"/>
	</body>
</html>
