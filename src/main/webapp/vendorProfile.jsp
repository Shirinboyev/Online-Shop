<%@ page import="uz.pdp.lesson.model.user.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vendor Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendorProfile.css">
    <style>
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
        }

        .navbar {
            background-color: transparent;
            padding: 10px 20px;
            text-align: right;
            box-shadow: none;
            position: absolute;
            top: 0;
            right: 0;
        }

        .navbar a {
            text-decoration: none;
            color: #ff5733;
            font-weight: bold;
            margin-left: 20px;
        }

        .container {
            max-width: 800px;
            margin: 20px;
            padding: 40px;
            background-color: #444;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
            text-align: center;
            position: relative;
        }

        h1 {
            color: #17a2b8;
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
<div class="navbar">
    <a href="${pageContext.request.contextPath}/logout">Log Out</a>
</div>
<div class="container">
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
