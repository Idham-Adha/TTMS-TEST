<%-- 
    Document   : book_ticket
    Created on : 6 May 2025, 7:43:32?am
    Author     : wanmu
--%>

<%@ page import="java.sql.*, model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String bookingId = request.getParameter("bookingId");
    boolean showPayment = bookingId != null && !bookingId.isEmpty();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Train Ticket</title>
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
            display: flex;
            justify-content: center;
            padding: 40px 20px;
        }

        .form-box {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            width: 100%;
            background-color: #006699;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            margin-top: 25px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #004d66;
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
    <div class="form-box">
        <% if (!showPayment) { %>
        <h2>Book a Train Ticket</h2>
        <form method="post" action="bookTicket.jsp">
            <label for="scheduleId">Select Schedule:</label>
            <select name="scheduleId" required>
                <%
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttms", "root", "");
                        String sql = "SELECT schedule_id, departure_time, arrival_time FROM schedule";
                        ps = conn.prepareStatement(sql);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            int sid = rs.getInt("schedule_id");
                            String dep = rs.getString("departure_time");
                            String arr = rs.getString("arrival_time");
                %>
                    <option value="<%= sid %>">Schedule <%= sid %> (Dep: <%= dep %>, Arr: <%= arr %>)</option>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<option>Error loading schedules</option>");
                    } finally {
                        try { if (rs != null) rs.close(); } catch (Exception e) {}
                        try { if (ps != null) ps.close(); } catch (Exception e) {}
                        try { if (conn != null) conn.close(); } catch (Exception e) {}
                    }
                %>
            </select>

            <label for="seatClass">Class:</label>
            <select name="seatClass" required>
                <option value="Economy">Economy</option>
                <option value="Business">Business</option>
                <option value="Premium">Premium</option>
            </select>

            <input type="hidden" name="userId" value="<%= user.getId() %>">

            <button type="submit">Book Ticket</button>
        </form>

        <% } else { %>
        <h2>Make a Payment</h2>
        <form method="post" action="makePayment.jsp">
            <input type="hidden" name="bookingId" value="<%= bookingId %>">

            <label>Amount (RM):</label>
            <input type="text" name="amount" required>

            <label>Payment Method:</label>
            <select name="method" required>
                <option value="Credit Card">Credit Card</option>
                <option value="Online Banking">Online Banking</option>
                <option value="Digital Wallet">Digital Wallet</option>
            </select>

            <button type="submit">Pay Now</button>
        </form>
        <% } %>
    </div>
</div>

<div class="footer">
    &copy; 2025 Train Ticketing Management System. All rights reserved.
</div>

</body>
</html>