<%-- 
    Document   : insert
    Created on : 10 May 2025, 11:02:17?am
    Author     : wanmu
--%>

<%@ page import="java.sql.*" %>
<%
    String table = request.getParameter("table");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttms", "root", "");

        if ("users".equals(table)) {
            String username = request.getParameter("username");
            String full_name = request.getParameter("full_name");
            String phone_number = request.getParameter("phone");
            ps = conn.prepareStatement("INSERT INTO users (username, full_name, phone_number) VALUES (?, ?)");
            ps.setString(1, username);
            ps.setString(2, full_name);
            ps.setString(3, phone_number);

        } else if ("train".equals(table)) {
            String train_name = request.getParameter("train_name");
            ps = conn.prepareStatement("INSERT INTO trains (train_name) VALUES (?)");
            ps.setString(1, train_name);

        } else if ("routes".equals(table)) {
            String start_point = request.getParameter("start_point");
            String end_point = request.getParameter("end_point");
            ps = conn.prepareStatement("INSERT INTO routes (start_point, end_point) VALUES (?, ?)");
            ps.setString(1, start_point);
            ps.setString(2, end_point);

        } else if ("schedule".equals(table)) {
            int train_id = Integer.parseInt(request.getParameter("train_id"));
            int route_id = Integer.parseInt(request.getParameter("route_id"));
            String departure_time = request.getParameter("departure_time");
            String arrival_time = request.getParameter("arrival_time");
            ps = conn.prepareStatement("INSERT INTO schedule (train_id, route_id, departure_time, arrival_time) VALUES (?, ?, ?, ?)");
            ps.setInt(1, train_id);
            ps.setInt(2, route_id);
            ps.setString(3, departure_time);
            ps.setString(4, arrival_time);
        }

        if (ps != null) ps.executeUpdate();

        String redirect = "manage_" + table + ".jsp";
        if ("train".equals(table)) redirect = "manage_trains.jsp";
        response.sendRedirect(redirect);

    } catch (Exception e) {
        out.println("<p>Error inserting into " + table + ": " + e.getMessage() + "</p>");
    } finally {
        try { if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
%>
