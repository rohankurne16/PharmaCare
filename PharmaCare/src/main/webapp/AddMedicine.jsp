<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Medicine | PharmaCare</title>
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
        
        html, body {
    		height: 100%;
		}

		body {
		    display: flex;
		    flex-direction: column;
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
        
       .main-container {
    display: flex;
    flex: 1;   /* ✅ THIS IS THE KEY */
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
        
       
        
        .back-btn {
            background: var(--primary-light);
            color: var(--primary-color);
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .back-btn:hover {
            background: var(--primary-color);
            color: white;
        }
        
        /* Form Container */
        .form-container {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            max-width: 800px;
            margin: 0 auto;
        }
        
        /* Form Styles */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .page-wrapper {
    flex: 1;
    display: flex;
    flex-direction: column;
}
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--dark-color);
            font-size: 14px;
        }
        
        .form-group label.required::after {
            content: " *";
            color: var(--danger-color);
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid var(--border-color);
            border-radius: 8px;
            font-size: 15px;
            background-color: var(--light-color);
            transition: all 0.3s;
            color: var(--dark-color);
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            background-color: white;
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.1);
        }
        
        .form-control::placeholder {
            color: #999;
        }
        
        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%235f6368' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 16px;
            padding-right: 40px;
        }
        
        /* File Upload */
        .file-upload {
            position: relative;
            overflow: hidden;
        }
        
        .file-upload input[type="file"] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: pointer;
            display: block;
        }
        
        .file-upload-label {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px 15px;
            background: var(--light-color);
            border: 2px dashed var(--border-color);
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .file-upload-label:hover {
            border-color: var(--primary-color);
            background: var(--primary-light);
        }
        
        .file-upload-label i {
            color: var(--primary-color);
            font-size: 18px;
        }
        
        .file-upload-label span {
            color: var(--gray-color);
        }
        
        /* Button Styles */
        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid var(--border-color);
        }
        
        .btn {
            padding: 14px 28px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            text-decoration: none;
        }
        
        .btn-primary {
            background: linear-gradient(to right, #1a73e8, #4285f4);
            color: white;
            flex: 1;
        }
        
        .btn-primary:hover {
            background: linear-gradient(to right, #0d62d9, #1a73e8);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(26, 115, 232, 0.25);
        }
        
        .btn-secondary {
            background: var(--light-color);
            color: var(--gray-color);
        }
        
        .btn-secondary:hover {
            background: #e8e8e8;
        }
        
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

.page-actions {
    display: flex;
    align-items: center;
}
        
        /* Info Box */
        .info-box {
            background: var(--primary-light);
            border-left: 4px solid var(--primary-color);
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 25px;
            font-size: 14px;
            color: var(--dark-color);
        }
        
        .info-box i {
            color: var(--primary-color);
            margin-right: 10px;
        }
        
        
        /* Responsive */
        @media (max-width: 1024px) {
            .main-container {
                flex-direction: column;
            }
            
            
            
            .menu-label {
                display: none;
            }
            
            .form-grid {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 768px) {
           
            
            .nav-menu {
                flex-wrap: wrap;
                justify-content: center;
                gap: 15px;
            }
            
            
            
            .back-btn {
                align-self: stretch;
                justify-content: center;
            }
            
            .form-actions {
                flex-direction: column;
            }
        }
        
        @media (max-width: 480px) {
            .content {
                padding: 20px;
            }
            
            .form-container {
                padding: 20px;
            }
        }
        
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
.error-box {
    margin-top: 20px;
    padding: 15px 20px;
    background: #fdecea;
    border-left: 5px solid #ea4335;
    border-radius: 8px;
    display: flex;
    align-items: center;
    gap: 10px;
    color: #b71c1c;
    font-size: 14px;
}

.error-icon {
    font-size: 18px;
}

        
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<div class="page-wrapper">
    <!-- Header -->
    <%@ include file="Header.jsp" %>
    <!-- Main Container -->
    <div class="main-container">
        <!-- Sidebar -->
        

        <!-- Main Content -->
        <main class="content">
            <!-- Page Header -->
            <div class="page-header">
                <div class="page-title">
                    <h2><i class="fas fa-plus-circle"></i> Add New Medicine</h2>
                    <p>Add a new medicine to your pharmacy inventory</p>
                </div>
                <a href="GetCountServlet" class="back-btn">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>

            <!-- Info Box -->
            <div class="info-box">
                <i class="fas fa-info-circle"></i>
                Please fill in all required fields (*) to add a new medicine to your inventory. Ensure accuracy in expiry dates and pricing.
            </div>

            <!-- Form Container -->
            <div class="form-container">
                <form action="AddMedicineServlet" method="post" enctype="multipart/form-data">
                    <div class="form-grid">
                        <!-- Left Column -->
                        <div>
                            <div class="form-group">
                                <label class="required">Medicine Name</label>
                                <input type="text" 
                                       name="medicine_name" 
                                       class="form-control" 
                                       placeholder="Enter medicine name" 
                                       required>
                            </div>
                            
                            <div class="form-group">
                                <label>Brand Name</label>
                                <input type="text" 
                                       name="brand_name" 
                                       class="form-control" 
                                       placeholder="Enter brand name">
                            </div>
                            
                            <div class="form-group">
                                <label class="required">Category</label>
                                <select name="category" class="form-control" required>
                                    <option value="">-- Select Category --</option>
                                    <option value="Tablet">Tablet</option>
                                    <option value="Capsule">Capsule</option>
                                    <option value="Syrup">Syrup</option>
                                    <option value="Injection">Injection</option>
                                    <option value="Cream">Cream</option>
                                    <option value="Ointment">Ointment</option>
                                    <option value="Drops">Drops</option>
                                    <option value="Inhaler">Inhaler</option>
                                    <option value="Powder">Powder</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            
                            
                            
                           
                        </div>
                        
                        <!-- Right Column -->
                        <div>
                            <div class="form-group">
                                <label class="required">Quantity</label>
                                <input type="number" 
                                       name="qty" 
                                       class="form-control" 
                                       placeholder="Enter quantity" 
                                       min="0" 
                                       required>
                            </div>
                            
                            <div class="form-group">
                                <label class="required">Price (per unit)</label>
                                <input type="number" 
                                       name="price" 
                                       class="form-control" 
                                       placeholder="Enter price" 
                                       step="0.01" 
                                       min="0" 
                                       required>
                            </div>
                            
                            <div class="form-group">
                                <label>Manufacture Date</label>
                                <input type="date" 
                                       name="manufacture_date" 
                                       class="form-control">
                            </div>
                            
                            <div class="form-group">
                                <label class="required">Expiry Date</label>
                                <input type="date" 
                                       name="expiry_date" 
                                       class="form-control" 
                                       required>
                            </div>
                            
                            <div class="form-group">
                                <label>Rack/Shelf Number</label>
                                <input type="text" 
                                       name="rack_no" 
                                       class="form-control" 
                                       placeholder="e.g., Rack A-12">
                            </div>
                            
                           
                            
                            <div class="form-group">
                                <label>Medicine Image</label>
                                <div class="file-upload">
                                    <input type="file" 
                                           name="image" 
                                           id="medicineImage" 
                                           accept="image/*">
                                    <label for="medicineImage" class="file-upload-label">
                                        <i class="fas fa-cloud-upload-alt"></i>
                                        <span>Choose image file...</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Additional Fields -->
                    <div class="form-group">
                        <label>Description</label>
                        <textarea name="description" 
                                  class="form-control" 
                                  rows="3" 
                                  placeholder="Enter medicine description, usage instructions, etc."></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label>Dosage Information</label>
                        <input type="text" 
                               name="dosage" 
                               class="form-control" 
                               placeholder="e.g., 500mg, 10ml, etc.">
                    </div>
                    
                    <!-- Form Actions -->
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-plus-circle"></i> Add Medicine
                        </button>
                        <button type="reset" class="btn btn-secondary">
                            <i class="fas fa-redo"></i> Reset Form
                        </button>
                    </div>
                </form>
                
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
            </div>
        </main>
    </div>
</div>
    <!-- Footer -->
   <%@ include file="Footer.jsp" %>

    <script>
        // File upload preview
        document.getElementById('medicineImage').addEventListener('change', function(e) {
            const fileName = e.target.files[0] ? e.target.files[0].name : 'Choose image file...';
            document.querySelector('.file-upload-label span').textContent = fileName;
        });
        
        // Date validation
        const today = new Date().toISOString().split('T')[0];
        document.querySelector('input[name="expiry_date"]').min = today;
        
        // Set default expiry date to 2 years from now
        const defaultExpiry = new Date();
        defaultExpiry.setFullYear(defaultExpiry.getFullYear() + 2);
        document.querySelector('input[name="expiry_date"]').value = defaultExpiry.toISOString().split('T')[0];
        
        // Set default reorder level to 10
        document.querySelector('input[name="reorder_level"]').value = 10;
    </script>
</body>
</html>