<%@ page import="com.PharmaCare.bin.Medicine" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Medicine m = (Medicine) request.getAttribute("medicine");

    String imageName = m.getImage();
    if (imageName != null && imageName.contains("\\")) {
        imageName = imageName.substring(imageName.lastIndexOf("\\") + 1);
    }
    String imagePath = request.getContextPath() + "/images/" + imageName;


    long daysLeft = (m.getExpiry_date().getTime() - System.currentTimeMillis()) 
                    / (1000 * 60 * 60 * 24);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Medicine</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* ===== Body Flex Layout for Footer at Bottom ===== */
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        body {
            font-family: Arial, sans-serif;
            background: #e6f0ff;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Dashboard wrapper */
        .dashboard-wrapper {
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        /* Dashboard content grows to fill space */
        .dashboard {
            flex: 1;
            padding: 20px 40px;
        }

        a { text-decoration: none; }

        .page-title {
            text-align: center;
            font-size: 2em;
            color: #1a73e8;
            margin-bottom: 30px;
        }

        .update-container {
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
            justify-content: center;
        }
        .info-container, .update-form-container {
    background: #fff;
    border-radius: 12px;
    width: 600px; /* Increased from 480px */
    min-height: 700px;
    padding: 25px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
}

.form-group { 
    margin-bottom: 18px; 
    width: 460px; /* match container width */
}
        

        .info-container, .update-form-container {
            background: #fff;
            border-radius: 12px;
            width: 480px;
            min-height: 700px;
            padding: 25px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .info-header, .form-header {
            font-size: 1.5em;
            font-weight: bold;
            color: #1a73e8;
            margin-bottom: 20px;
            text-align: center;
        }

        .circular-image-container {
            margin-bottom: 20px;
        }
        .circular-image-wrapper {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            padding: 8px;
            background: #cce0ff;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .circular-image {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #1a73e8;
        }

        .info-grid {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        .info-item {
            background: #f0f5ff;
            padding: 10px 12px;
            border-radius: 8px;
            border-left: 4px solid #1a73e8;
        }
        .info-item strong { color: #1a73e8; }
        .warn { color: #ff9800; font-weight: bold; }
        .danger { color: #f44336; font-weight: bold; }

        
        .form-label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #1a73e8;
        }
        .form-input, .form-select, .form-textarea, .file-input {
            width: 100%;
            padding: 10px 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 0.95em;
        }
        .form-textarea { height: 80px; resize: vertical; }
        .preview-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-top: 10px;
            display: none;
            border: 2px solid #1a73e8;
        }

        .update-btn {
            margin-top: auto;
            padding: 12px;
            background: #1a73e8;
            color: #fff;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1em;
            transition: 0.3s;
        }
        .update-btn:hover { background: #155ab6; }

        /* Footer fixes */
        footer { margin-top: auto; }

        @media (max-width: 1000px) {
            .update-container { flex-direction: column; align-items: center; }
        }
    </style>
</head>
<body>

<jsp:include page="Header.jsp"></jsp:include>

<div class="dashboard-wrapper">
    <div class="dashboard">
        <div class="page-title">Update Medicine</div>

        <div class="update-container">
            <!-- Left: Current Medicine Info -->
            <div class="info-container">
                <div class="info-header">Current Medicine Details</div>

                <div class="circular-image-container">
                    <div class="circular-image-wrapper">
                         <!-- Current Medicine Image -->
							<div style="width: 250px; margin: auto; margin-bottom: 20px;">
							    <img class="medicine-image"
							         src="<%= imagePath %>"
							         onerror="this.src='<%= request.getContextPath() %>/images/placeholder.jpg';"
							         style="width: 100%; height: 180px; object-fit: cover; border-radius: 8px;">
							</div>

                    </div>
                </div>

                <div class="info-grid">
                    <div class="info-item"><strong>Medicine Name:</strong> <%= m.getMedicine_name() %></div>
                    <div class="info-item"><strong>Brand Name:</strong> <%= m.getBrand_name() %></div>
                    <div class="info-item"><strong>Category:</strong> <%= m.getCategory() %></div>
                    <div class="info-item">
                        <strong>Quantity:</strong> <%= m.getQuantity() %>
                        <% if(m.getQuantity() <= 10){ %>
                            <span class="warn">Low Stock</span>
                        <% }else if(m.getQuantity()== 0){ %>
                        	 <span class="warn">Out of Stock</span>
                        <%} %>
                    </div>
                    <div class="info-item"><strong>Price:</strong> ₹<%= m.getPrice() %></div>
                    <div class="info-item"><strong>Manufacture Date:</strong> <%= m.getManufacture_date() %></div>
                    <div class="info-item">
                        <strong>Expiry Date:</strong> <%= m.getExpiry_date() %>
                        <% if(daysLeft <= 30){ %>
                            <span class="danger">Expiring in <%= daysLeft %> days</span>
                        <% } %>
                    </div>
                    <div class="info-item"><strong>Rack No:</strong> <%= m.getRack_no() %></div>
                    <div class="info-item"><strong>Description:</strong> <%= m.getDesc() %></div>
                    <div class="info-item"><strong>Dosage Info:</strong> <%= m.getDosage_info() %></div>
                </div>
            </div>

            <!-- Right: Update Form -->
            <div class="update-form-container">
                <div class="form-header">Update Medicine</div>
                
<form action="UpdateMedicineServlet?medicine_id=<%= m.getMedicine_id() %>" method="post" enctype="multipart/form-data">

                
                 
                  
                    <div class="form-group">
                        <label class="form-label">Medicine Name</label>
                        <input type="text" name="medicine_name" class="form-input" value="<%= m.getMedicine_name() %>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Brand Name</label>
                        <input type="text" name="brand_name" class="form-input" value="<%= m.getBrand_name() %>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Category</label>
                        <input type="text" name="category" class="form-input" value="<%= m.getCategory() %>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Quantity</label>
                        <input type="number" name="quantity" class="form-input" value="<%= m.getQuantity() %>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Price (₹)</label>
                        <input type="text" name="price" class="form-input" value="<%= m.getPrice() %>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Manufacture Date</label>
                        <input type="date" name="manufacture_date" class="form-input" value="<%= m.getManufacture_date() %>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Expiry Date</label>
                        <input type="date" name="expiry_date" class="form-input" value="<%= m.getExpiry_date() %>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Rack No</label>
                        <input type="text" name="rack_no" class="form-input" value="<%= m.getRack_no() %>" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-textarea" required><%= m.getDesc() %></textarea>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Dosage Info</label>
                        <textarea name="dosage_info" class="form-textarea" required><%= m.getDosage_info() %></textarea>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Medicine Image</label>
                        <input type="file" name="image" class="file-input" accept="image/*" onchange="previewImage(this)">
                        <img id="imagePreview" class="preview-img">
                    </div>

                    <button type="submit" class="update-btn">Update Medicine</button>
                    
                    
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <jsp:include page="Footer.jsp"></jsp:include>
    </footer>
</div>

<script>
function previewImage(input) {
    const preview = document.getElementById('imagePreview');
    if(input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.style.display = 'block';
        }
        reader.readAsDataURL(input.files[0]);
    } else {
        preview.style.display = 'none';
    }
}
</script>
</body>
</html>
