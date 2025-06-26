<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Monas - Halabo Indonesia Tour</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
	    <h1>Monas National Monument</h1>
	    <p> <i>Tuesday, 4 March 2025</i><br><br>
	    <img src="images/monas7.jpg" class="img-size" alt="Monas">
	   	<h4><i>A symbol of Indonesia's independence in the heart of Jakarta.</i></h4>
	    
	    <section class="about-p">
		    <p>
		    	Monas, short for Monumen Nasional, is an iconic landmark located in the heart of Jakarta. 
		    	It was constructed to commemorate Indonesia’s struggle for independence. 
		    	Standing at 132 meters tall, Monas is crowned with a flame covered in gold foil. 
		    	Visitors can take an elevator to the top for panoramic views of the capital. 
		    	The monument also houses a museum that showcases Indonesia’s rich history, making it both a symbol of national pride and a center of education.
			</p>
		</section>

		<section class="package-options">
		    <h3>Choose Your Package:</h3>
		    <div class="package-grid">
		        <div class="package-card">
		            <a href="monas_p1.jsp">
		                <img src="images/monas_p1.jpg" alt="Historical Exploration">
		                <p>Historical Exploration</p>
		            </a>
		        </div>
		        <div class="package-card">
		            <a href="monas_p2.jsp">
		                <img src="images/monas_p2.jpg" alt="Heritage Tour">
		                <p>Heritage Tour</p>
		            </a>
		        </div>
		        <div class="package-card">
		            <a href="monas_p3.jsp">
		                <img src="images/monas_p3.jpg" alt="Night City Escape">
		                <p>Night City Escape</p>
		            </a>
		        </div>
		    </div>
		</section>

		
		<section class="bottom-nav">
		   	<a href="attraction6.jsp">< Previous</a>
			<a href="home.jsp">Back to Home</a>
			<a href="attraction8.jsp">Next ></a>
	    </section>
	    <jsp:include page="footer.jsp"/>
	</body>
</html>
