<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>About - Halabo Indonesia Tour</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	</head>
	<body>
		<jsp:include page="header.jsp"/>

		<div class="about-container">
		    <h2>About Us</h2>
			<img src="images/indonesia.jpg" alt="Indonesia">
		    <p>
		        Welcome to <strong>Halabo Indonesia Tour</strong> – your virtual gateway to exploring the rich beauty and culture of Indonesia. 
		        Our platform is designed to showcase the country's most iconic and breathtaking tourist destinations, from majestic temples and volcanoes to pristine beaches and cultural heritage sites.
		    </p>
		
		    <p>
		        We aim to promote Indonesian tourism by offering travelers insightful information, stunning visuals, and helpful tips to make the most of their journey. 
		        Whether you're an adventure seeker, a history buff, a nature lover, or simply someone looking for a relaxing getaway, we’ve curated attractions that cater to every kind of explorer.
		    </p>
		
		    <p>
		        This website features blog-style content, detailed attraction pages, and a responsive design that ensures an enjoyable browsing experience on all devices. 
		        We also provide a contact form for inquiries, complete with form validation and a confirmation system powered by Java EE technologies.
		    </p>
		
		    <div class="about-highlight">
		        “Discover the spirit of Indonesia, one destination at a time.”
		    </div>
		
		    <p>
		        Thank you for visiting Halabo Indonesia Tour. We hope to inspire your next unforgettable adventure!
		    </p>
		</div>
		
		<div class="about-container">
		    <h2>Our Story</h2>
		    <p>
			    Halabo Indonesia Tour was born from a shared love for Indonesia’s breathtaking landscapes and cultural depth.
				Since our founding in 2025, we’ve dedicated ourselves to creating travel experiences that go beyond sightseeing. 
				Our team is composed of locals and travel professionals who live and breathe the stories of Indonesia—from the legends of Komodo Island to the serene rituals in Bali.
				Our story is your story: one of discovery, authenticity, and the pursuit of unforgettable memories. 
				Join us to explore the soul of Indonesia—one adventure at a time.
			</p>
		</div>
		
		<div class="about-container">
		    <h2>Our Vision & Mission</h2>
		    <div class="vm-grid">
		        <div class="vm-box">
		            <div class="vm-icon"><i class="fas fa-bullseye"></i></div>
		            <h3>Our Mission</h3>
		            <p>
		                To deliver meaningful travel experiences that connect people with the heart and soul of Indonesia.
		                We are committed to sustainability, personalization, and cultural respect in everything we do.
		            </p>
		        </div>
		        <div class="vm-box">
		            <div class="vm-icon"><i class="fas fa-globe-asia"></i></div>
		            <h3>Our Vision</h3>
		            <p>
		                To be Southeast Asia’s most trusted tour company, recognized for redefining authentic travel with innovation,
		                eco-conscious values, and heartfelt hospitality.
		            </p>
		        </div>
		    </div>
		</div>
		
		<div class="about-container">
			<h2>Our Values</h2>
			<ul>
				<li><strong>Cultural Connection</strong> – Every journey is a story. We respect and uplift local traditions and voices.</li>
				<li><strong>Sustainability</strong> – We promote eco-friendly practices to protect Indonesia’s natural beauty.</li>
				<li><strong>Authenticity</strong> – We craft honest and enriching experiences, free of tourist traps.</li>
				<li><strong>Personalization</strong> – Every tour is tailored to your pace, passion, and purpose.</li>
				<li><strong>Innovation</strong> – We embrace creativity and technology to elevate the travel experience.</li>
				<li><strong>Community Support</strong> – We partner with local guides, artisans, and businesses to ensure tourism benefits local communities.</li>
			</ul>
			
		</div>
			
		<jsp:include page="footer.jsp"/>
	</body>
</html>