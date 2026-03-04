<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Account</title>
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
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            width: 100%;
            max-width: 480px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            padding: 40px;
            position: relative;
            overflow: hidden;
        }
        
        .container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(to right, #4a00e0, #8e2de2);
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .header h1 {
            color: #4a00e0;
            font-size: 32px;
            margin-bottom: 10px;
            font-weight: 700;
        }
        
        .header p {
            color: #666;
            font-size: 16px;
        }
        
        .form-group {
            margin-bottom: 25px;
            position: relative;
        }
        
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: #333;
            font-size: 14px;
        }
        
        .required::after {
            content: " *";
            color: #e74c3c;
        }
        
        .input-container {
            position: relative;
            width: 100%;
        }
        
        .input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
            font-size: 18px;
        }
        
        input {
            width: 100%;
            padding: 16px 16px 16px 50px;
            border: 2px solid #e1e5ee;
            border-radius: 12px;
            font-size: 16px;
            background-color: #f8f9fa;
            transition: all 0.3s;
            color: #333;
        }
        
        input:focus {
            outline: none;
            border-color: #4a00e0;
            background-color: white;
            box-shadow: 0 0 0 4px rgba(74, 0, 224, 0.1);
        }
        
        input:valid:not(:placeholder-shown) {
            border-color: #2ecc71;
            background-color: #f9fff9;
        }
        
        input:invalid:not(:placeholder-shown) {
            border-color: #e74c3c;
            background-color: #fff5f5;
        }
        
        .password-container {
            position: relative;
        }
        
        .toggle-password {
            position: absolute;
            right: 18px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #666;
            cursor: pointer;
            font-size: 18px;
            padding: 5px;
            z-index: 2;
        }
        
        .requirements {
            margin-top: 8px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 10px;
            border-left: 4px solid #4a00e0;
            font-size: 14px;
            color: #555;
        }
        
        .requirements ul {
            margin-left: 20px;
            margin-top: 8px;
        }
        
        .requirements li {
            margin-bottom: 5px;
        }
        
        .validation-message {
            font-size: 13px;
            margin-top: 8px;
            padding-left: 5px;
            display: flex;
            align-items: center;
            min-height: 20px;
            color: #666;
        }
        
        .status-indicator {
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin-right: 8px;
            background-color: #f39c12;
        }
        
        .error-box {
            background: rgba(231, 76, 60, 0.1);
            border-left: 4px solid #e74c3c;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        
        .error-icon {
            color: #e74c3c;
            font-size: 20px;
            flex-shrink: 0;
        }
        
        .error-text {
            color: #d63031;
            font-size: 14px;
            line-height: 1.4;
        }
        
        .submit-btn {
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
        
        .submit-btn:hover {
            background: linear-gradient(to right, #3a00b0, #7a1dc2);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(74, 0, 224, 0.25);
        }
        
        .submit-btn:active {
            transform: translateY(0);
        }
        
        .form-footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid #eee;
            color: #666;
            font-size: 15px;
        }
        
        .form-footer a {
            color: #4a00e0;
            text-decoration: none;
            font-weight: 600;
        }
        
        .form-footer a:hover {
            text-decoration: underline;
        }
        
        .success-message {
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #4CAF50;
            margin-bottom: 25px;
            display: none;
        }
        
        @media (max-width: 500px) {
            .container {
                padding: 30px 25px;
                border-radius: 16px;
            }
            
            .header h1 {
                font-size: 28px;
            }
            
            input {
                padding: 14px 14px 14px 45px;
            }
        }
        
        /* CSS-only validation feedback */
        input:valid:not(:placeholder-shown) + .validation-message .status-indicator {
            background-color: #2ecc71;
        }
        
        input:valid:not(:placeholder-shown) + .validation-message span:last-child {
            color: #2ecc71;
        }
        
        input:invalid:not(:placeholder-shown) + .validation-message .status-indicator {
            background-color: #e74c3c;
        }
        
        input:invalid:not(:placeholder-shown) + .validation-message span:last-child {
            color: #e74c3c;
        }
        
        form:valid #successMessage {
            display: block;
        }
        
        form:invalid #successMessage {
            display: none;
        }
        
        #password:valid:not(:placeholder-shown) ~ * ~ .requirements {
            border-left-color: #2ecc71;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Create Account</h1>
            <p>Please fill in all required fields to register</p>
        </div>
        
        <div class="success-message" id="successMessage">
            <i class="fas fa-check-circle"></i> Registration successful! Please check your email.
        </div>
        
        <form id="registrationForm" method="post" action="Register" novalidate>
            <!-- Name Field -->
            <div class="form-group">
                <label for="name" class="required">Full Name</label>
                <div class="input-container">
                    <i class="fas fa-user input-icon"></i>
                    <input 
                        type="text" 
                        id="name" 
                        name="name" 
                        placeholder="Enter your full name" 
                        pattern="[A-Za-z\s]{2,50}"
                        title="Name should contain only letters and spaces (2-50 characters)"
                        required
                    >
                </div>
                <div class="validation-message">
                    <span class="status-indicator"></span>
                    <span id="nameMessage">Enter 2-50 letters only</span>
                </div>
            </div>
            
            <!-- Phone Field -->
            <div class="form-group">
                <label for="phone" class="required">Phone Number</label>
                <div class="input-container">
                    <i class="fas fa-phone input-icon"></i>
                    <input 
                        type="tel" 
                        id="phone" 
                        name="phone" 
                        placeholder="Enter 10-digit phone number"
                        pattern="[0-9]{10}"
                        title="Please enter a valid 10-digit phone number"
                        required
                    >
                </div>
                <div class="validation-message">
                    <span class="status-indicator"></span>
                    <span id="phoneMessage">10 digits required</span>
                </div>
            </div>
            
            <!-- Email Field -->
            <div class="form-group">
                <label for="email" class="required">Email Address</label>
                <div class="input-container">
                    <i class="fas fa-envelope input-icon"></i>
                    <input 
                        type="email" 
                        id="email" 
                        name="email" 
                        placeholder="example@domain.com"
                        pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                        title="Please enter a valid email address"
                        required
                    >
                </div>
                <div class="validation-message">
                    <span class="status-indicator"></span>
                    <span id="emailMessage">Valid email format required</span>
                </div>
            </div>
            
            <!-- Password Field -->
            <div class="form-group">
                <label for="password" class="required">Password</label>
                <div class="password-container">
                    <div class="input-container">
                        <i class="fas fa-lock input-icon"></i>
                        <input 
                            type="password" 
                            id="password" 
                            name="password" 
                            placeholder="Create a strong password"
                            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"
                            title="Password must be at least 8 characters with uppercase, lowercase, and number"
                            required
                        >
                        <button type="button" class="toggle-password" onclick="togglePasswordVisibility('password', this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
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
                
                <div class="validation-message">
                    <span class="status-indicator"></span>
                    <span id="passwordMessage">Must meet all requirements above</span>
                </div>
            </div>
            
            <!-- Confirm Password Field -->
            <div class="form-group">
                <label for="confirmPassword" class="required">Confirm Password</label>
                <div class="password-container">
                    <div class="input-container">
                        <i class="fas fa-lock input-icon"></i>
                        <input 
                            type="password" 
                            id="confirmPassword" 
                            name="confirmPassword" 
                            placeholder="Re-enter your password"
                            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"
                            title="Passwords must match"
                            required
                        >
                        <button type="button" class="toggle-password" onclick="togglePasswordVisibility('confirmPassword', this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
                <div class="validation-message">
                    <span class="status-indicator"></span>
                    <span id="confirmPasswordMessage">Passwords must match</span>
                </div>
            </div>
            
            <!-- Error Message -->
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
            
            <!-- Submit Button -->
            <button type="submit" class="submit-btn">
                <i class="fas fa-user-plus"></i> Register Account
            </button>
        </form>
        
        <div class="form-footer">
            Already have an account? <a href="Login.jsp">Sign In</a>
        </div>
    </div>
    
    <!-- JavaScript for error timeout -->
    <script>
        setTimeout(() => {
            const errorBox = document.getElementById("errorBox");
            if (errorBox) {
                errorBox.remove();
            }
        }, 3000);
    </script>
</body>
</html>