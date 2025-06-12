<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Booking - Halabo Indonesia Tour</title>
		<link rel="stylesheet" type="text/css" href="styles.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
	</head>
	<body>
		<div class="container">
	            <div class="form-container" style="max-width: 600px;">
	                <h2 style="text-align: center; margin-bottom: 2rem;">Complete Your Booking</h2>
	                <form onsubmit="handleBooking(event)">
	                    <div class="form-group">
	                        <label for="booking-name">Full Name</label>
	                        <input type="text" id="booking-name" name="name" required>
	                    </div>
	                    <div class="form-group">
	                        <label for="booking-email">Email</label>
	                        <input type="email" id="booking-email" name="email" required>
	                    </div>
	                    <div class="form-group">
	                        <label for="booking-phone">Phone Number</label>
	                        <input type="tel" id="booking-phone" name="phone" required>
	                    </div>
	                    <div class="form-group">
	                        <label for="booking-destination">Destination</label>
	                        <input type="text" id="booking-destination" name="destination" readonly>
	                    </div>
	                    <div class="form-group">
	                        <label for="booking-package">Package</label>
	                        <input type="text" id="booking-package" name="package" readonly>
	                    </div>
	                    <div class="form-group">
	                        <label for="booking-travelers">Number of Travelers</label>
	                        <select id="booking-travelers" name="travelers" required>
	                            <option value="">Select number</option>
	                            <option value="1">1 Person</option>
	                            <option value="2">2 People</option>
	                            <option value="3">3 People</option>
	                            <option value="4">4 People</option>
	                            <option value="5+">5+ People</option>
	                        </select>
	                    </div>
	                    <div class="form-group">
	                        <label for="booking-date">Preferred Travel Date</label>
	                        <input type="date" id="booking-date" name="date" required>
	                    </div>
	                    
	                    <h3 style="color: #667eea; margin: 2rem 0 1rem 0;">Payment Information</h3>
	                    <div class="form-group">
	                        <label for="card-number">Card Number</label>
	                        <input type="text" id="card-number" name="card-number" placeholder="1234 5678 9012 3456" required>
	                    </div>
	                    <div style="display: flex; gap: 1rem;">
	                        <div class="form-group" style="flex: 1;">
	                            <label for="card-expiry">Expiry Date</label>
	                            <input type="text" id="card-expiry" name="card-expiry" placeholder="MM/YY" required>
	                        </div>
	                        <div class="form-group" style="flex: 1;">
	                            <label for="card-cvv">CVV</label>
	                            <input type="text" id="card-cvv" name="card-cvv" placeholder="123" required>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="card-name">Cardholder Name</label>
	                        <input type="text" id="card-name" name="card-name" required>
	                    </div>
	                    
	                    <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Complete Booking</button>
	                </form>
	            </div>
	        </div>
	</body>
</html>