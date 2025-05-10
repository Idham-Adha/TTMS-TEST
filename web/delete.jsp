<%-- 
    Document   : delete
    Created on : 10 May 2025, 11:00:42?am
    Author     : wanmu
--%>

<%@ page import="java.sql.*" %>
<%
    String table = request.getParameter("table");
    String id = request.getParameter("id");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttms", "root", "");

        if ("users".equals(table)) {
            ps = conn.prepareStatement("DELETE FROM users WHERE id=?");
            ps.setInt(1, Integer.parseInt(id));

        } else if ("train".equals(table)) {
            ps = conn.prepareStatement("DELETE FROM trains WHERE train_id=?");
            ps.setInt(1, Integer.parseInt(id));

        } else if ("routes".equals(table)) {
            ps = conn.prepareStatement("DELETE FROM routes WHERE route_id=?");
            ps.setInt(1, Integer.parseInt(id));

        } else if ("schedule".equals(table)) {
            ps = conn.prepareStatement("DELETE FROM schedule WHERE schedule_id=?");
            ps.setInt(1, Integer.parseInt(id));
        }

        if (ps != null) ps.executeUpdate();

        String redirect = "manage_" + table + ".jsp";
        if ("train".equals(table)) redirect = "manage_trains.jsp";
        response.sendRedirect(redirect);

    } catch (Exception e) {
        out.println("<p>Error deleting from " + table + ": " + e.getMessage() + "</p>");
    } finally {
        try { if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
%>
