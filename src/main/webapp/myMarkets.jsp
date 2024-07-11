<%@ page import="uz.pdp.lesson.model.market.Market" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Markets</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myMarkets.css">
</head>
<body>
<div class="container">
    <h2>Your Markets</h2>
    <% if (request.getAttribute("markets") != null) { %>
    <div class="market-list">
        <% for (Market market : (List<Market>) request.getAttribute("markets")) { %>
        <div class="market-item">
            <form action="${pageContext.request.contextPath}/myMarkets" method="get">
                <input type="hidden" name="marketId" value="<%= market.getId() %>">
                <button type="submit" class="market-btn"><%= market.getName() %></button>
            </form>
            <form action="${pageContext.request.contextPath}/vendorProfile" method="post" class="product-form">
                <input type="hidden" name="action" value="addProduct">
                <input type="hidden" name="marketId" value="<%= market.getId() %>">
                <label for="productName">Product Name:</label>
                <input type="text" id="productName" name="productName" required>
                <label for="productPrice">Product Price:</label>
                <input type="text" id="productPrice" name="productPrice" required>
                <label for="productDescription">Product Description:</label>
                <textarea id="productDescription" name="productDescription" required></textarea>
                <label for="productCount">Product Count:</label>
                <input type="text" id="productCount" name="productCount" required>
                <label for="productImageUrl">Product Image URL:</label>
                <input type="text" id="productImageUrl" name="productImageUrl" required>
                <button type="submit" class="add-btn">Add Product</button>
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
