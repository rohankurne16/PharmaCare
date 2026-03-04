	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="com.PharmaCare.bin.Cart" %>
	
	<!DOCTYPE html>
	<html lang="en">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Cart | PharmaCare</title>
	
	<link rel="stylesheet"
	      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	
	<style>
	/* ===== PAGE LAYOUT ===== */
	body {
	    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	    background-color: #f5f7fa;
	    margin: 0;
	    padding: 0;
	}
	
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
	
	/* ===== PAGE HEADER ===== */
	.page-header {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    background: white;
	    padding: 20px 25px;
	    border-radius: 12px;
	    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
	    margin-bottom: 25px;
	}
	
	.page-title h2 {
	    font-size: 26px;
	    font-weight: 700;
	    color: #202124;
	    display: flex;
	    align-items: center;
	    gap: 10px;
	}
	
	.page-title h2 i {
	    color: #1a73e8;
	}
	
	.page-title p {
	    margin-top: 6px;
	    font-size: 14px;
	    color: #5f6368;
	}
	
	.page-actions .back-btn {
	    background: #e8f0fe;
	    color: #1a73e8;
	    padding: 10px 20px;
	    border-radius: 8px;
	    font-weight: 600;
	    display: flex;
	    align-items: center;
	    gap: 8px;
	    text-decoration: none;
	    transition: 0.3s;
	}
	
	.page-actions .back-btn:hover {
	    background: #1a73e8;
	    color: white;
	}
	
	/* ===== CART TABLE ===== */
	.cart-card {
	    background: white;
	    border-radius: 12px;
	    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
	    overflow: hidden;
	}
	
	.cart-table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	.cart-table th {
	    background: #e8f0fe;
	    color: #202124;
	    font-size: 14px;
	    padding: 14px;
	    text-align: left;
	}
	
	.cart-table td {
	    padding: 14px;
	    border-bottom: 1px solid #eee;
	    font-size: 14px;
	}
	
	/* ===== QUANTITY CONTROL ===== */
	.qty-control {
	    display: flex;
	    align-items: center;
	    gap: 8px;
	}
	
	.qty-btn {
	    width: 32px;
	    height: 32px;
	    border-radius: 50%;
	    border: none;
	    background: #1a73e8;
	    color: white;
	    font-size: 18px;
	    cursor: pointer;
	    transition: 0.2s;
	}
	
	.qty-btn:hover {
	    background: #1558b0;
	}
	
	.qty-input {
	    width: 60px;
	    text-align: center;
	    font-size: 15px;
	    font-weight: 600;
	    padding: 4px;
	    border-radius: 6px;
	    border: 1px solid #ccc;
	    outline: none;
	}
	
	.qty-input:focus {
	    border-color: #1a73e8;
	    box-shadow: 0 0 4px rgba(26, 115, 232, 0.3);
	}
	
	/* ===== ACTION BUTTON ===== */
	.update-btn {
	    background: #34a853;
	    color: white;
	    padding: 8px 14px;
	    border-radius: 6px;
	    border: none;
	    font-weight: 600;
	    cursor: pointer;
	}
	
	.update-btn:hover {
	    background: #2b8a45;
	}
	
	/* ===== RESPONSIVE ===== */
	@media (max-width: 768px) {
	    .cart-table th, .cart-table td {
	        font-size: 13px;
	        padding: 10px;
	    }
	
	    .page-header {
	        flex-direction: column;
	        align-items: flex-start;
	        gap: 15px;
	    }
	
	    .page-actions .back-btn {
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
	        <h2><i class="fas fa-cart-shopping"></i> Cart</h2>
	        <p>Adjust medicine quantity before sale</p>
	    </div>
	
	    <div class="page-actions">
	        <a href="GetCountServlet" class="back-btn">
	            <i class="fas fa-arrow-left"></i> Back to Dashboard
	        </a>
	    </div>
	</div>
	
	<!-- Cart Table -->
	<div class="cart-card">
	<table class="cart-table">
	<tr>
	    <th>ID</th>
	    <th>Medicine</th>
	    <th>Brand</th>
	    <th>Category</th>
	    <th>Quantity</th>
	    <th>Actions</th>
	</tr>
	
	<%
	ArrayList<Cart> list = (ArrayList<Cart>) session.getAttribute("cart");
	if (list != null) {
	    for (Cart c : list) {
	%>
	<tr>
	<form action="UpdateCartQuantityServlet" method="post">
	    <td><%= c.getId() %></td>
	    <td><%= c.getMedicineName() %></td>
	    <td><%= c.getBrand() %></td>
	    <td><%= c.getCategory() %></td>
	    
	
	    <!-- Quantity Control -->
	    <td>
	        <div class="qty-control">
	            <button type="submit" name="action" value="minus" class="qty-btn">−</button>
	            <input type="number" name="quantity" class="qty-input" value="<%= c.getQuantity() %>" min="1">
	            <button type="submit" name="action" value="plus" class="qty-btn">+</button>
	        </div>
	        <input type="hidden" name="cart_id" value="<%= c.getId() %>">
	    </td>
	    <td>
		    <a href="DeleteFromCartServlet?cart_id=<%= c.getId() %>" 
		       style="background:#ea4335; color:white; padding:6px 12px; border-radius:6px; text-decoration:none;">
		       DELETE
		    </a>
		</td>
	
	</form>
	
	
	
	</tr>
	
	
	<%  } 
	} %>
	
	</table>
	</div>
	
	<div style="margin-top: 20px; text-align: right;">
	    <form action="GenerateReceiptServlet" method="post">
	        <button type="submit" 
	                style="background:#1a73e8; color:white; padding:10px 20px; border:none; border-radius:6px; font-weight:600; cursor:pointer;">
	            Generate Receipt
	        </button>
	    </form>
	</div>
	
	
	</main>
	</div>
	</div>
	
	<%@ include file="Footer.jsp" %>
	
	<script>
	function changeQty(btn, change) {
	    const row = btn.closest("td");
	    const qtyInput = row.querySelector(".qty-input");
	
	    let qty = parseInt(qtyInput.value);
	    qty += change;
	
	    if (qty < 1) qty = 1;
	
	    qtyInput.value = qty;
	}
	</script>
	
	</body>
	</html>
