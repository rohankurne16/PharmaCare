<%@page import="com.PharmaCare.bin.Register"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

			<%
					
					ArrayList<Register> arr = (ArrayList<Register>) session.getAttribute("loggeduser");
			
			if(arr != null && !arr.isEmpty()){
					
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
            top: 88px;
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
        .footer {
            background: white;
            padding: 20px 30px;
            border-top: 1px solid var(--border-color);
            text-align: center;
            color: var(--gray-color);
            font-size: 14px;
        }
        
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
        
        /* Inventory Highlights */
.sidebar-menu a.low-stock {
    background: #fff8e1;
    color: #f57c00;
    border-left: 4px solid #fbbc04;
    font-weight: 600;
}

.sidebar-menu a.out-stock {
    background: #ffebee;
    color: #c62828;
    border-left: 4px solid #ea4335;
    font-weight: 600;
}

.sidebar-menu a.expired {
    background: #fce4ec;
    color: #ad1457;
    border-left: 4px solid #d81b60;
    font-weight: 600;
}

.sidebar-menu a.near-expiry {
    background: #e3f2fd;
    color: #1565c0;
    border-left: 4px solid #1a73e8;
    font-weight: 600;
}

/* Icon emphasis */
.sidebar-menu a.low-stock i,
.sidebar-menu a.out-stock i,
.sidebar-menu a.expired i,
.sidebar-menu a.near-expiry i {
    font-size: 18px;
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
</head>
<body>
	<header class="header">
        <div class="header-top">
            <div class="logo">
                <div class="logo-icon">
                    <i class="fas fa-pills"></i>
                </div>
                <div class="logo-text">
                    <h1>Pharma<span>Care</span></h1>
                    <p>Medical Inventory Management System</p>
                </div>
            </div>
            
            <div class="user-info">
                <div class="user-avatar">
                    A
                </div>
                <div class="user-details">
                
             
					    <h3><%= firstName %></h3>
					    <p>Medical Owner</p>
					

                </div>
            </div>
        </div>
        
        
        
    </header>

    <!-- Main Container -->
    <div class="main-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <ul class="sidebar-menu">
                <li class="menu-label">Dashboard</li>
                <li><a href="GetCountServlet" ><i class="fas fa-tachometer-alt"></i> DashBoard</a></li>
               
                
                <li class="menu-label">Inventory</li>
                <li><a href="ShowMedicineServlet"><i class="fas fa-pills"></i> All Medicines</a></li>
               <li>
				  <a href="ShowLowStockServlet" class="low-stock">
				    <i class="fas fa-exclamation-triangle"></i> Low Stock
				  </a>
				</li>
				
				<li>
				  <a href="ShowOutofStockServlet" class="out-stock">
				    <i class="fa-solid fa-battery-empty"></i> Out of Stock
				  </a>
				</li>
				
				<li>
				  <a href="ShowExpiredMedicineServet" class="expired">
				    <i class="fas fa-calendar-times"></i> Expired Medicines
				  </a>
				</li>
				
				<li>
				  <a href="CheckExpiryDateServlet" class="near-expiry">
				    <i class="fas fa-boxes"></i> Near Expiry Medicines
				  </a>
				</li>

                
                <li class="menu-label">Transactions</li>
                <li><a href="ShowRackServlet"><i class="fas fa-cash-register"></i> See Occupancy</a></li>
                <li><a href="ShowCartServlet"><i class="fas fa-shopping-cart"></i> Show Cart</a></li>
                <li><a href="ShowOrdersServlet"><i class="fas fa-exchange-alt"></i> Show All Orders</a></li>
               <li>
				    <a href="LogoutServlet" onclick="return confirmLogout(event)">
				        <i class="fas fa-sign-out-alt"></i> Logout
				    </a>
				</li>
            </ul>
        </aside>
<%}}
					else{ %>

			<% response.sendRedirect("Login.jsp"); %>

<%} %>
</body>

<script>
function confirmLogout(event) {
    
    const ok = confirm("Are you sure you want to logout?");
    if (!ok) {
       
        event.preventDefault();
    }
    return ok; 
}
</script>
</html>