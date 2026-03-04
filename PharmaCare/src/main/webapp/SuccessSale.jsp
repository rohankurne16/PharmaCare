<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sale Successful | PharmaCare</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f5f7fa;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .success-card {
        background: white;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        text-align: center;
        max-width: 400px;
    }

    .success-card i {
        font-size: 50px;
        color: #1a73e8;
        margin-bottom: 20px;
    }

    .success-card h2 {
        font-size: 24px;
        color: #202124;
        margin-bottom: 10px;
    }

    .success-card p {
        font-size: 16px;
        color: #5f6368;
        margin-bottom: 20px;
    }

    .success-card a {
        text-decoration: none;
        background: #1a73e8;
        color: white;
        padding: 12px 25px;
        border-radius: 8px;
        font-weight: 600;
        transition: 0.3s;
    }

    .success-card a:hover {
        background: #1558b0;
    }
</style>
</head>
<body>

<div class="success-card">
    <i class="fas fa-check-circle"></i>
    <h2>Sale Recorded Successfully!</h2>
    <p>The medicine sale has been added to your inventory records.</p>
    <a href="AddSale.jsp">Add Another Sale</a>
</div>

</body>
</html>
