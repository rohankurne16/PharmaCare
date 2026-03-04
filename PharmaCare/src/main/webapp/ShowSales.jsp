<%@page import="com.PharmaCare.bin.Sale"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sales Report | PharmaCare</title>

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
    background: #f5f7fa;
}

/* ===== LAYOUT ===== */
.page-wrapper {
    min-height: 100vh;
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

/* ===== TABLE CARD ===== */
.table-card {
    background: white;
    border-radius: 12px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    overflow-x: auto;
}

/* ===== TABLE ===== */
table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background: var(--primary-color);
    color: white;
}

thead th {
    padding: 14px;
    text-align: left;
    font-size: 14px;
}

tbody td {
    padding: 14px;
    border-bottom: 1px solid var(--border-color);
    font-size: 14px;
    color: var(--dark-color);
}

tbody tr:hover {
    background: var(--primary-light);
}

/* ===== HIGHLIGHTS ===== */
.price {
    color: #c0392b;
    font-weight: 600;
}

.qty {
    color: #27ae60;
    font-weight: 600;
}

.total {
    font-weight: 700;
    color: var(--primary-color);
}

/* ===== EMPTY ===== */
.no-data {
    text-align: center;
    padding: 25px;
    color: var(--gray-color);
}

/* ===== RESPONSIVE ===== */
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

    thead {
        display: none;
    }

    table, tbody, tr, td {
        display: block;
        width: 100%;
    }

    tbody tr {
        margin-bottom: 15px;
        border: 1px solid var(--border-color);
        border-radius: 10px;
        padding: 10px;
    }

    tbody td {
        border: none;
        padding: 8px;
        display: flex;
        justify-content: space-between;
    }

    tbody td::before {
        content: attr(data-label);
        font-weight: 600;
        color: var(--gray-color);
    }
}
</style>
</head>

<body>

<div class="page-wrapper">

    <%@ include file="Header.jsp" %>

    <div class="main-container">
        <main class="content">

            <!-- PAGE HEADER -->
            <div class="page-header">
                <div class="page-title">
                    <h2><i class="fas fa-chart-line"></i> Sales Report</h2>
                    <p>View all medicine sales and revenue details</p>
                </div>

                <div class="page-actions">
                    <a href="GetCountServlet" class="back-btn">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>
            </div>


			<form action="FilterSaleServlet" method="get" style="margin-bottom: 20px; display:flex; gap:10px; flex-wrap:wrap; justify-content:center;">
				    <input type="date" name="saleDate" placeholder="Order Date" style="padding:8px; border-radius:6px; border:1px solid #ccc;">
				    <input type="text" name="medicine" placeholder="Medicine Name" style="padding:8px; border-radius:6px; border:1px solid #ccc;">
				    <input type="text" name="customer" placeholder="Customer Name" style="padding:8px; border-radius:6px; border:1px solid #ccc;">
				    <button type="submit" style="padding:8px 15px; border:none; border-radius:6px; background:#1a73e8; color:white; cursor:pointer;">
				        <i class="fas fa-filter"></i> Filter
				    </button>
				    <a href="FilterSaleServlet" style="padding:8px 15px; border-radius:6px; background:#ccc; color:#333; text-decoration:none; display:flex; align-items:center; gap:5px;">
		    <i class="fas fa-times"></i> Reset
		</a>
		    
		</form>
			
            <!-- TABLE -->
            <div class="table-card">
                <table>
                    <thead>
                        <tr>
                        	<th>ID</th>
                            <th>Customer Name</th>
                            <th>Medicine Name</th>
                            <th>Selling Price</th>
                            <th>Quantity Sold</th>
                            <th>Sale Date</th>
                            <th>Total Revenue</th>
                        </tr>
                    </thead>

                    <tbody>
                    <%
                        ArrayList<Sale> sales =
                            (ArrayList<Sale>) request.getAttribute("sales");

                        if (sales != null && !sales.isEmpty()) {
                            for (Sale s : sales) {
                    %>
                        <tr>
                        	<td data-label="Sale ID"><%= s.getSale_id() %></td>
                            <td data-label="Customer Name"><%= s.getCustomer_name() %></td>
                            <td data-label="Medicine Name"><%= s.getMedicine_name() %></td>
                            <td data-label="Selling Price" class="price">₹ <%= s.getPrice() %></td>
                            <td data-label="Quantity Sold" class="qty"><%= s.getQuantity_sold() %></td>
                            <td data-label="Sale Date"><%= s.getSale_date() %></td>
                            <td data-label="Total Revenue" class="total">₹ <%= s.getTotal_revenue() %></td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="6" class="no-data">No sales records found</td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

        </main>
    </div>
   </div>

    <%@ include file="Footer.jsp" %>



</body>
</html>
 