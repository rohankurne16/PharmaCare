<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
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
        
        .login-container {
            width: 100%;
            max-width: 420px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            padding: 40px;
            position: relative;
            overflow: hidden;
        }
        
        .login-container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(to right, #4a00e0, #8e2de2);
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header h2 {
            color: #4a00e0;
            font-size: 32px;
            margin-bottom: 10px;
            font-weight: 700;
        }
        
        .login-header p {
            color: #666;
            font-size: 16px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: #333;
            font-size: 14px;
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
        
        .forgot-link {
            text-align: right;
            margin-bottom: 25px;
        }
        
        .forgot-link a {
            color: #4a00e0;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
        }
        
        .forgot-link a:hover {
            text-decoration: underline;
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
        
        .login-btn {
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
        
        .login-btn:hover {
            background: linear-gradient(to right, #3a00b0, #7a1dc2);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(74, 0, 224, 0.25);
        }
        
        .login-btn:active {
            transform: translateY(0);
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid #eee;
            color: #666;
            font-size: 15px;
        }
        
        .footer a {
            color: #4a00e0;
            text-decoration: none;
            font-weight: 600;
        }
        
        .footer a:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 500px) {
            .login-container {
                padding: 30px 25px;
                border-radius: 16px;
            }
            
            .login-header h2 {
                font-size: 28px;
            }
            
            input {
                padding: 14px 14px 14px 45px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="login-container">
    <div class="login-header">
        <h2>User Login</h2>
        <p>Login with your email and password</p>
    </div>

    <form action="LoginServlet" method="post">
        <div class="form-group">
            <label>Email</label>
            <div class="input-container">
                <i class="fas fa-envelope input-icon"></i>
                <input type="email" name="email" placeholder="example@email.com" required>
            </div>
        </div>

        <div class="form-group">
            <label>Password</label>
            <div class="input-container">
                <i class="fas fa-lock input-icon"></i>
                <input type="password" name="password" placeholder="Enter your password" required>
            </div>
        </div>
        
        <div class="forgot-link">
            <a href="ForgotPassword.jsp">Forgot Password?</a>
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

        <button type="submit" class="login-btn">
            <i class="fas fa-sign-in-alt"></i> Login
        </button>
    </form>

    <div class="footer">
        Don't have an account?
        <a href="Register.jsp">Create Account</a>
    </div>
</div>

</body>
<script>
    setTimeout(() => {
        const errorBox = document.getElementById("errorBox");
        if (errorBox) {
            errorBox.remove();
        }
    }, 3000);
</script>
</html>