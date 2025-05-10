<%-- 
    Document   : schedule
    Created on : 6 May 2025, 7:44:49?am
    Author     : wanmu
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Train Schedule</title>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            height: 100%;
            display: flex;
            flex-direction: column;
            background: #f0f8ff;
        }

        .navbar {
            background-color: #003366;
            padding: 15px 0;
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-shrink: 0;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .navbar a:hover {
            background-color: #005999;
        }

        .main-content {
            flex: 1;
            padding: 40px 20px;
        }

        h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 30px;
        }

        table {
            margin: auto;
            width: 90%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ccc;
            padding: 14px;
            text-align: center;
        }

        th {
            background-color: #006699;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f4f9fc;
        }

        tr:hover {
            background-color: #e0f7fa;
        }

        .footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 15px 0;
            flex-shrink: 0;
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="dashboard.jsp">Dashboard</a>
    <a href="schedule.jsp">Schedule</a>
    <a href="book_ticket.jsp">Tickets</a>
    <a href="promotion.jsp">Promotion</a>
    <a href="contact.jsp">Customer Support</a>
</div>

<div class="main-content">
    <h2>Train Schedule</h2>

    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver"); // or "com.mysql.cj.jdbc.Driver" for MySQL 8
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttms", "root", "");
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM schedule");

            out.println("<table>");
            out.println("<tr><th>Schedule ID</th><th>Train ID</th><th>Route ID</th><th>Departure</th><th>Arrival</th></tr>");

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("schedule_id") + "</td>");
                out.println("<td>" + rs.getInt("train_id") + "</td>");
                out.println("<td>" + rs.getInt("route_id") + "</td>");
                out.println("<td>" + rs.getString("departure_time") + "</td>");
                out.println("<td>" + rs.getString("arrival_time") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
        } catch(Exception e) {
            out.println("<p style='text-align:center; color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    %>
</div>

<div class="footer">
    &copy; 2025 Train Ticketing Management System. All rights reserved.
</div>

</body>
</html>
