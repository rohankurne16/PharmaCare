<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Boolean verified = (Boolean) session.getAttribute("otpVerified");
    if (verified == null || !verified) {
        response.sendRedirect("ForgotPassword.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password | ShopEase</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        /* Container */
        .container {
            width: 100%;
            max-width: 450px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            overflow: hidden;
        }
        
        /* Header */
        .header {
            background: linear-gradient(to right, #4CAF50, #2ECC71);
            color: white;
            padding: 35px 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .header p {
            opacity: 0.9;
            font-size: 16px;
            max-width: 300px;
            margin: 0 auto;
            line-height: 1.5;
        }
        
        /* Form Container */
        .form-container {
            padding: 35px;
        }
        
        /* Form Elements */
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: #333;
            font-size: 14px;
        }
        
        .input-container {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
            font-size: 18px;
        }
        
        .form-control {
            width: 100%;
            padding: 16px 16px 16px 50px;
            border: 2px solid #e1e5ee;
            border-radius: 12px;
            font-size: 16px;
            background-color: #f8f9fa;
            transition: all 0.3s;
            color: #333;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #4CAF50;
            background-color: white;
            box-shadow: 0 0 0 4px rgba(76, 175, 80, 0.1);
        }
        
        .form-control::placeholder {
            color: #888;
        }
        
        /* Button */
        .btn {
            width: 100%;
            padding: 18px;
            background: linear-gradient(to right, #4CAF50, #2ECC71);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }
        
        .btn:hover {
            background: linear-gradient(to right, #3d8b40, #27ae60);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(76, 175, 80, 0.25);
        }
        
        .btn:active {
            transform: translateY(0);
        }
        
        /* Messages */
        .message-box {
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 25px;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 12px;
            animation: slideIn 0.5s ease-out;
        }
        
        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        
        .error-box {
            background-color: #ffebee;
            color: #c62828;
            border-left: 4px solid #e74c3c;
        }
        
        .error-icon {
            color: #e74c3c;
            font-size: 20px;
            flex-shrink: 0;
        }
        
        /* Info Box */
        .info-box {
            background-color: #f0f7ff;
            color: #1565c0;
            border-left: 4px solid #4a00e0;
            margin-bottom: 25px;
            padding: 15px;
            border-radius: 10px;
            display: flex;
            align-items: flex-start;
            gap: 12px;
            font-size: 14px;
            text-align: left;
        }
        
        .info-icon {
            color: #4a00e0;
            font-size: 20px;
            flex-shrink: 0;
            margin-top: 2px;
        }
        
        /* Password Requirements */
        .requirements {
            margin-top: 8px;
            padding: 12px 15px;
            background-color: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #4CAF50;
            font-size: 13px;
            color: #555;
        }
        
        .requirements ul {
            margin-left: 20px;
            margin-top: 5px;
        }
        
        .requirements li {
            margin-bottom: 4px;
        }
        
        /* Footer Links */
        .footer {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .footer a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s;
        }
        
        .footer a:hover {
            text-decoration: underline;
        }
        
        /* Responsive */
        @media (max-width: 500px) {
            .container {
                border-radius: 16px;
            }
            
            .header {
                padding: 30px 20px;
            }
            
            .form-container {
                padding: 30px 20px;
            }
            
            .header h1 {
                font-size: 28px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1><i class="fas fa-key"></i> Reset Password</h1>
            <p>Create a new secure password for your account</p>
        </div>
        
        <!-- Form Container -->
        <div class="form-container">
            <!-- Info Box -->
            <div class="info-box">
                <i class="fas fa-info-circle info-icon"></i>
                <div>
                    <strong>Security Tip:</strong> Create a strong password that you haven't used before on other websites.
                </div>
            </div>
            
            <!-- Error Message -->
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <div class="message-box error-box" id="errorBox">
                    <i class="fas fa-exclamation-circle error-icon"></i>
                    <div><%= error %></div>
                </div>
            <%
                }
            %>
            
            <!-- Main Form -->
            <form action="ResetPasswordServlet" method="post">
                <div class="form-group">
                    <label for="password">New Password</label>
                    <div class="input-container">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" 
                               id="password" 
                               name="password" 
                               class="form-control" 
                               placeholder="Enter new password" 
                               required
                               pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"
                               title="Password must be at least 8 characters with uppercase, lowercase, and number">
                    </div>
                    
                    <div class="requirements">
                        <strong>Password must include:</strong>
                        <ul>
                            <li>At least 8 characters</li>
                            <li>One uppercase letter (A-Z)</li>
                            <li>One lowercase letter (a-z)</li>
                            <li>One number (0-9)</li>
                        </ul>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="confirm">Confirm Password</label>
                    <div class="input-container">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" 
                               id="confirm" 
                               name="confirm" 
                               class="form-control" 
                               placeholder="Confirm new password" 
                               required>
                    </div>
                </div>
                
                <button type="submit" class="btn">
                    <i class="fas fa-check-circle"></i> Update Password
                </button>
            </form>
            
            <!-- Footer -->
            <div class="footer">
                <a href="Login.jsp">
                    <i class="fas fa-arrow-left"></i> Back to Login
                </a>
            </div>
        </div>
    </div>
    
    <!-- JavaScript for auto-hiding messages -->
    <script>
        // Auto-hide error message after 5 seconds
        setTimeout(() => {
            const errorBox = document.getElementById("errorBox");
            if (errorBox) {
                errorBox.remove();
            }
        }, 5000);
    </script>
</body>
</html>