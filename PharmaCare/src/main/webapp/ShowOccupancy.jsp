<%@page import="com.PharmaCare.bin.Medicine"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rack Status | PharmaCare</title>

<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary:#1a73e8;
    --light:#f5f7fa;
    --dark:#202124;
    --border:#dadce0;
    --success:#2e7d32;
    --danger:#c62828;
}

body {
    margin:0;
    font-family:'Segoe UI',sans-serif;
    background:var(--light);
}

/* Page Wrapper */
.page-wrapper{
    min-height:100vh;
    display:flex;
    flex-direction:column;
}

.page-container{
    flex:1;
    padding:30px;
}

/* Header */
.page-header{
    background:#fff;
    padding:20px 25px;
    border-radius:12px;
    box-shadow:0 4px 12px rgba(0,0,0,0.05);
    margin-bottom:25px;
}

/* Rack Grid */
.rack-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(140px,1fr));
    gap:15px;
    margin-bottom:30px;
}

.rack-card{
    background:#fff;
    padding:14px;
    border-radius:10px;
    text-align:center;
    border:1px solid var(--border);
    transition:.3s;
}

.rack-card:hover{
    border-color:var(--primary);
    transform:translateY(-3px);
}

.rack-icon{
    font-size:22px;
    color:var(--primary);
}

.rack-no{
    font-size:17px;
    font-weight:700;
    margin-top:5px;
    color:var(--dark);
}

/* Table */
.table-container{
    background:#fff;
    border-radius:12px;
    padding:20px;
    box-shadow:0 4px 12px rgba(0,0,0,0.05);
}

.medicine-table{
    width:100%;
    border-collapse:collapse;
    font-size:14px;
}

.medicine-table th,
.medicine-table td{
    padding:12px;
    border-bottom:1px solid #eee;
}

.medicine-table thead{
    background:#f1f5ff;
}

.qty{
    padding:6px 10px;
    border-radius:20px;
    font-size:12px;
    font-weight:600;
}

.in{background:#e8f5e9;color:var(--success);}
.out{background:#fdecea;color:var(--danger);}

.no-data{
    text-align:center;
    color:#888;
}

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

</style>
</head>

<body>

<div class="page-wrapper">

<jsp:include page="Header.jsp"/>

<div class="page-container">

    <!-- Page Header -->
    <div class="page-header">
            <div>
                <h2><i class="fas fa-exclamation-triangle"></i>Rack Allocation</h2>
                <p>See the associated medicines in the Racks</p>
            </div>

            <div class="page-actions">
                <a href="GetCountServlet">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>
        </div>

    <!-- Rack Cards -->
    <div class="rack-grid">
        <%
            ArrayList<Medicine> racklist =
            (ArrayList<Medicine>)session.getAttribute("racklist");

            if(racklist!=null){
                for(Medicine m:racklist){
        %>
        <a href="ShowDetailFromRackServlet?rack=<%=m.getRack_no()%>"
           style="text-decoration:none">
            <div class="rack-card">
                <div class="rack-icon"><i class="fas fa-box"></i></div>
                <div class="rack-no"><%=m.getRack_no()%></div>
            </div>
        </a>
        <% } } %>
    </div>

    <!-- Medicine Table -->
    <div class="table-container">
        <table class="medicine-table">
            <thead>
                <tr>
                    <th>Medicine</th>
                    <th>Brand</th>
                    <th>Category</th>
                    <th>Price (₹)</th>
                    <th>Qty</th>
                </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Medicine> list = (ArrayList<Medicine>)session.getAttribute("meddetails");

                if(list!=null && !list.isEmpty()){
                    for(Medicine med:list){
            %>
                <tr>
                    <td><%=med.getMedicine_name()%></td>
                    <td><%=med.getBrand_name()%></td>
                    <td><%=med.getCategory()%></td>
                    <td>₹ <%=med.getPrice()%></td>
                    <td>
                        <span class="qty <%=med.getQuantity()==0?"out":"in"%>">
                            <%=med.getQuantity()%>
                        </span>
                    </td>
                </tr>
            <% } } else { %>
                <tr>
                    <td colspan="5" class="no-data">No medicines found</td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>

</div>

</div>

<jsp:include page="Footer.jsp"/>


</body>
</html>
