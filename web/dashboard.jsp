<%-- 
    Document   : dashboard
    Created on : 8 May 2025, 11:14:56?am
    Author     : wanmu
--%>

<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // If admin tries to access this dashboard, redirect to admin_dashboard
    if ("admin".equals(user.getRole())) {
        response.sendRedirect("admin_dashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .navbar {
            display: flex;
            justify-content: center;
            background-color: #003366;
            padding: 15px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            position: relative;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 30px;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s;
        }
        .navbar a:hover {
            background-color: #005999;
        }
        .logout {
            position: absolute;
            top: 20px;
            right: 30px;
            color: #fff;
            font-size: 14px;
        }
        .status-box {
            margin: 60px auto;
            background: white;
            border-radius: 10px;
            width: 60%;
            padding: 40px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .status-box h2 {
            color: #333;
            font-size: 26px;
            margin-bottom: 15px;
        }
        .role-badge {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="schedule.jsp">Schedule</a>
    <a href="book_ticket.jsp">Tickets & Prices</a>
    <a href="promotion.jsp">Promotion</a>
    <a href="contact.jsp">Customer Support</a>
    <a class="logout" href="logout.jsp">Logout</a>
</div>

<div class="status-box">
    <h2>RAIL SERVICE STATUS: NORMAL</h2>
    <p>Welcome, <strong><%= user.getFullName() %></strong>!</p>
    <div class="role-badge">Role: <%= user.getRole() %></div>
</div>

</body>
</html>
