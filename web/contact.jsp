<%-- 
    Document   : contact
    Created on : 8 May 2025, 10:54:32 am
    Author     : wanmu
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - TTMS</title>
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
            align-items: flex-start;
            padding: 40px 20px;
        }

        .container {
            max-width: 600px;
            width: 100%;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            margin-top: 5px;
            border-radius: 6px;
        }

        button {
            background-color: #006699;
            color: white;
            padding: 12px;
            margin-top: 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #004d66;
        }

        .message {
            text-align: center;
            margin-top: 15px;
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
    <div class="container">
        <h2>Contact Us</h2>
        <form method="post" action="contact.jsp">
            <label>Name:</label>
            <input type="text" name="name" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Subject:</label>
            <input type="text" name="subject">

            <label>Message:</label>
            <textarea name="message" rows="5" required></textarea>

            <button type="submit">Send Message</button>
        </form>

        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");

            if (name != null && email != null && message != null) {
                Connection conn = null;
                PreparedStatement ps = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttms", "root", "");
                    String sql = "INSERT INTO contact_us (name, email, subject, message) VALUES (?, ?, ?, ?)";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, subject);
                    ps.setString(4, message);
                    int result = ps.executeUpdate();
                    if (result > 0) {
        %>
                        <div class="message" style="color: green;">Message sent successfully!</div>
        <%
                    } else {
        %>
                        <div class="message" style="color: red;">Message failed to send.</div>
        <%
                    }
                } catch (Exception e) {
        %>
                    <div class="message" style="color: red;">Error: <%= e.getMessage() %></div>
        <%
                } finally {
                    try { if (ps != null) ps.close(); } catch (Exception e) {}
                    try { if (conn != null) conn.close(); } catch (Exception e) {}
                }
            }
        %>
    </div>
</div>

<div class="footer">
    &copy; 2025 Train Ticketing Management System. All rights reserved.
</div>

</body>
</html>
