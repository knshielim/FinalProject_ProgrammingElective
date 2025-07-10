<!-- home.jsp - Cleaned Up and Prettified Version -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home - Halabo Indonesia Tour</title>
  <link rel="stylesheet" href="styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>

<body>
  <jsp:include page="header.jsp" />

  <!-- HERO SECTION -->
  <section class="hero">
    <div class="hero-text">
      <h1>Making Indonesia <br>Your Playground</h1>
      <p>Discover the magic of Indonesia with custom adventures, cultural journeys, and stunning escapes.<br>Let Halabo Tour craft your dream travel experience.</p>
      <a href="attractions.jsp" class="hero-btn">Explore Now</a>
    </div>
    <div class="hero-image">
      <img src="images/travel.jpg" alt="Traveler exploring Indonesia">
    </div>
  </section>

  <!-- INTRODUCTION -->
  <section class="title">
    <h1>Welcome to Halabo Indonesia Tour</h1>
    <p>
      We believe every destination in Indonesia holds a story waiting to be discovered. From pristine beaches to ancient temples and vibrant cities, we’re passionate about showcasing Indonesia’s beauty, culture, and adventure.
      <br><br>
      Our mission is to craft unforgettable personalized journeys across this archipelago of wonders.
    </p>
  </section>

  <!-- WHAT WE OFFER -->
  <section>
    <h2>What We Offer</h2>
    <div class="offers">
      <div class="block">
        <h3>Island Escapes</h3>
        <p>Explore Bali, Lombok, and the Thousand Islands with crystal-clear waters and white sand beaches.</p>
      </div>
      <div class="block">
        <h3>Cultural Journeys</h3>
        <p>Step into the past with visits to Borobudur and Prambanan, and experience Indonesia's rich traditions.</p>
      </div>
      <div class="block">
        <h3>Adventure Trails</h3>
        <p>Hike Mount Bromo or dive in Komodo. Perfect for thrill-seekers and nature lovers.</p>
      </div>
      <div class="block">
        <h3>Nature Retreats</h3>
        <p>Unwind in Lake Toba or Raja Ampat. Escape into Indonesia’s serene and biodiverse landscapes.</p>
      </div>
      <div class="block">
        <h3>City Discoveries</h3>
        <p>Experience Jakarta and Yogyakarta's fusion of modern life and cultural heritage.</p>
      </div>
      <div class="block">
        <h3>Custom Tours</h3>
        <p>From honeymoons to family holidays, we design trips tailored to your needs and interests.</p>
      </div>
    </div>
  </section>

  <!-- GALLERY SECTION -->
  <section class="attraction-title">
    <h2>Our Gallery</h2>
    <p>
      From temples of Java to the turquoise waters of Raja Ampat, explore Indonesia’s story through our gallery.
    </p>
  </section>

<div class="attractions-wrapper">
  <div class="attractions">
    <div class="card">
	  <img src="images/borobudur1.jpg" alt="Borobudur Temple">
	  <p>The world’s largest Buddhist temple, rich with ancient history.</p>
	  <a href="destination.jsp?id=1">Read More</a>
	</div>
	<div class="card">
	  <img src="images/bali2.jpg" alt="Bali Island">
	  <p>Beautiful beaches, temples, and a unique spiritual vibe.</p>
	  <a href="destination.jsp?id=2">Read More</a>
	</div>
	<div class="card">
	  <img src="images/rajaampat3.jpg" alt="Raja Ampat">
	  <p>A diver’s paradise with stunning marine biodiversity.</p>
	  <a href="destination.jsp?id=3">Read More</a>
	</div>
	<div class="card">
	  <img src="images/bromo4.jpg" alt="Mount Bromo">
	  <p>Witness a sunrise over one of Indonesia’s iconic volcanoes.</p>
	  <a href="destination.jsp?id=4">Read More</a>
	</div>
  </div>
</div>

  <div class="button-container">
    <a href="attractions.jsp" class="hero-btn">Find more attractions here!</a>
  </div>

  <jsp:include page="footer.jsp" />

  <script>
    const navLinks = document.getElementById("navLinks");
    function showMenu() { navLinks.style.right = "0"; }
    function hideMenu() { navLinks.style.right = "-200px"; }
  </script>
</body>
</html>
