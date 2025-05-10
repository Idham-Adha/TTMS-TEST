<%-- 
    Document   : register
    Created on : 6 May 2025, 7:41:55?am
    Author     : wanmu
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Account</title>
    <style>
        body {
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background: #1e2a38;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 25px rgba(0,0,0,0.6);
            width: 400px;
        }
        .form-container h2 {
            margin-bottom: 20px;
            font-weight: 600;
            color: #00d4ff;
            text-align: center;
        }
        input, select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            background-color: #2f3e51;
            color: #fff;
            font-size: 14px;
        }
        button {
            width: 100%;
            padding: 12px;
            background: #00d4ff;
            border: none;
            border-radius: 8px;
            color: #000;
            font-weight: bold;
            cursor: pointer;
        }
        .message {
            margin-top: 20px;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
        }
        .success {
            background-color: #4CAF50;
            color: white;
        }
        .error {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Create Account</h2>
    <form method="post" action="register.jsp">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <select name="role" required>
            <option value="">Select Role</option>
            <option value="user">User</option>
            <option value="admin">Admin</option>
        </select>
        <input type="text" name="fullName" placeholder="Full Name" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="text" name="phone" placeholder="Phone Number" required />
        <button type="submit">Register</button>
    </form>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role = request.getParameter("role");
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    if (username != null && password != null && role != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ttms", "root", "");
            String sql = "INSERT INTO users (username, password, role, full_name, email, phone) VALUES (?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);
            ps.setString(4, fullName);
            ps.setString(5, email);
            ps.setString(6, phone);

            int result = ps.executeUpdate();
            if (result > 0) {
%>
                <div class="message success">Registration successful! Redirecting to login page...</div>
                <script>
                    setTimeout(function() {
                        window.location.href = 'login.jsp';
                    }, 3000);
                </script>
<%
            } else {
%>
                <div class="message error">Registration failed. Please try again.</div>
<%
            }

        } catch (Exception e) {
%>
            <div class="message error">Error: <%= e.getMessage() %></div>
<%
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
%>
</div>

</body>
</html>
