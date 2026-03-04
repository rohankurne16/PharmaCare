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
/* ===== SALE FORM STYLING ===== */
.sale-form {
    background: #f9f9f9; /* soft card footer look */
    padding: 15px;
    border-radius: 0 0 12px 12px; /* match card corners */
    border-top: 1px solid #ddd;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.sale-form label {
    font-size: 13px;
    font-weight: 600;
    color: #202124;
}

.sale-form input {
    padding: 8px 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 6px;
    outline: none;
    transition: 0.3s;
}

.sale-form input:focus {
    border-color: #1a73e8;
    box-shadow: 0 0 5px rgba(26, 115, 232, 0.3);
}

.sale-form button {
    background: #1a73e8;
    color: white;
    border: none;
    padding: 10px;
    font-size: 14px;
    font-weight: 600;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s;
}

.sale-form button:hover {
    background: #1558b0;
}

/* Responsive */
@media (max-width: 480px) {
    .sale-form input,
    .sale-form button {
        font-size: 13px;
        padding: 8px;
    }
}


/* ===== ADDITIONS END ===== */
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
                   <h2><i class="fas fa-cash-register"></i> Sell Medicine</h2>
                   <p>Record medicine sales and update inventory</p>
                </div>

                <div class="page-actions">
                   <a href="GetCountServlet" class="back-btn">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                   </a>
                </div>
            </div>
            
            <% String error = (String) request.getAttribute("error");
               if (error != null) { %>
            <div class="error-box" id="errorBox">
                <i class="fas fa-exclamation-circle error-icon"></i>
                <div class="error-text"><%= error %></div>
            </div>
            <% } %>

            <div class="medicine-container">
                <form action="AddSaleServlet" method="post" class="sale-form">

                    <!-- Medicine Name -->
                    <label>Medicine Name:</label>
                    <select name="medicine_id" id="medicineSelect" required style="height:38px;">
                        <option value="">-- Select Medicine --</option>
                        <% 
                            ArrayList<Medicine> m = (ArrayList<Medicine>) session.getAttribute("medicinedetails");
                            if (m != null) {
                                for (Medicine med : m){
                        %>
                            <option 
								    value="<%= med.getMedicine_id() %>"
								    data-stock="<%= med.getQuantity() %>"
								    data-price="<%= med.getPrice() %>"
								    data-mfg="<%= med.getManufacture_date() %>"
								    data-exp="<%= med.getExpiry_date() %>">
								    
								    <%= med.getMedicine_name() %> - <%= med.getBrand_name() %> 
								    (Available: <%= med.getQuantity() %>)
						</option>

                        <%  
                                } 
                            } else { %>
                            <option value="">No medicines available</option>
                        <% } %>
                    </select>

                    <!-- Quantity Sold -->
                    <label>Quantity Sold:</label>
                    <input type="number" name="quantity_sold" id="quantityInput" min="1" required>

                 <!-- Price per Unit -->
						<label>Price per Unit:</label>
						<input type="number" name="price" id="priceInput" step="0.01" readonly required>
						
						<!-- Manufacturing Date -->
						<label>Manufacturing Date:</label>
						<input type="text" id="mfgDate" readonly>
						
						<!-- Expiry Date -->
						<label>Expiry Date:</label>
						<input type="text" id="expDate" readonly>

						
                    <!-- Customer Name -->
                    <label>Customer Name:</label>
                    <input type="text" name="customer_name" placeholder="Optional">

                    <!-- Sale Date -->
                    <label>Sale Date:</label>
                    <input type="date" name="sale_date" required>

                    <button type="submit">Add Sale</button>

                </form>
            </div> <!-- /.medicine-container -->

        </main>
    </div> 
</div>
    <%@ include file="Footer.jsp" %>
    
  

</body>

<script>
setTimeout(() => {
    const errorBox = document.getElementById("errorBox");
    if (errorBox) errorBox.remove();
}, 3000);

const medicineSelect = document.getElementById("medicineSelect");
const quantityInput  = document.getElementById("quantityInput");
const priceInput     = document.getElementById("priceInput");
const mfgDate        = document.getElementById("mfgDate");
const expDate        = document.getElementById("expDate");

function formatDate(dateStr) {
    if (!dateStr) return "";

    // dateStr = "2025-01-07"
    const parts = dateStr.split("-");
    const year  = parts[0];
    const month = parts[1];
    const day   = parts[2];

    return day + "/" + month + "/" + year; // 07/01/2025
}



medicineSelect.addEventListener("change", function () {

    const selectedOption = this.options[this.selectedIndex];

    const stock = selectedOption.getAttribute("data-stock");
    const price = selectedOption.getAttribute("data-price");
    const mfg   = selectedOption.getAttribute("data-mfg");
    const exp   = selectedOption.getAttribute("data-exp");

    // limit quantity to stock
    if (stock) {
        quantityInput.max = stock;
        quantityInput.value = "";
    }

    // auto-fill medicine details
    priceInput.value = price || "";
    mfgDate.value = formatDate(mfg);
    expDate.value = formatDate(exp);
});
</script>

</html>
