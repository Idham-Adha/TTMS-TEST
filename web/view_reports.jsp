<%-- 
    Document   : view_report
    Created on : 10 May 2025, 7:30:16?am
    Author     : wanmu
--%>


<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f8fc;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #004080;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #004080;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #eaf2f8;
        }
    </style>
</head>
<body>

<h2>Ticket Booking Report</h2>

<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttms", "root", "");

        String sql = "SELECT b.booking_id, u.full_name, t.train_name, s.departure_time, s.arrival_time, b.seat_class, p.amount, p.payment_method " +
                     "FROM bookings b " +
                     "JOIN users u ON b.user_id = u.id " +
                     "JOIN schedule s ON b.schedule_id = s.schedule_id " +
                     "JOIN trains t ON s.train_id = t.train_id " +
                     "JOIN payments p ON b.booking_id = p.booking_id " +
                     "ORDER BY b.booking_id DESC";

        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
%>

<table>
    <tr>
        <th>Booking ID</th>
        <th>User</th>
        <th>Train</th>
        <th>Departure</th>
        <th>Arrival</th>
        <th>Seat Class</th>
        <th>Amount (RM)</th>
        <th>Payment Method</th>
    </tr>

<%
        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("booking_id") %></td>
        <td><%= rs.getString("full_name") %></td>
        <td><%= rs.getString("train_name") %></td>
        <td><%= rs.getString("departure_time") %></td>
        <td><%= rs.getString("arrival_time") %></td>
        <td><%= rs.getString("seat_class") %></td>
        <td>RM<%= rs.getDouble("amount") %></td>
        <td><%= rs.getString("payment_method") %></td>
    </tr>
<%
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading report: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
</table>

    <div style="text-align: center; margin: 20px 0;">
        <form action="admin_dashboard.jsp" method="get">
            <button type="submit" style="padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 5px;">
                Back to Main Page
            </button>
        </form>
    </div>

</body>
</html>
