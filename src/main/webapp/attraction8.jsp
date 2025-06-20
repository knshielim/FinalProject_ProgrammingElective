<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Komodo Island - Halabo Indonesia Tour</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
	    <h1>Komodo Island</h1>
	    <p> <i>Friday, 9 July 2021</i><br><br>
	    <img src="images/komodo8.jpg" class="img-size" alt="Komodo Island">
	    <h4><i>Home to the world-famous Komodo dragons and vibrant marine life.</i></h4>
	    
	    <section class="about-p">
		    <p>
		    	Komodo Island is part of the Komodo National Park and is globally known as the natural habitat of the Komodo dragon, the largest lizard on Earth. 
		    	Located in the Lesser Sunda Islands, it offers a dramatic landscape of rugged hills, savannahs, and pink beaches. 
		    	Visitors can trek through the island with guides to observe the dragons and enjoy world-class diving sites teeming with marine biodiversity. 
		    	The unique ecosystem and scenery make it a true natural wonder.
			</p>
		</section>
		
		<section class="package-options">
		    <h3>Choose Your Package:</h3>
		    <div class="package-grid">
		        <div class="package-card">
		            <a href="attraction8_pack/komodoisland_p1.jsp">
		                <img src="images/komodo_p1.jpg" alt="Explorer Package">
		                <p>Explorer Package</p>
		            </a>
		        </div>
		        <div class="package-card">
		            <a href="attraction8_pack/komodoisland_p2.jsp">
		                <img src="images/komodo_p2.jpg" alt="Wildlife Trek">
		                <p>Wildlife Trek</p>
		            </a>
		        </div>
		        <div class="package-card">
		            <a href="attraction8_pack/komodoisland_p3.jsp">
		                <img src="images/komodo_p3.jpg" alt="Explorer's Escape">
		                <p>Explorer's Escape</p>
		            </a>
		        </div>
		    </div>
		</section>
		
		<section class="bottom-nav">
		   	<a href="attraction7.jsp">< Previous</a>
			<a href="home.jsp">Back to Home</a>
			<a href="attraction9.jsp">Next ></a>
	    </section>
	    <jsp:include page="footer.jsp"/>
	</body>
</html>
