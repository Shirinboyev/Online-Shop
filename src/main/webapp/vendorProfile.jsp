<%@ page import="backend.model.user.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vendor Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendorProfile.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');
        @import url('https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css');

        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #333;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            overflow: hidden;
            position: relative;
        }

        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: linear-gradient(45deg, #ff5733, #17a2b8, #28a745);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .navbar {
            background-color: transparent;
            padding: 10px 20px;
            text-align: right;
            box-shadow: none;
            position: absolute;
            top: 0;
            right: 0;
            z-index: 1;
        }

        .navbar a {
            text-decoration: none;
            color: #ff5733;
            font-weight: bold;
            margin-left: 20px;
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: #fff;
        }

        .container {
            max-width: 800px;
            margin: 20px;
            padding: 40px;
            background-color: rgba(68, 68, 68, 0.9);
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
            text-align: center;
            position: relative;
            animation: fadeInUp 1s;
        }

        h1 {
            color: #17a2b8;
            margin-bottom: 30px;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .buttons a {
            text-decoration: none;
        }

        button {
            background-color: #17a2b8;
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #138496;
        }

        p {
            color: #28a745;
        }
    </style>
</head>
<body>
<div class="background"></div>
<div class="navbar">
    <a href="${pageContext.request.contextPath}/logout">Log Out</a>
</div>
<div class="container animate__animated animate__fadeInUp">
    <% User user = (User) request.getAttribute("user"); %>
    <h1>Welcome to Your Profile, <%= user != null ? user.getFullname() : "Guest" %></h1>

    <div class="buttons">
        <a href="${pageContext.request.contextPath}/myMarkets">
            <button class="btn">My Markets</button>
        </a>
        <a href="${pageContext.request.contextPath}/createMarket">
            <button class="btn">Create Markets</button>
        </a>
        <a href="${pageContext.request.contextPath}/myProducts">
            <button class="btn">My Products</button>
        </a>
    </div>

    <% if (request.getAttribute("result") != null) { %>
    <p><%= request.getAttribute("result") %></p>
    <% } %>
</div>

<script src="${pageContext.request.contextPath}/js/logoutConfirmation.js"></script>
</body>
</html>
