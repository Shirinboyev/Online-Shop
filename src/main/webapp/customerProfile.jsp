<%--
Dastlabki
<%@ page import="uz.pdp.lesson.model.market.Market" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerProfile.css">
</head>
<body>
<div>
    <a href="/">
        <h1>want to shop ?</h1>
    </a>
</div>
<div class="container">
    <% User user = (User) request.getAttribute("user"); %>
    <h1>Welcome to Your Profile, <%= user != null ? user.getFullname() : "Guest" %></h1>

    <h2>Create a New Market</h2>
    <form action="${pageContext.request.contextPath}/customerProfile" method="post">
        <input type="hidden" name="action" value="createMarket">
        <label for="marketName">Market Name: </label>
        <input type="text" id="marketName" name="marketName" required>
        <button type="submit">Create Market</button>
    </form>

    <% if (request.getAttribute("result") != null) { %>
    <p><%= request.getAttribute("result") %></p>
    <% } %>

    <h2>Your Markets</h2>
    <% if (request.getAttribute("markets") != null) { %>
    <div class="market-list">
        <% for (Market market : (List<Market>) request.getAttribute("markets")) { %>
        <div class="market-item">
            <form action="${pageContext.request.contextPath}/marketProducts" method="get">
                <input type="hidden" name="marketId" value="<%= market.getId() %>">
                <button type="submit"><%= market.getName() %></button>
            </form>
        </div>
        <% } %>
    </div>
    <% } else { %>
    <p>No markets created yet.</p>
    <% } %>
</div>
</body>
</html>
--%>
<%@ page import="uz.pdp.lesson.model.market.Market" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerProfile.css">
</head>
<body>
<div>
    <a href="/">
        <h1>want to shop ?</h1>
    </a>
</div>
<div class="container">
    <% User user = (User) request.getAttribute("user"); %>
    <h1>Welcome to Your Profile, <%= user != null ? user.getFullname() : "Guest" %></h1>

    <h2>Create a New Market</h2>
    <form action="${pageContext.request.contextPath}/customerProfile" method="post">
        <input type="hidden" name="action" value="createMarket">
        <label for="marketName">Market Name: </label>
        <input type="text" id="marketName" name="marketName" required>
        <button type="submit">Create Market</button>
    </form>

    <% if (request.getAttribute("result") != null) { %>
    <p><%= request.getAttribute("result") %></p>
    <% } %>

    <h2>Your Markets</h2>
    <% if (request.getAttribute("markets") != null) { %>
    <div class="market-list">
        <% for (Market market : (List<Market>) request.getAttribute("markets")) { %>
        <div class="market-item">
            <form action="${pageContext.request.contextPath}/marketProducts" method="get">
                <input type="hidden" name="marketId" value="<%= market.getId() %>">
                <button type="submit"><%= market.getName() %></button>
            </form>
            <form action="${pageContext.request.contextPath}/customerProfile" method="post">
                <input type="hidden" name="action" value="addProduct">
                <input type="hidden" name="marketId" value="<%= market.getId() %>">
                <label for="productName">Product Name: </label>
                <input type="text" id="productName" name="productName" required>
                <label for="productPrice">Product Price: </label>
                <input type="text" id="productPrice" name="productPrice" required>
                <label for="productDescription">Product Description: </label>
                <textarea id="productDescription" name="productDescription" required></textarea>
                <label for="productCount">Product Count: </label>
                <input type="text" id="productCount" name="productCount" required>
                <label for="productImageUrl">Product Image URL: </label>
                <input type="text" id="productImageUrl" name="productImageUrl" required>
                <button type="submit">Add Product</button>
            </form>
        </div>
        <% } %>
    </div>
    <% } else { %>
    <p>No markets created yet.</p>
    <% } %>
</div>
</body>
</html>
