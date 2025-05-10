<%-- 
    Document   : add
    Created on : 10 May 2025, 11:01:37?am
    Author     : wanmu
--%>

<%@ page import="java.sql.*" %>
<%
    String table = request.getParameter("table");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add <%= table %></title>
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
    <h2>Add <%= table.substring(0, 1).toUpperCase() + table.substring(1) %></h2>
    <form action="insert.jsp" method="post">
        <input type="hidden" name="table" value="<%= table %>">

        <%
            if ("users".equals(table)) {
        %>
            <label>Username:</label>
            <input type="text" name="username">
            <label>Full Name:</label>
            <input type="text" name="full_name">
            <label>Phone Number:</label>
            <input type="text" name="phone">


        <%
            } else if ("train".equals(table)) {
        %>
            <label>Train Name:</label>
            <input type="text" name="train_name">

        <%
            } else if ("routes".equals(table)) {
        %>
            <label>From (Start Point):</label>
            <input type="text" name="start_point">
            <label>To (End Point):</label>
            <input type="text" name="end_point">

        <%
            } else if ("schedule".equals(table)) {
        %>
            <label>Train ID:</label>
            <input type="text" name="train_id">
            <label>Route ID:</label>
            <input type="text" name="route_id">
            <label>Departure Time:</label>
            <input type="time" name="departure_time">

            <label>Arrival Time:</label>
            <input type="time" name="arrival_time">


        <%
            } else {
        %>
            <p style="color:red;">Invalid table selected.</p>
        <%
            }
        %>

        <input type="submit" value="Add">
    </form>
</div>
</body>
</html>
