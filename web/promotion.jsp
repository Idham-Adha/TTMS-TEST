<%-- 
    Document   : promotion
    Created on : 8 May 2025, 11:20:29 am
    Author     : wanmu
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Promotions - TTMS</title>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
        }

        header {
            background-color: #003366;
            color: white;
            padding: 20px 40px;
            text-align: center;
        }

        h1 {
            margin: 0;
            font-size: 28px;
        }

        .promo-container {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 40px;
            gap: 30px;
        }

        .promo-card {
            background-color: white;
            width: 300px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            padding: 20px;
            transition: transform 0.3s;
        }

        .promo-card:hover {
            transform: scale(1.03);
        }

        .promo-title {
            font-size: 20px;
            color: #006699;
            margin-bottom: 10px;
        }

        .promo-details {
            color: #555;
            font-size: 15px;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #006699;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 15px 0;
        }
    </style>
</head>
<body>

<header>
    <h1>Train Ticket Promotions</h1>
</header>

<div class="promo-container">
    <div class="promo-card">
        <div class="promo-title">Weekend Saver</div>
        <div class="promo-details">Enjoy 10% off on all weekend bookings! Valid for Economy class only.</div>
    </div>

    <div class="promo-card">
        <div class="promo-title">Early Bird Offer</div>
        <div class="promo-details">Book your train tickets 7 days early and get 15% off.</div>
    </div>

    <div class="promo-card">
        <div class="promo-title">Student Promo</div>
        <div class="promo-details">Students enjoy 20% discount with valid student ID.</div>
    </div>

    <div class="promo-card">
        <div class="promo-title">Family Pack</div>
        <div class="promo-details">Buy 4 tickets and get 1 free. Great for families!</div>
    </div>
</div>

<a href="dashboard.jsp" class="back-link">← Back to Dashboard</a>

<div class="footer">
    &copy; 2025 Train Ticketing Management System. All rights reserved.
</div>

</body>
</html>
