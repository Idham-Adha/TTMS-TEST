<%-- 
    Document   : home
    Created on : 6 May 2025, 7:43:20?am
    Author     : wanmu
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Train Ticketing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --primary: #ff6f61;
            --secondary: #42a5f5;
            --accent: #66bb6a;
            --text-light: #ffffff;
        }

        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            overflow-x: hidden;
            scroll-behavior: smooth;
        }

        .hero {
            height: 100vh;
            background: linear-gradient(135deg, var(--primary), var(--secondary), var(--accent));
            background-size: 400% 400%;
            animation: gradientShift 10s ease infinite;
            color: var(--text-light);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 10px;
            animation: fadeInDown 1s ease-in-out;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 40px;
            animation: fadeInUp 1s ease-in-out;
        }

        .buttons {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        .btn {
            background-color: rgba(255, 255, 255, 0.2);
            border: 2px solid white;
            color: white;
            padding: 14px 30px;
            font-size: 16px;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.3s ease;
            backdrop-filter: blur(4px);
        }

        .btn:hover {
            background-color: white;
            color: var(--primary);
            transform: scale(1.05);
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @media (max-width: 600px) {
            .hero h1 {
                font-size: 2rem;
            }

            .btn {
                width: 100%;
                text-align: center;
            }

            .buttons {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

<div class="hero">
    <h1>Train Ticketing System</h1>
    <p>Fast. Simple. Efficient. Book and manage your tickets anytime.</p>
    <div class="buttons">
        <a href="login.jsp" class="btn">Login</a>
        <a href="register.jsp" class="btn">Register</a>
        <a href="schedule.jsp" class="btn">View Schedule</a>
        <a href="contact.jsp" class="btn">Contact Us</a>
        <a href="about.jsp" class="btn">About</a>
    </div>
</div>

</body>
</html>
