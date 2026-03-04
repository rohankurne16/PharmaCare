<%@page import="com.PharmaCare.bin.Medicine"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Expiry Medicines | PharmaCare</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary: #1a73e8;
    --light: #e8f0fe;
    --dark: #202124;
    --gray: #5f6368;
    --border: #dadce0;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background: #f5f7fa;
}

.page-wrapper {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.main-content {
    flex: 1;
    padding: 30px;
}

/* ===== PAGE HEADER ===== */
.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: white;
    padding: 22px 28px;
    border-radius: 14px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    margin-bottom: 25px;
}

.page-header h2 {
    font-size: 26px;
    font-weight: 700;
    color: var(--dark);
    display: flex;
    align-items: center;
    gap: 10px;
}

.page-header p {
    margin-top: 6px;
    font-size: 14px;
    color: var(--gray);
}

.page-actions a {
    background: var(--light);
    color: var(--primary);
    padding: 10px 20px;
    border-radius: 8px;
    font-weight: 600;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: 0.3s;
}

.page-actions a:hover {
    background: var(--primary);
    color: white;
}

/* ===== TABLE CARD ===== */
.table-card {
    background: white;
    border-radius: 14px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    overflow-x: auto;
}

/* ===== TABLE ===== */
table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background: var(--primary);
    color: white;
}

thead th {
    padding: 14px;
    text-align: left;
    font-size: 14px;
}

tbody td {
    padding: 14px;
    border-bottom: 1px solid var(--border);
    font-size: 14px;
    color: var(--dark);
}

tbody tr:hover {
    background: var(--light);
}

.expiry {
    color: #c0392b;
    font-weight: 600;
}

/* ===== NO DATA ===== */
.no-data {
    text-align: center;
    padding: 25px;
    color: var(--gray);
}

/* ===== RESPONSIVE ===== */
@media (max-width: 768px) {
    thead {
        display: none;
    }

    table, tbody, tr, td {
        display: block;
        width: 100%;
    }

    tbody tr {
        margin-bottom: 15px;
        border: 1px solid var(--border);
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
        color: var(--gray);
    }
}
</style>
</head>

<body>

<div class="page-wrapper">

    <jsp:include page="Header.jsp"></jsp:include>

    <div class="main-content">

        <!-- PAGE HEADER -->
        <div class="page-header">
            <div>
                <h2><i class="fas fa-exclamation-triangle"></i> Low Stock</h2>
              <p>Low Stock Alert – Reorder Soon!</p>
            </div>

            <div class="page-actions">
                <a href="GetCountServlet">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>
        </div>
        
         <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="error-box" id="errorBox">
                <i class="fas fa-exclamation-circle error-icon"></i>
                <div class="error-text"><%= error %></div>
            </div>
        <%
            }
        %>

        <!-- TABLE -->
        <div class="table-card">
            <table>
                <thead>
                    <tr>
                        <th>Brand Name</th>
                        <th>Medicine Name</th>
                        <th>Rack No</th>
                        <th>Expiry Date</th>
                        <th>Stocks Left</th>
                        <th>Refill Stocks</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    ArrayList<Medicine> m =
                        (ArrayList<Medicine>) session.getAttribute("lowstocklist");

                    if (m != null && !m.isEmpty()) {
                        for (Medicine med : m) {
                %>
                    <tr>
                        <td data-label="Brand Name"><%= med.getBrand_name() %></td>
                        <td data-label="Medicine Name"><%= med.getMedicine_name() %></td>
                        <td data-label="Rack No"><%= med.getRack_no() %></td>
                        <td data-label="Expiry Date" class="expiry"> <%= med.getExpiry_date() %>
                        
                         
                           
                       
                         <td data-label="Stocks Left"><%= med.getQuantity() %></td>
                         <td>  <form action="RefilllowServlet" method="get">
	                         
	                         		 <button type="submit">Refill Now</button> 
	                         		<input type="hidden" name="medicine_name" value="<%= med.getMedicine_name() %>">
	                         		<input type="hidden" name="brand" value="<%= med.getBrand_name() %>">
	                         		<input type="hidden" name="category" value="<%= med.getCategory() %>">
	                         </form> </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="4" class="no-data">
                            No medicines with low stock
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

    </div>
    
   </div>

    <jsp:include page="Footer.jsp"></jsp:include>



</body>
</html>
