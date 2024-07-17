<%@ page import="uz.pdp.lesson.model.orders.OrderDetails" %>
<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page import="java.sql.Timestamp" %><%--
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
    <link rel="stylesheet" href="css/processPayment.css">
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
<div class="user-details">
    <h2>User Details</h2>
    <p>Full Name: <%= fullname %></p>
    <p>Email: <%= email %></p>
</div>

<div class="order-details">
    <h2>Order Details</h2>
    <p>Price: <%= price %> UZS</p>
    <br>
    <p>Ordered time : <%= orderedDate %> </p>

</div>
<div>
    <form action="home" method="get" class="payment-form mt-3">
        <button type="submit" class="btn btn-success">Go To Buy</button>
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
