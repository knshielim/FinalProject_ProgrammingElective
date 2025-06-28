<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    String name = request.getParameter("name") != null ? URLDecoder.decode(request.getParameter("name"), "UTF-8") : "";
    String email = request.getParameter("email") != null ? URLDecoder.decode(request.getParameter("email"), "UTF-8") : "";
    String phone = request.getParameter("phone") != null ? URLDecoder.decode(request.getParameter("phone"), "UTF-8") : "";
    String destination = request.getParameter("destination") != null ? URLDecoder.decode(request.getParameter("destination"), "UTF-8") : "";
    String pkg = request.getParameter("package") != null ? URLDecoder.decode(request.getParameter("package"), "UTF-8") : "";
    String travelers = request.getParameter("travelers") != null ? URLDecoder.decode(request.getParameter("travelers"), "UTF-8") : "";
    String date = request.getParameter("date") != null ? URLDecoder.decode(request.getParameter("date"), "UTF-8") : "";
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Payment - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <script src="payment.js" defer></script>
	    <style>
	        .form-container { max-width: 600px; margin: auto; padding: 20px; }
	        .form-group { margin-bottom: 1rem; }
	        .form-group label { display: block; margin-bottom: 0.5rem; }
	        .form-group input, .form-group select { width: 100%; padding: 8px; }
	        .btn-primary { background-color: #d92662; color: white; padding: 12px; border: none; border-radius: 4px; cursor: pointer; width: 100%; }
	        .btn-primary:hover { background-color: #ba1c4e; }
	        .summary-box { background-color: #f8f8f8; padding: 15px; border: 1px solid #ccc; margin-bottom: 1.5rem; }
	        .payment-methods { display: flex; gap: 1rem; margin-bottom: 1.5rem; }
	        .payment-methods button { flex: 1; padding: 10px; cursor: pointer; border: 1px solid #ccc; border-radius: 5px; background-color: #eee; }
	        .payment-methods button.active { background-color: #d92662; color: white; }
	        .payment-section { display: none; }
	        .payment-section.active { display: block; }
	    </style>
	</head>
	<body>
		<div class="form-container">
		    <h2>Payment Information</h2>
		
		    <div class="summary-box">
		        <p><strong>Name:</strong> <%= name %></p>
		        <p><strong>Email:</strong> <%= email %></p>
		        <p><strong>Phone:</strong> <%= phone %></p>
		        <p><strong>Destination:</strong> <%= destination %></p>
		        <p><strong>Package:</strong> <%= pkg %></p>
		        <p><strong>Travelers:</strong> <%= travelers %></p>
		        <p><strong>Date:</strong> <%= date %></p>
		    </div>
		
		    <!-- Payment Method Selection -->
		    <div class="payment-methods">
		        <button type="button" class="method-btn active" data-method="card">Credit/Debit Card</button>
		        <button type="button" class="method-btn" data-method="online">Online Banking (FPX)</button>
		        <button type="button" class="method-btn" data-method="ewallet">E-Wallet</button>
		    </div>
		
		    <form action="confirmation.jsp" method="post">
		        <!-- Card Payment -->
		        <div id="payment-card" class="payment-section active">
		            <div class="form-group">
		                <label for="card-number">Card Number</label>
		                <input type="text" id="card-number" name="card-number" placeholder="1234 5678 9012 3456">
		            </div>
		            <div style="display: flex; gap: 1rem;">
		                <div class="form-group" style="flex: 1;">
		                    <label for="card-expiry">Expiry Date</label>
		                    <input type="text" id="card-expiry" name="card-expiry" placeholder="MM/YY">
		                </div>
		                <div class="form-group" style="flex: 1;">
		                    <label for="card-cvv">CVV</label>
		                    <input type="text" id="card-cvv" name="card-cvv" placeholder="123">
		                </div>
		            </div>
		            <div class="form-group">
		                <label for="card-name">Cardholder Name</label>
		                <input type="text" id="card-name" name="card-name">
		            </div>
		        </div>
		
		        <!-- Online Banking -->
		        <div id="payment-online" class="payment-section">
		            <div class="form-group">
		                <label for="bank">Choose Bank</label>
		                <select id="bank" name="bank">
		                    <option value="">-- Select Bank --</option>
		                    <option value="Maybank">Maybank</option>
		                    <option value="CIMB">CIMB</option>
		                    <option value="RHB">RHB</option>
		                    <option value="Public Bank">Public Bank</option>
		                    <option value="Hong Leong">Hong Leong</option>
		                </select>
		            </div>
		        </div>
		
		        <!-- E-Wallet -->
		        <div id="payment-ewallet" class="payment-section">
		            <div class="form-group">
		                <label for="ewallet">Select E-Wallet</label>
		                <select id="ewallet" name="ewallet">
		                    <option value="">-- Select E-Wallet --</option>
		                    <option value="Touch 'n Go">Touch 'n Go</option>
		                    <option value="GrabPay">GrabPay</option>
		                    <option value="Boost">Boost</option>
		                    <option value="ShopeePay">ShopeePay</option>
		                </select>
		            </div>
		        </div>
		
		        <!-- Hidden Inputs -->
		        <input type="hidden" name="name" value="<%= name %>">
		        <input type="hidden" name="email" value="<%= email %>">
		        <input type="hidden" name="phone" value="<%= phone %>">
		        <input type="hidden" name="destination" value="<%= destination %>">
		        <input type="hidden" name="package" value="<%= pkg %>">
		        <input type="hidden" name="travelers" value="<%= travelers %>">
		        <input type="hidden" name="date" value="<%= date %>">
		        <input type="hidden" id="selected-method" name="payment-method" value="card">
		
		        <button type="submit" class="btn-primary">Complete Payment</button>
		    </form>
		</div>
	</body>
</html>
