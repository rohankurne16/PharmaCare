<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify OTP | ShopEase</title>
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
        
        /* OTP Input Styles */
        .otp-group {
            margin-bottom: 25px;
        }
        
        .otp-input {
            width: 100%;
            padding: 18px;
            font-size: 24px;
            letter-spacing: 12px;
            text-align: center;
            border-radius: 12px;
            border: 2px solid #e1e5ee;
            background: #f8f9fa;
            transition: all 0.3s;
            color: #333;
            font-weight: 600;
        }
        
        .otp-input:focus {
            outline: none;
            border-color: #4CAF50;
            background: white;
            box-shadow: 0 0 0 4px rgba(76, 175, 80, 0.1);
        }
        
        .otp-input::placeholder {
            color: #aaa;
            letter-spacing: normal;
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
        
        /* Resend Section */
        .resend-section {
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            text-align: center;
            font-size: 14px;
            color: #666;
        }
        
        .resend-btn {
            background: none;
            border: none;
            color: #4CAF50;
            font-size: 14px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 5px 10px;
            border-radius: 6px;
        }
        
        .resend-btn:hover {
            color: #3d8b40;
            background-color: #f8f9fa;
        }
        
        .resend-btn:active {
            transform: scale(0.98);
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
            
            .otp-input {
                padding: 16px;
                font-size: 20px;
                letter-spacing: 8px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1><i class="fas fa-shield-alt"></i> Verify OTP</h1>
            <p>Enter the 6-digit code sent to your email</p>
        </div>
        
        <!-- Form Container -->
        <div class="form-container">
            <!-- Info Box -->
            <div class="info-box">
                <i class="fas fa-info-circle info-icon"></i>
                <div>
                    <strong>Note:</strong> Check your email for the 6-digit OTP. The code will expire after 10 minutes. If you didn't receive it, you can resend.
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
            <form action="VerifyOTPServlet" method="post">
                <div class="otp-group">
                    <input type="text" 
                           name="otp" 
                           class="otp-input" 
                           maxlength="6" 
                           placeholder="••••••" 
                           required
                           pattern="[0-9]{6}"
                           title="Please enter a 6-digit OTP">
                </div>
                
                <button type="submit" class="btn">
                    <i class="fas fa-check-circle"></i> Verify OTP
                </button>
            </form>
            
            <!-- Resend Form -->
            <div class="resend-section">
                <span>Didn't receive OTP?</span>
                <form action="ResendOTPServlet" method="post" style="display: inline;">
                    <button type="submit" class="resend-btn">
                        <i class="fas fa-redo"></i> Resend OTP
                    </button>
                </form>
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