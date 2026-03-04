
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.PharmaCare.bin.Register"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
	

 <%
					
					ArrayList<Register> arr = (ArrayList<Register>) session.getAttribute("loggeduser");
					
					for(Register loggeduser : arr) {
					    
					
					    String fname = loggeduser.getFull_name();
					    String firstName = fname.trim().split("\\s+")[0];
			%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PharmaCare - Dashboard</title>
    <style>
        :root {
            --primary-color: #1a73e8;
            --primary-light: #e8f0fe;
            --secondary-color: #34a853;
            --danger-color: #ea4335;
            --warning-color: #fbbc04;
            --info-color: #4285f4;
            --dark-color: #202124;
            --light-color: #f8f9fa;
            --gray-color: #5f6368;
            --border-color: #dadce0;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: var(--dark-color);
            line-height: 1.6;
        }
        
        /* Header Styles */
        .header {
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .header-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            border-bottom: 1px solid var(--border-color);
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .logo-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #1a73e8, #34a853);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }
        
        .logo-text h1 {
            color: var(--primary-color);
            font-size: 24px;
            font-weight: 700;
        }
        
        .logo-text span {
            color: var(--secondary-color);
        }
        
        .logo-text p {
            font-size: 12px;
            color: var(--gray-color);
            margin-top: 2px;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            background: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
        }
        
        .user-details h3 {
            font-size: 16px;
            color: var(--dark-color);
        }
        
        .user-details p {
            font-size: 12px;
            color: var(--gray-color);
        }
        
        .header-bottom {
            padding: 15px 30px;
            background: white;
        }
        
        .nav-menu {
            display: flex;
            gap: 30px;
            list-style: none;
        }
        
        .nav-menu li a {
            color: var(--gray-color);
            text-decoration: none;
            font-weight: 500;
            padding: 10px 0;
            position: relative;
            transition: color 0.3s;
        }
        
        .nav-menu li a:hover,
        .nav-menu li a.active {
            color: var(--primary-color);
        }
        
        .nav-menu li a.active::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 3px;
            background: var(--primary-color);
            border-radius: 2px;
        }
        
        /* Main Content */
        .main-container {
            display: flex;
            min-height: calc(100vh - 140px);
        }
        
        /* Sidebar */
        .sidebar {
            width: 250px;
            background: white;
            padding: 25px 0;
            border-right: 1px solid var(--border-color);
            position: sticky;
            top: 140px;
            height: calc(100vh - 140px);
            overflow-y: auto;
        }
        
        .sidebar-menu {
            list-style: none;
        }
        
        .sidebar-menu li {
            margin-bottom: 5px;
        }
        
        .sidebar-menu li a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 15px 25px;
            color: var(--gray-color);
            text-decoration: none;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }
        
        .sidebar-menu li a:hover {
            background: var(--primary-light);
            color: var(--primary-color);
            border-left-color: var(--primary-color);
        }
        
        .sidebar-menu li a.active {
            background: var(--primary-light);
            color: var(--primary-color);
            border-left-color: var(--primary-color);
            font-weight: 600;
        }
        
        .sidebar-menu li a i {
            width: 20px;
            text-align: center;
        }
        
        .menu-label {
            font-size: 12px;
            color: var(--gray-color);
            font-weight: 600;
            text-transform: uppercase;
            padding: 20px 25px 10px;
            letter-spacing: 1px;
        }
        
        /* Content Area */
        .content {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
        }
        
        .welcome-section {
            background: linear-gradient(135deg, #1a73e8, #4285f4);
            color: white;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .welcome-text h2 {
            font-size: 28px;
            margin-bottom: 10px;
        }
        
        .welcome-text p {
            opacity: 0.9;
            font-size: 16px;
        }
        
        .date-time {
            text-align: right;
        }
        
        .date-time h3 {
            font-size: 20px;
            margin-bottom: 5px;
        }
        
        .date-time p {
            opacity: 0.9;
            font-size: 14px;
        }
        
        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
        }
        
        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: white;
        }
        
        .icon-medicine { background: linear-gradient(135deg, #1a73e8, #4285f4); }
        .icon-warning { background: linear-gradient(135deg, #fbbc04, #ff9800); }
        .icon-danger { background: linear-gradient(135deg, #ea4335, #f44336); }
        .icon-success { background: linear-gradient(135deg, #34a853, #4caf50); }
        .icon-sales { background: linear-gradient(135deg, #9c27b0, #673ab7); }
        .icon-orders { background: linear-gradient(135deg, #00bcd4, #0097a7); }
        .icon-customers { background: linear-gradient(135deg, #ff9800, #ff5722); }
        .icon-pending { background: linear-gradient(135deg, #607d8b, #455a64); }
        
        .stat-trend {
            font-size: 12px;
            padding: 4px 10px;
            border-radius: 20px;
            font-weight: 600;
        }
        
        .trend-up { background: #e8f5e9; color: #2e7d32; }
        .trend-down { background: #ffebee; color: #c62828; }
        
        .stat-content h3 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stat-content p {
            color: var(--gray-color);
            font-size: 14px;
        }
        
        /* Quick Actions */
        .quick-actions {
            background: white;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        
        .section-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--dark-color);
        }
        
        .action-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 15px;
        }
        
        .action-btn {
            background: var(--primary-light);
            border: none;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            color: var(--dark-color);
            display: block;
        }
        
        .action-btn:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-3px);
        }
        
        .action-btn i {
            font-size: 24px;
            margin-bottom: 10px;
            display: block;
        }
        
        .action-btn span {
            font-weight: 500;
        }
        
        /* Recent Activity */
        .recent-activity {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        
        .activity-list {
            list-style: none;
        }
        
        .activity-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px 0;
            border-bottom: 1px solid var(--border-color);
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
        
        .activity-details h4 {
            font-size: 15px;
            margin-bottom: 5px;
        }
        
        .activity-details p {
            font-size: 13px;
            color: var(--gray-color);
        }
        
        .activity-time {
            font-size: 12px;
            color: var(--gray-color);
            margin-left: auto;
        }
        
        /* Footer */
        
        
        /* Responsive */
        @media (max-width: 1024px) {
            .main-container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                height: auto;
                position: static;
                padding: 15px 0;
            }
            
            .sidebar-menu {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }
            
            .sidebar-menu li {
                margin-bottom: 0;
            }
            
            .sidebar-menu li a {
                border-left: none;
                border-bottom: 3px solid transparent;
                padding: 10px 15px;
            }
            
            .sidebar-menu li a.active {
                border-left: none;
                border-bottom-color: var(--primary-color);
            }
            
            .menu-label {
                display: none;
            }
        }
        
        @media (max-width: 768px) {
            .header-top {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
            
            .nav-menu {
                flex-wrap: wrap;
                justify-content: center;
                gap: 15px;
            }
            
            .welcome-section {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }
            
            .date-time {
                text-align: center;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script>
        function updateDateTime() {
            const now = new Date();
            const options = { 
                weekday: 'long', 
                year: 'numeric', 
                month: 'long', 
                day: 'numeric' 
            };
            const timeOptions = { 
                hour: '2-digit', 
                minute: '2-digit',
                second: '2-digit',
                hour12: true 
            };
            
            document.getElementById('currentDate').textContent = 
                now.toLocaleDateString('en-US', options);
            document.getElementById('currentTime').textContent = 
                now.toLocaleTimeString('en-US', timeOptions);
        }
        
        // Update date and time every second
        setInterval(updateDateTime, 1000);
        
        // Initialize on page load
        document.addEventListener('DOMContentLoaded', updateDateTime);
    </script>
</head>
<body>
    <!-- Header -->
     <jsp:include page="Header.jsp"></jsp:include>

        <!-- Main Content -->
        <main class="content">
            <!-- Welcome Section -->
            <section class="welcome-section">
                <div class="welcome-text">
                    <h2>Welcome back, <%= firstName %>!</h2>
                    <p>Here's what's happening in your medical today.</p>
                </div>
                <div class="date-time">
                    <h3 id="currentTime"></h3>
                    <p id="currentDate"></p>
                </div>
            </section>

            <!-- Statistics Cards -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon icon-medicine">
                            <i class="fas fa-pills"></i>
                        </div>
                       
                    </div>
                    <div class="stat-content">
                        <h3><%= session.getAttribute("medcount")  %></h3>
                        <p>Total Medicines</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon icon-warning">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                       
                    </div>
                    <div class="stat-content">
                        <h3><%=  session.getAttribute("lowstockcount") %></h3>
                        <p>Low Stock Items</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon icon-danger">
                            <i class="fas fa-calendar-times"></i>
                        </div>
                        
                    </div>
                    <div class="stat-content">
                        <h3><%= session.getAttribute("getnearexpirycount") %></h3>
                        <p>Near Expiry</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon icon-success">
                            <i class="fa-solid fa-money-bill-trend-up"></i>
                        </div>
                       
                    </div>
                    <div class="stat-content">
                        <h3><%= session.getAttribute("todaysellcount") %></h3>
                        <p>Total Sales</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon icon-sales">
                           <i class="fa-solid fa-sack-xmark"></i>
                        </div>
                       
                    </div>
                    <div class="stat-content">
                        <h3>₹<%= session.getAttribute("total_revenue") %></h3>
                        <p>Total Revenue</p>
                    </div>
                </div>
                
               
                
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon icon-danger">
                            <i class="fas fa-skull-crossbones"></i>
                        </div>
                        
                    </div>
                    <div class="stat-content">
                        <h3><%= session.getAttribute("getexpiredcount") %></h3>
                        <p>Expired Medicines</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon icon-customers">
                           <i class="fa-solid fa-battery-empty"></i>
                        </div>
                       
                    </div>
                    <div class="stat-content">
                        <h3><%= session.getAttribute("outofstockcount") %></h3>
                        <p>Out off Stock</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon icon-success">
                            <i class="fa-solid fa-chart-line"></i>
                        </div>
                       
                    </div>
                    <div class="stat-content">
                        <h3><%= session.getAttribute("todaysrevenue") %></h3>
                        <p>Todays Sales</p>
                    </div>
                </div>
            </div>
            
            

            <!-- Quick Actions -->
            <section class="quick-actions">
                <h2 class="section-title">Quick Actions</h2>
                <div class="action-grid">
                    <a href="ShowMedicineServlet" class="action-btn">
                       <i class="fas fa-pills"></i>
                        <span>All Medicines</span>
                    </a>
                    <a href="AddMedicine.jsp" class="action-btn">
                        <i class="fas fa-plus-circle"></i>
                        <span>Add Medicine</span>
                    </a>
                    <a href="AddSale.jsp" class="action-btn">
                       <i class="fa-solid fa-pen-to-square"></i>
                        <span>New Sale</span>
                    </a>
                    <a href="FilterSaleServlet" class="action-btn">
                        <i class="fas fa-prescription"></i>
                        <span>Show Sales</span>
                    </a>
                    
                    
                   
                </div>
            </section>

           
        </main>
    </div>

    <%@ include file="Footer.jsp" %>
    
    <%} %>
</body>

</html>