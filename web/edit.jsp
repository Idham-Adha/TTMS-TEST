<%-- 
    Document   : add_routes
    Created on : 10 May 2025, 10:57:41?am
    Author     : wanmu
--%>

<%@ page import="java.sql.*" %>
<%
    String table = request.getParameter("table");
    String id = request.getParameter("id");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttms", "root", "");

        if (table.equals("users")) {
            ps = conn.prepareStatement("SELECT * FROM users WHERE id=?");
        } else if (table.equals("train")) {
            ps = conn.prepareStatement("SELECT * FROM trains WHERE train_id=?");
        } else if (table.equals("routes")) {
            ps = conn.prepareStatement("SELECT * FROM routes WHERE route_id=?");
        } else if (table.equals("schedule")) {
            ps = conn.prepareStatement("SELECT * FROM schedule WHERE schedule_id=?");
        }

        ps.setInt(1, Integer.parseInt(id));
        rs = ps.executeQuery();

        if (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit <%= table %></title>
    <style>
        body { font-family: Arial; background-color: #f0f8ff; }
        .form-container {
            width: 500px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h2 { text-align: center; margin-bottom: 20px; }
        label { display: block; margin-top: 10px; }
        input[type="text"] {
            width: 100%; padding: 10px; margin-top: 5px; border-radius: 6px; border: 1px solid #ccc;
        }
        input[type="submit"] {
            margin-top: 20px; width: 100%;
            padding: 10px; background-color: #007bff; color: white;
            border: none; border-radius: 6px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Edit <%= table.substring(0, 1).toUpperCase() + table.substring(1) %></h2>
    <form action="update.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <input type="hidden" name="table" value="<%= table %>">

        <%
            if (table.equals("users")) {
        %>
            <label>Username:</label>
            <input type="text" name="username" value="<%= rs.getString("username") %>">
            <label>Full Name:</label>
            <input type="text" name="full_name" value="<%= rs.getString("full_name") %>">
            <label>Phone Number:</label>
            <input type="text" name="phone" value="<%= rs.getString("phone_number")%>">

        <%
            } else if (table.equals("train")) {
        %>
            <label>Train Name:</label>
            <input type="text" name="train_name" value="<%= rs.getString("train_name") %>">
        <%
            } else if (table.equals("routes")) {
        %>
            <label>From (Start Point):</label>
            <input type="text" name="start_point" value="<%= rs.getString("start_point") %>">
            <label>To (End Point):</label>
            <input type="text" name="end_point" value="<%= rs.getString("end_point") %>">
        <%
            } else if (table.equals("schedule")) {
        %>
            <label>Train ID:</label>
            <input type="text" name="train_id" value="<%= rs.getInt("train_id") %>">
            <label>Route ID:</label>
            <input type="text" name="route_id" value="<%= rs.getInt("route_id") %>">
            <label>Departure Time:</label>
            <input type="text" name="departure_time" value="<%= rs.getString("departure_time") %>">
            <label>Arrival Time:</label>
            <input type="text" name="arrival_time" value="<%= rs.getString("arrival_time") %>">
        <%
            }
        %>

        <input type="submit" value="Update">
    </form>
</div>
</body>
</html>
<%
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if (rs != null) rs.close(); if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
%>
