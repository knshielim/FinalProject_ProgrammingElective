<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.*, com.halabo.util.DatabaseConnection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    request.setCharacterEncoding("UTF-8");

    int destinationId = Integer.parseInt(request.getParameter("destinationId"));
    int packageId = Integer.parseInt(request.getParameter("packageId"));
    String destinationName = "", packageName = "";

    try (Connection conn = DatabaseConnection.getConnection()) {
        // Get destination name
        PreparedStatement stmt1 = conn.prepareStatement("SELECT destination_name FROM destinations WHERE id = ?");
        stmt1.setInt(1, destinationId);
        ResultSet rs1 = stmt1.executeQuery();
        if (rs1.next()) destinationName = rs1.getString("destination_name");

        // Get package name
        PreparedStatement stmt2 = conn.prepareStatement("SELECT package_name FROM packages WHERE id = ?");
        stmt2.setInt(1, packageId);
        ResultSet rs2 = stmt2.executeQuery();
        if (rs2.next()) packageName = rs2.getString("package_name");
    } catch (Exception e) {
        e.printStackTrace();
    }

    String name = request.getParameter("name") != null ? URLDecoder.decode(request.getParameter("name"), "UTF-8") : "";
    String email = request.getParameter("email") != null ? URLDecoder.decode(request.getParameter("email"), "UTF-8") : "";
    String phone = request.getParameter("phone") != null ? URLDecoder.decode(request.getParameter("phone"), "UTF-8") : "";
    String travelers = request.getParameter("travelers") != null ? URLDecoder.decode(request.getParameter("travelers"), "UTF-8") : "";

    // Convert date to yyyy-MM-dd format
    String rawDate = request.getParameter("date") != null
	    ? URLDecoder.decode(request.getParameter("date"), "UTF-8")
	    : "";
	String date = "";
	try {
	    // Expecting input in yyyy-MM-dd (HTML date input format)
	    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat displayFormat = new SimpleDateFormat("dd-MM-yyyy");
	    Date parsedDate = inputFormat.parse(rawDate);
	    date = displayFormat.format(parsedDate);
	} catch (Exception e) {
	    e.printStackTrace();
	    date = rawDate; // fallback if parsing fails
	}

    String totalPrice = request.getParameter("total_price");
    if (totalPrice == null) {
        totalPrice = (String) session.getAttribute("total_price");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment - Halabo Indonesia Tour</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; padding: 20px; }
        .form-container { background: white; padding: 30px; max-width: 700px; margin: auto; border-radius: 10px; box-shadow: 0 0 15px rgba(0,0,0,0.1); }
        .summary-box p { margin: 10px 0; }
        .payment-methods { display: flex; gap: 10px; margin-top: 20px; }
        .method-btn { padding: 10px 20px; cursor: pointer; border: none; background: #ddd; border-radius: 5px; }
        .method-btn.active { background-color: #007bff; color: white; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, select, textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 5px; }
        textarea { resize: vertical; min-height: 80px; }
        .btn-primary { background-color: #28a745; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; margin-top: 20px; }
        .btn-primary:hover { background-color: #218838; }
    </style>
</head>
<body>
<div class="payment-page">
	<div class="form-container">
	    <h2>Payment Information</h2>
	
	    <div class="summary-box">
	        <p><strong>Name:</strong> <%= name %></p>
	        <p><strong>Email:</strong> <%= email %></p>
	        <p><strong>Phone:</strong> <%= phone %></p>
	        <p><strong>Destination:</strong> <%= destinationName %></p>
	        <p><strong>Package:</strong> <%= packageName %></p>
	        <p><strong>Travelers:</strong> <%= travelers %></p>
	        <p><strong>Date:</strong> <%= date %></p>
	        <p><strong>Total Price:</strong> RM <%= totalPrice %></p>
	    </div>
	
	    <div class="payment-methods">
	        <button type="button" class="method-btn active" data-method="card">Credit/Debit Card</button>
	        <button type="button" class="method-btn" data-method="online">Online Banking (FPX)</button>
	        <button type="button" class="method-btn" data-method="ewallet">E-Wallet</button>
	    </div>
	
	    <form action="SavePaymentServlet" method="post">
	        <!-- CARD -->
	        <div id="payment-card" class="payment-section" style="display:block;">
	            <div class="form-group">
	                <label for="card-number">Card Number</label>
	                <input type="text" id="card-number" name="card-number" required>
	            </div>
	            <div style="display: flex; gap: 1rem;">
	                <div class="form-group" style="flex: 1;">
	                    <label for="card-expiry">Expiry Date</label>
	                    <input type="text" id="card-expiry" name="card-expiry" required>
	                </div>
	                <div class="form-group" style="flex: 1;">
	                    <label for="card-cvv">CVV</label>
	                    <input type="text" id="card-cvv" name="card-cvv" required>
	                </div>
	            </div>
	            <div class="form-group">
	                <label for="card-name">Cardholder Name</label>
	                <input type="text" id="card-name" name="card-name" required>
	            </div>
	        </div>
	
	        <!-- ONLINE BANKING -->
	        <div id="payment-online" class="payment-section" style="display:none;">
	            <div class="form-group">
	                <label for="bank">Choose Bank</label>
	                <select id="bank" name="bank">
	                    <option value="">-- Select Bank --</option>
	                    <option value="Maybank">Maybank</option>
	                    <option value="CIMB">CIMB</option>
	                    <option value="RHB">RHB</option>
	                    <option value="Public Bank">Public Bank</option>
	                </select>
	            </div>
	        </div>
	
	        <!-- E-WALLET -->
	        <div id="payment-ewallet" class="payment-section" style="display: none;">
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
	
	        <!-- Hidden Fields -->
	        <input type="hidden" name="packageId" value="<%= packageId %>">
	        <input type="hidden" name="travelers" value="<%= travelers %>">
	        <!-- Send ISO (yyyy-MM-dd) format for backend -->
			<input type="hidden" name="date" value="<%= rawDate %>">
			
			<!-- Keep displaying in dd-MM-yyyy format -->
			<p><strong>Date:</strong> <%= date %></p>
	        <input type="hidden" name="name" value="<%= name %>">
	        <input type="hidden" name="email" value="<%= email %>">
	        <input type="hidden" name="phone" value="<%= phone %>">
	        <input type="hidden" id="selected-method" name="payment-method" value="card">
	        <input type="hidden" name="total_price" value="<%= totalPrice %>">
	        <div class="form-group">
	            <label for="special_requests">Special requests (optional)</label>
	            <textarea name="special_requests" placeholder="Enter any special requirements here"></textarea>
	        </div>
	
	        <button type="submit" class="btn-primary">Complete Payment</button>
	    </form>
	</div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        const methodButtons = document.querySelectorAll(".method-btn");
        const sections = {
            card: document.getElementById("payment-card"),
            online: document.getElementById("payment-online"),
            ewallet: document.getElementById("payment-ewallet")
        };
        const selectedMethodInput = document.getElementById("selected-method");

        const methodFields = {
            card: ["card-number", "card-expiry", "card-cvv", "card-name"],
            online: ["bank"],
            ewallet: ["ewallet"]
        };

        function switchToMethod(method) {
            for (let key in sections) {
                sections[key].style.display = "none";
            }

            if (sections[method]) {
                sections[method].style.display = "block";
            }

            methodButtons.forEach(btn => btn.classList.remove("active"));
            document.querySelector(`.method-btn[data-method="${method}"]`).classList.add("active");

            Object.values(methodFields).flat().forEach(id => {
                const el = document.getElementById(id);
                if (el) el.removeAttribute("required");
            });
            methodFields[method].forEach(id => {
                const el = document.getElementById(id);
                if (el) el.setAttribute("required", "required");
            });

            selectedMethodInput.value = method;
        }

        methodButtons.forEach(btn => {
            btn.addEventListener("click", () => {
                const method = btn.dataset.method;
                switchToMethod(method);
            });
        });

        switchToMethod("card");
    });
    
    document.addEventListener("DOMContentLoaded", () => {
        const submitBtn = document.querySelector("button[type='submit']");
        const bankSelect = document.getElementById("bank");
        const ewalletSelect = document.getElementById("ewallet");
        const methodButtons = document.querySelectorAll(".method-btn");
        const selectedMethodInput = document.getElementById("selected-method");

        function validatePaymentInputs() {
            const method = selectedMethodInput.value;
            if (method === "card") {
                // Assume card inputs are text and required, let browser handle
                submitBtn.disabled = false; // no additional check
            } else if (method === "online") {
                submitBtn.disabled = !bankSelect.value;
            } else if (method === "ewallet") {
                submitBtn.disabled = !ewalletSelect.value;
            }
        }

        // Validate on select change
        bankSelect?.addEventListener("change", validatePaymentInputs);
        ewalletSelect?.addEventListener("change", validatePaymentInputs);

        // Validate on method change
        methodButtons.forEach(btn => {
            btn.addEventListener("click", () => {
                validatePaymentInputs();
            });
        });

        // Initial validation
        validatePaymentInputs();
    });
</script>
</body>
</html>
