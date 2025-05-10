<%-- 
    Document   : manage_schedule
    Created on : 10 May 2025, 7:29:54?am
    Author     : wanmu
--%>

<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Manage Schedules</title>
    <style>
        body { font-family: Arial; background-color: #f0f8ff; }
        .container { width: 80%; margin: 0 auto; padding-top: 30px; }
        table { width: 100%; margin-top: 20px; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: center; }
        th { background-color: #007bff; color: white; }
        a.btn { padding: 5px 12px; margin: 0 3px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px; display: inline-block; }
        a.btn:hover { background-color: #0056b3; }
        .header { text-align: center; margin-bottom: 20px; }
        .top-btn { text-align: center; margin-bottom: 20px; }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h2>Manage Schedules</h2>
    </div>
    <div class="top-btn">
        <a href="add.jsp?table=schedule" class="btn">+ Add Schedule</a>
        <a href="admin_dashboard.jsp" class="btn">Back to Dashboard</a>
    </div>
    <table>
        <tr>
            <th>Schedule ID</th>
            <th>Train ID</th>
            <th>Route ID</th>
            <th>Departure</th>
            <th>Arrival</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttms", "root", "");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM schedule");
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("schedule_id") %></td>
            <td><%= rs.getInt("train_id") %></td>
            <td><%= rs.getInt("route_id") %></td>
            <td><%= rs.getString("departure_time") %></td>
            <td><%= rs.getString("arrival_time") %></td>
            <td>
                <a class="btn" href="edit.jsp?id=<%= rs.getInt("schedule_id") %>&table=schedule">Edit</a>
                <a class="btn" href="delete.jsp?id=<%= rs.getInt("schedule_id") %>&table=schedule" onclick="return confirm('Delete this schedule?');">Delete</a>
            </td>
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch(Exception e) {
                out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</div>
</body>
</html>
