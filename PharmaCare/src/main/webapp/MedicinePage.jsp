<%@page import="java.util.ArrayList"%>
<%@page import="com.PharmaCare.bin.Medicine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Medicine Inventory | PharmaCare</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary-color: #1a73e8;
    --primary-light: #e8f0fe;
    --dark-color: #202124;
    --gray-color: #5f6368;
    --border-color: #dadce0;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

html, body {
    height: 100%;
}

body {
    background-color: #f5f7fa;
}

/* Layout */
.page-wrapper {
    min-height: 100%;
    display: flex;
    flex-direction: column;
}

.main-container {
    flex: 1;
    display: flex;
}

.content {
    flex: 1;
    padding: 30px;
}

/* Page Header */
.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
    background: white;
    padding: 20px 25px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    margin-bottom: 25px;
}

.page-title h2 {
    font-size: 26px;
    font-weight: 700;
    color: var(--dark-color);
    display: flex;
    align-items: center;
    gap: 10px;
}

.page-title h2 i {
    color: var(--primary-color);
}

.page-title p {
    margin-top: 6px;
    font-size: 14px;
    color: var(--gray-color);
}

.page-actions {
    display: flex;
    align-items: center;
}

.back-btn {
    background: var(--primary-light);
    color: var(--primary-color);
    padding: 10px 20px;
    border-radius: 8px;
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 8px;
    text-decoration: none;
    transition: 0.3s;
}

.back-btn:hover {
    background: var(--primary-color);
    color: white;
}

/* Medicine Cards */
.medicine-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 25px;
}

.medicine-card {
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    overflow: hidden;
    transition: 0.3s;
}

.medicine-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

.medicine-image {
    width: 100%;
    height: 160px;
    object-fit: fill;
    background: #f8f9fa;
    padding: 3px;
    border-radius: 10px;
}

.medicine-info {
    padding: 15px;
}

.medicine-info h3 {
    font-size: 14px;
    color: #2c3e50;
    margin: 6px 0;
}

.price {
    color: #c0392b;
    font-weight: bold;
    font-size: 16px;
}

.quantity {
    color: #27ae60;
    font-weight: bold;
}

.dates {
    font-size: 13px;
    color: #7f8c8d;
}

/* Responsive */
@media (max-width: 768px) {
    .page-header {
        flex-direction: column;
        align-items: flex-start;
    }

    .page-actions {
        width: 100%;
    }

    .back-btn {
        width: 100%;
        justify-content: center;
    }
    
    
}

:root {
    --primary-color: #1a73e8;
    --primary-light: #e8f0fe;
    --dark-color: #202124;
    --gray-color: #5f6368;
    --border-color: #dadce0;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

html, body {
    height: 100%;
}

body {
    background-color: #f5f7fa;
}

/* Layout */
.page-wrapper {
    min-height: 100%;
    display: flex;
    flex-direction: column;
}

.main-container {
    flex: 1;
    display: flex;
}

.content {
    flex: 1;
    padding: 30px;
}

/* Page Header */
.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
    background: white;
    padding: 20px 25px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    margin-bottom: 25px;
}

/* Medicine Cards */
.medicine-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 25px;
}

.medicine-card {
	
	
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    overflow: hidden;
    transition: 0.3s;
}

/* ===== ADDITIONS START (OVERLAY) ===== */

/* Image wrapper */
.image-wrapper {
    position: relative;
}

/* Image */
.medicine-image {
    width: 100%;
    height: 180px;
    object-fit: fill;
    background: #f8f9fa;
    padding: 3px;
    border-radius: 5px;
}

/* Quantity badge (top-left) */
.qty-badge {
    position: absolute;
    top: 10px;
    left: 10px;
    background: #27ae60;
    color: #fff;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 700;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

/* Price circle (bottom-right) */
.price-circle {
    position: absolute;
    bottom: 10px;
    right: 10px;
    width: 60px;
    height: 60px;
    background: #c0392b;
    color: #fff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    opacity:0.9;
    font-size: 14px;
    font-weight: 700;
    box-shadow: 0 6px 12px rgba(0,0,0,0.3);
}

/* ===== ADDITIONS END ===== */

.medicine-info {
    padding: 15px;
}

.medicine-info h3 {
    font-size: 14px;
    color: #2c3e50;
    margin: 6px 0;
}

.price {
    color: #c0392b;
    font-weight: bold;
    font-size: 16px;
}

.quantity {
    color: #27ae60;
    font-weight: bold;
}

.dates {
    font-size: 13px;
    color: #7f8c8d;
}
/* ===== EXPIRED OVERLAY ===== */
.expired-card {
    position: relative;
    opacity: 0.85;
}

.expired-card::after {
    content: "✖";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 90px;
    color: rgba(220, 53, 69, 0.85);
    font-weight: 900;
    z-index: 10;
    pointer-events: none;
}

/* Optional dark overlay */
.expired-overlay {
    position: absolute;
    inset: 0;
    background: rgba(255, 0, 0, 0.08);
    z-index: 5;
    border-radius: 12px;
}
/* Container for search form */
.search-form {
    display: flex;
    justify-content: center; /* center horizontally */
    margin: 20px 0;
    max-width: 500px; /* responsive width */
    margin-left: auto;
    margin-right: auto;
    border-radius: 30px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

/* Search input */
.search-input {
    flex: 1; /* take full available width */
    padding: 12px 20px;
    border: none;
    outline: none;
    font-size: 16px;
    background-color: #ffffff; /* white background */
    color: #333;
}

/* Search button */
.search-button {
    padding: 12px 25px;
    border: none;
    background-color: #1a73e8; /* blue button */
    color: #ffffff; /* white text */
    font-size: 16px;
    cursor: pointer;
    transition: background 0.3s;
}

.search-button:hover {
    background-color: #155ab6; /* darker blue on hover */
}


</style>
</head>


<body>

<div class="page-wrapper">

    <%@ include file="Header.jsp" %>

    <div class="main-container">
        <main class="content">

            <!-- Page Header -->
            <div class="page-header">
                <div class="page-title">
                    <h2><i class="fas fa-pills"></i> Medicine Inventory</h2>
                    <p>View and manage all medicines available in your pharmacy</p>
                </div>

                <div class="page-actions">
                   <a href="GetCountServlet" class="back-btn">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
                </div>
            </div>
            
            
            <form action="SearchMedicineServlet" method="get" class="search-form">
			    <input type="text" name="query" placeholder="Search by Name, Brand, or Category" class="search-input"/>
			    <button type="submit" class="search-button">
			    	  <i class="fas fa-search"></i> Search
			    </button>
			</form>

            

            <!-- Medicine List -->
            <div class="medicine-container">
            <%
                ArrayList<Medicine> list =
                    (ArrayList<Medicine>) session.getAttribute("medicinedetails");

                if (list != null && !list.isEmpty()) {
                    for (Medicine med : list) {
            %>

               
		                <%
						    java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
						    boolean expired = med.getExpiry_date().before(today);
						%>
		
			<div class="medicine-card <%= expired ? "expired-card" : "" %>">
			
			<% if (expired) { %>
			    <div class="expired-overlay"></div>
			<% } %>

                    <!-- IMAGE WITH OVERLAY -->
                    <div class="image-wrapper">

                        <span class="qty-badge">
                            Qty: <%= med.getQuantity() %>
                        </span>

                        <div style="width: 250px; margin: auto;">
						    <img class="medicine-image"
						         src="<%= request.getContextPath() %>/images/<%= med.getImage() %>"
						         onerror="this.src='<%= request.getContextPath() %>/images/placeholder.jpg';"
						         style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
						</div>
                        <div class="price-circle">
                            ₹<%= med.getPrice() %>
                        </div>

                    </div>

                    <!-- DETAILS (UNCHANGED) -->
                    <div class="medicine-info">
                        <h3><b>Brand:</b> <%= med.getBrand_name() %></h3>
                        <h3><b>Name:</b> <%= med.getMedicine_name() %></h3>
                        <h3><b>Category:</b> <%= med.getCategory() %></h3>
                        <h3><b>Rack:</b> <%= med.getRack_no() %></h3>
                        <h3 class="dates">
                            Mfg: <%= med.getManufacture_date() %> |
                            Exp: <%= med.getExpiry_date() %>
                        </h3>
                    </div>
                 <form action="GetMedicineByIdServlet" method="get">
					  	<input type="hidden" value="<%= med.getMedicine_id() %>" name="medicine_id">
					    <button type="submit" style="background-color: red;height: 40px;width: 100%;color: white;font-weight: 700;">Update</button>
					</form>

                </div>

            <%
                    }
                } else {
            %>
                <p style="text-align:center;color:#7f8c8d;">
                    No medicines available!
                </p>
            <% } %>
            </div>

        </main>
    </div>
</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
