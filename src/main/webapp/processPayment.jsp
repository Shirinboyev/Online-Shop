<%@ page import="uz.pdp.lesson.model.orders.OrderDetails" %>
<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="uz.pdp.lesson.model.cart.Cart" %><%--
  Created by IntelliJ IDEA.
  User: sherz
  Date: 7/17/2024
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Details</title>
    <!-- Include Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <!-- Include Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            text-align: center;
        }

        h2 {
            color: #17a2b8;
            font-weight: 700;
        }

        p {
            color: #333;
            font-size: 1.1em;
            margin: 10px 0;
        }

        .btn {
            background-color: #28a745;
            color: #ffffff;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        .user-details, .order-details {
            margin-bottom: 20px;
        }

        .animate__animated.animate__fadeIn {
            animation-duration: 1s;
        }
    </style>
</head>
<body>
<%
    User user = (User) request.getAttribute("user");
    OrderDetails orderDetails = (OrderDetails) request.getAttribute("orderDetails");

    if (user != null && orderDetails != null) {
        double price = orderDetails.getPrice();
        Timestamp orderedDate = orderDetails.getOrdered_date();
        String email = user.getEmail();
        String fullname = user.getFullname();
%>
<div class="container animate__animated animate__fadeIn">
    <div class="user-details">
        <h2>User Details</h2>
        <p>Full Name: <%= fullname %></p>
        <p>Email: <%= email %></p>
    </div>

    <div class="order-details">
        <h2>Order Details</h2>

        <p>Price: <%= price %>$</p>
        <p>Ordered Time: <%= orderedDate %></p>
    </div>

    <form action="home" method="get">
        <button type="submit" class="btn">Go To Buy</button>
        <% Cart cart = new Cart();
        cart.setPaid(true);
        %>
    </form>
</div>
<%
} else {
%>
<p>User or Order Details are missing.</p>
<%
    }
%>
</body>
</html>
