<%-- 
    Document   : admin_dashboard
    Created on : 10 May 2025, 7:23:48?am
    Author     : wanmu
--%>

<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #eaf4fb;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .dashboard-container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 30px;
            color: #003366;
        }

        .dashboard-container form {
            margin: 10px 0;
        }

        .dashboard-button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .dashboard-button:hover {
            background-color: #0056b3;
        }

        .button-row {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .half-button {
            flex: 1;
        }

        .logout-button {
            margin-top: 30px;
            background-color: #dc3545;
        }

        .logout-button:hover {
            background-color: #b02a37;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>HI, Admin!</h2>

        <form action="manage_users.jsp" method="get">
            <button class="dashboard-button" type="submit">Manage User</button>
        </form>

        <form action="manage_trains.jsp" method="get">
            <button class="dashboard-button" type="submit">Manage Train</button>
        </form>

        <form action="manage_routes.jsp" method="get">
            <button class="dashboard-button" type="submit">Manage Route</button>
        </form>

        <div class="button-row">
            <form action="manage_schedule.jsp" method="get" class="half-button">
                <button class="dashboard-button" type="submit">Manage Schedule</button>
            </form>

            <form action="view_reports.jsp" method="get" class="half-button">
                <button class="dashboard-button" type="submit">View Report</button>
            </form>
        </div>

        <form action="logout.jsp" method="post">
            <button class="dashboard-button logout-button" type="submit">Logout</button>
        </form>
    </div>
</body>
</html>
