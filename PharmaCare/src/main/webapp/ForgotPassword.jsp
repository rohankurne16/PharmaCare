<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Account Recovery</title>
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
            background: linear-gradient(to right, #4a00e0, #8e2de2);
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
            border-color: #4a00e0;
            background-color: white;
            box-shadow: 0 0 0 4px rgba(74, 0, 224, 0.1);
        }
        
        .form-control::placeholder {
            color: #888;
        }
        
        /* Button */
        .btn {
            width: 100%;
            padding: 18px;
            background: linear-gradient(to right, #4a00e0, #8e2de2);
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
            background: linear-gradient(to right, #3a00b0, #7a1dc2);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(74, 0, 224, 0.25);
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
        
        .success-box {
            background-color: #e8f5e9;
            color: #2e7d32;
            border-left: 4px solid #4CAF50;
        }
        
        .success-icon {
            color: #2ecc71;
            font-size: 20px;
            flex-shrink: 0;
        }
        
        .info-box {
            background-color: #f0f7ff;
            color: #1565c0;
            border-left: 4px solid #2196F3;
            margin-bottom: 25px;
            padding: 15px;
            border-radius: 10px;
            display: flex;
            align-items: flex-start;
            gap: 12px;
            font-size: 14px;
        }
        
        .info-icon {
            color: #4a00e0;
            font-size: 20px;
            flex-shrink: 0;
            margin-top: 2px;
        }
        
        /* Footer Links */
        .footer {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .footer a {
            color: #4a00e0;
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
            <h1><i class="fas fa-key"></i> Forgot Password</h1>
            <p>Enter your registered email to reset your password</p>
        </div>
        
        <!-- Form Container -->
        <div class="form-container">
            <!-- Info Box -->
            <div class="info-box">
                <i class="fas fa-info-circle info-icon"></i>
                <div>
                    <strong>How it works:</strong> Enter your email address. We'll send you a One-Time Password (OTP) to verify your identity and help you reset your password securely.
                </div>
            </div>
            
            <!-- Error/Success Messages -->
            <%
                String error = (String) request.getAttribute("error");
                String success = (String) request.getAttribute("success");
                
                if (error != null) {
            %>
                <div class="message-box error-box" id="errorBox">
                    <i class="fas fa-exclamation-circle error-icon"></i>
                    <div><%= error %></div>
                </div>
            <%
                }
                
                if (success != null) {
            %>
                <div class="message-box success-box" id="successBox">
                    <i class="fas fa-check-circle success-icon"></i>
                    <div><%= success %></div>
                </div>
            <%
                }
            %>
            
            <!-- Main Form -->
            <form action="ForgotPasswordServlet" method="post">
                <div class="form-group">
                    <label for="email">Registered Email Address</label>
                    <div class="input-container">
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" 
                               id="email" 
                               name="email" 
                               class="form-control" 
                               placeholder="Enter your registered email address" 
                               required>
                    </div>
                </div>
                
                <button type="submit" class="btn">
                    <i class="fas fa-paper-plane"></i> Send Reset Instructions
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
        // Auto-hide error/success messages after 5 seconds
        setTimeout(() => {
            const errorBox = document.getElementById("errorBox");
            if (errorBox) {
                errorBox.remove();
            }
            
            const successBox = document.getElementById("successBox");
            if (successBox) {
                successBox.remove();
            }
        }, 5000);
    </script>
</body>
</html>