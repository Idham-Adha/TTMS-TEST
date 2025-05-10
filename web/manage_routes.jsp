<%-- 
    Document   : manage_routes
    Created on : 10 May 2025, 7:29:20?am
    Author     : wanmu
--%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Manage Routes</title>
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
        <h2>Manage Routes</h2>
    </div>
    <div class="top-btn">
        <a href="add.jsp?table=routes" class="btn">+ Add Route</a>
        <a href="admin_dashboard.jsp" class="btn">Back to Dashboard</a>
    </div>
    <table>
        <tr>
            <th>Route ID</th>
            <th>From</th>
            <th>To</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttms", "root", "");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM routes");
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("route_id") %></td>
            <td><%= rs.getString("start_point") %></td>
            <td><%= rs.getString("end_point") %></td>
            <td>
                <a class="btn" href="edit.jsp?id=<%= rs.getInt("route_id") %>&table=routes">Edit</a>
                <a class="btn" href="delete.jsp?id=<%= rs.getInt("route_id") %>&table=routes" onclick="return confirm('Delete this route?');">Delete</a>
            </td>
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch(Exception e) {
                out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</div>
</body>
</html>
