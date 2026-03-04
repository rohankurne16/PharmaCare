<%@page import="java.util.ArrayList"%>
<%@page import="com.PharmaCare.bin.Orders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Orders | PharmaCare</title>

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

/* Table Styling */
.orders-table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
}

.orders-table th, .orders-table td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid var(--border-color);
}

.orders-table th {
    background: var(--primary-color);
    color: white;
    font-weight: 600;
}

.orders-table tr:nth-child(even) {
    background: #f9f9f9;
}

.orders-table tr:hover {
    background: #e8f0fe;
}

/* Error box */
.error-box {
    background: #fdd;
    color: #900;
    padding: 12px;
    margin-bottom: 15px;
    border-radius: 6px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.error-box i {
    font-size: 18px;
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
                   <h2><i class="fas fa-boxes"></i> All Orders</h2>
                   <p>View all medicine orders</p>
                </div>

                <div class="page-actions">
                   <a href="GetCountServlet" class="back-btn">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                   </a>
                </div>
                
            </div>
            
            
		<form action="FilterOrdersServlet" method="get" style="margin-bottom: 20px; display:flex; gap:10px; flex-wrap:wrap; justify-content:center;">
		    <input type="date" name="orderDate" placeholder="Order Date" style="padding:8px; border-radius:6px; border:1px solid #ccc;">
		    <input type="text" name="medicine" placeholder="Medicine Name" style="padding:8px; border-radius:6px; border:1px solid #ccc;">
		    <input type="text" name="brand" placeholder="Brand Name" style="padding:8px; border-radius:6px; border:1px solid #ccc;">
		    <button type="submit" style="padding:8px 15px; border:none; border-radius:6px; background:#1a73e8; color:white; cursor:pointer;">
		        <i class="fas fa-filter"></i> Filter
		    </button>
		    <a href="ShowOrdersServlet" style="padding:8px 15px; border-radius:6px; background:#ccc; color:#333; text-decoration:none; display:flex; align-items:center; gap:5px;">
    <i class="fas fa-times"></i> Reset
</a>
		    
		</form>
            
            
        
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <div class="error-box" id="errorBox">
                    <i class="fas fa-exclamation-circle"></i>
                    <div><%= error %></div>
                </div>
            <%
                }
            %>

            <!-- Orders Table -->
<table class="orders-table">
    <tr>
        <th>Order Date</th>
        <th>Medicine</th>
        <th>Brand</th>
        <th>Quantity</th>
    </tr>
    <%
        ArrayList<Orders> orders = (ArrayList<Orders>) request.getAttribute("orders");
        if (orders != null && !orders.isEmpty()) {
            for (Orders o : orders) {
    %>
    <tr>
      <td><%= new java.text.SimpleDateFormat("dd-MMM-yyyy").format(o.getOrderDate()) %></td>

        <td><%= o.getMedicineName() %></td>
        <td><%= o.getBrand() %></td>
        <td><%= o.getQuantity() %></td>
    </tr>
    <%
            }
        } else {
    %>
    <tr><td colspan="4" style="text-align:center;">No orders found</td></tr>
    <%
        }
    %>
</table>
            

        </main>
    </div>
</div> 

<%@ include file="Footer.jsp" %>

<script>
    setTimeout(() => {
        const errorBox = document.getElementById("errorBox");
        if (errorBox) {
            errorBox.remove();
        }
    }, 3000);
</script>
</body>
</html>
