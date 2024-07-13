<%@ page import="uz.pdp.lesson.model.market.Market" %>
<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendorProfile.css">
</head>
<body>
<div class="navbar">
    <a href="${pageContext.request.contextPath}/">
        <h1>want to shop?</h1>
    </a>
</div>
<div class="container">
    <% User user = (User) request.getAttribute("user"); %>
    <h1>Welcome to Your Profile, <%= user != null ? user.getFullname() : "Guest" %></h1>

    <div class="buttons">
        <a href="${pageContext.request.contextPath}/myMarkets">
            <button class="btn">My Markets</button>
        </a>
        <a href="${pageContext.request.contextPath}/createMarket.jsp">
            <button class="btn">Create Markets</button>
        </a>
        <a href="${pageContext.request.contextPath}/myProducts.jsp">
            <button class="btn">My Products</button>
        </a>
    </div>

    <% if (request.getAttribute("result") != null) { %>
    <p><%= request.getAttribute("result") %></p>
    <% } %>
</div>
</body>
</html>
