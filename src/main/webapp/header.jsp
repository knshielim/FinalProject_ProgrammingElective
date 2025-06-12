<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<div class="header"> 
	<div class="logo">
		<a href="home.jsp"><img src="images/Logo.jpg" alt="Halabo Logo"></a>
	</div>
	
	
	<div class="nav-links" id="navLinks">
		<i class="fas fa-xmark" onclick="hideMenu()"></i> 
		<ul>
	        <li><a href="home.jsp">Home</a></li>
	        <li><a href="about.jsp">About</a></li>
	        <li><a href="attractions.jsp">Attractions</a></li>
	    </ul>
	    <a href="contact.jsp" class="contact-btn">Contact Us</a>
   	</div>
   	<i class="fa fa-bars" onclick="showMenu()"></i>
</div>

<script>
	var navLinks = document.getElementById("navLinks");
	
	function showMenu(){
		navLinks.style.right = "0";
	}
	
	function hideMenu(){
		navLinks.style.right = "-200px";
	}
</script>
